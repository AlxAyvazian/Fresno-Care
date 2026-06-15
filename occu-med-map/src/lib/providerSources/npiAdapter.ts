import type { ProviderSourceAdapter, ProviderCandidate } from './types';
import { getTaxonomiesForCategory } from '../npiTaxonomies';

const DEBUG = true;
function log(stage: string, data: unknown) {
  if (DEBUG) {
    // eslint-disable-next-line no-console
    console.log(`[NPI Adapter] ${stage}`, data);
  }
}

function bestAddress(addresses: any[] = []): any {
  return addresses.find((a) => a.address_purpose === 'LOCATION') || addresses[0] || {};
}

function formatAddress(addr: any): { full: string; city: string; state: string; postalCode: string } {
  return {
    full: [addr.address_1, addr.city, addr.state, addr.postal_code?.slice?.(0, 5)].filter(Boolean).join(', '),
    city: addr.city || '',
    state: addr.state || '',
    postalCode: addr.postal_code || '',
  };
}

async function searchNpiTaxonomy(
  city: string,
  state: string,
  taxonomy: string,
  limit: number,
): Promise<{ candidates: ProviderCandidate[]; url: string }> {
  const params = new URLSearchParams({
    version: '2.1',
    city: city.trim(),
    state: state.trim().toUpperCase(),
    taxonomy_description: taxonomy,
    limit: String(limit),
  });
  const url = `https://npiregistry.cms.hhs.gov/api/?${params.toString()}`;
  log('API URL', url);

  const resp = await fetch(url, { signal: AbortSignal.timeout(10000) });
  if (!resp.ok) throw new Error(`NPI ${resp.status}`);
  const data = (await resp.json()) as { results?: any[] };
  const raw = data.results || [];

  const candidates: ProviderCandidate[] = raw.map((r) => {
    const basic = r.basic || {};
    const addr = bestAddress(r.addresses || []);
    const tax = r.taxonomies?.find((t: any) => t.primary) || r.taxonomies?.[0] || {};
    const isOrg = r.enumeration_type === 'NPI-2';
    const name = isOrg
      ? (basic.organization_name || basic.organization_name_2 || 'Unknown Organization')
      : [basic.first_name, basic.middle_name, basic.last_name].filter(Boolean).join(' ').trim() || 'Unknown Provider';
    const npi = String(r.number || '');
    const addressFmt = formatAddress(addr);

    return {
      id: `npi-${npi}`,
      name,
      address: addressFmt.full,
      city: addressFmt.city,
      state: addressFmt.state,
      postalCode: addressFmt.postalCode,
      phone: addr.telephone_number || '',
      website: '',
      npi,
      taxonomy: tax.desc || taxonomy,
      taxonomyCode: tax.code || '',
      source: 'NPI',
      sourceDetail: `NPI ${r.enumeration_type || ''}`.trim(),
      sourceUrl: npi ? `https://npiregistry.cms.hhs.gov/provider-view/${npi}` : '',
      confidence: 'medium' as const,
      score: isOrg ? 35 : 30,
      badges: ['NPI'],
      evidence: [],
      _rawSources: ['NPI'],
    };
  }).filter((c) => c.address && c.city && c.state);

  return { candidates, url };
}

export const npiAdapter: ProviderSourceAdapter = {
  id: 'npi',
  label: 'NPI Registry',
  supportedServiceTypes: [
    'dotExam', 'faamedical', 'physicalExam', 'urgentCare', 'mammogram',
    'radiology', 'stressTest', 'drugscreen', 'lab', 'audiology',
    'dental', 'physio', 'chiropractic', 'behavioral', 'pulmonary',
    'occupational', 'primaryCare',
  ],
  async search({ city, state, serviceType }) {
    const taxonomies = getTaxonomiesForCategory(serviceType);
    if (!taxonomies.length) {
      log('No taxonomies for serviceType', serviceType);
      return [];
    }

    log('Selected category', serviceType);
    log('Mapped taxonomy terms', taxonomies);

    const all: ProviderCandidate[] = [];
    const urls: string[] = [];

    const batches = await Promise.allSettled(
      taxonomies.map((t) => searchNpiTaxonomy(city, state, t, 200)),
    );

    batches.forEach((batch) => {
      if (batch.status === 'fulfilled') {
        all.push(...batch.value.candidates);
        urls.push(batch.value.url);
      } else {
        log('Batch failed', batch.reason);
      }
    });

    log('Raw results', all.length);
    return all;
  },
};
