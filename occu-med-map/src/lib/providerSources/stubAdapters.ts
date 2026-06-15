import type { ProviderSourceAdapter, ProviderCandidate } from './types';

// Many of these sources require API keys, partner agreements, or custom scraping.
// These adapters return empty arrays with appropriate logging so they can be
// plugged in later as real integrations become available.

function makeStubAdapter(
  id: string,
  label: string,
  supportedServiceTypes: string[],
  note: string,
): ProviderSourceAdapter {
  return {
    id,
    label,
    supportedServiceTypes,
    async search(params) {
      // eslint-disable-next-line no-console
      console.log(`[${id} Adapter] Stub search called`, { params, note });
      return [];
    },
  };
}

export const fmcsaAdapter = makeStubAdapter(
  'fmcsa',
  'FMCSA National Registry',
  ['dotExam'],
  'Requires FMCSA Medical Examiner Registry API or scraping https://ai.fmcsa.dot.gov/mcs150/commonMESearchForm.aspx',
);

export const faaAdapter = makeStubAdapter(
  'faa',
  'FAA AME Locator',
  ['faamedical'],
  'Requires FAA Designee Locator API or scraping https://designee.faa.gov/designeeLocator',
);

export const acrAdapter = makeStubAdapter(
  'acr',
  'ACR Accredited Facility Search',
  ['radiology', 'stressTest', 'mammogram'],
  'Requires ACR Accreditation Program search API or scraping https://www.acraccreditation.org/',
);

export const fdaMqsaAdapter = makeStubAdapter(
  'fda_mqsa',
  'FDA MQSA Facility Search',
  ['mammogram'],
  'Requires FDA MQSA facility search API or scraping https://www.fda.gov/radiation-emitting-products/mammography-quality-standards-act-and-program/accredited-facilities',
);

export const iacAdapter = makeStubAdapter(
  'iac',
  'IAC Accredited Facilities',
  ['radiology', 'stressTest'],
  'Requires IAC facility search API or scraping https://www.intersocietal.org/',
);

export const questAdapter = makeStubAdapter(
  'quest',
  'Quest Diagnostics Locator',
  ['drugscreen', 'lab'],
  'Requires Quest location API or scraping https://www.questdiagnostics.com/locations',
);

export const labcorpAdapter = makeStubAdapter(
  'labcorp',
  'Labcorp Location Search',
  ['drugscreen', 'lab'],
  'Requires Labcorp location API or scraping https://www.labcorp.com/labs-and-appointments',
);

export const crlAdapter = makeStubAdapter(
  'crl',
  'CRL Clinical Laboratory',
  ['lab'],
  'Requires CRL location search API or scraping',
);

export const escreenAdapter = makeStubAdapter(
  'escreen',
  'eScreen Collection Sites',
  ['drugscreen'],
  'Requires eScreen location API or partner access',
);

export const formfoxAdapter = makeStubAdapter(
  'formfox',
  'FormFox Collection Sites',
  ['drugscreen'],
  'Requires FormFox location API or partner access',
);

export const disaAdapter = makeStubAdapter(
  'disa',
  'DISA Collection Sites',
  ['drugscreen'],
  'Requires DISA location API or partner access',
);

// Chain locators
export const concentraAdapter = makeStubAdapter(
  'concentra',
  'Concentra Locator',
  ['dotExam', 'physicalExam', 'urgentCare', 'occupational', 'audiology'],
  'Requires Concentra location API or scraping https://www.concentra.com/location',
);

export const medexpressAdapter = makeStubAdapter(
  'medexpress',
  'MedExpress Locator',
  ['dotExam', 'physicalExam', 'urgentCare', 'occupational', 'audiology'],
  'Requires MedExpress location API or scraping https://www.medexpress.com/',
);

export const afcUrgentCareAdapter = makeStubAdapter(
  'afc_urgent_care',
  'AFC Urgent Care Locator',
  ['urgentCare', 'physicalExam'],
  'Requires AFC Urgent Care location API or scraping https://www.afcurgentcare.com/',
);

export const careNowAdapter = makeStubAdapter(
  'carenow',
  'CareNow Locator',
  ['dotExam', 'physicalExam', 'urgentCare', 'occupational'],
  'Requires CareNow location API or scraping https://www.carenow.com/',
);

export const fastPaceAdapter = makeStubAdapter(
  'fastpace',
  'Fast Pace Health Locator',
  ['dotExam', 'physicalExam', 'urgentCare', 'occupational'],
  'Requires Fast Pace Health location API or scraping https://www.fastpacehealth.com/',
);

export const novaAdapter = makeStubAdapter(
  'nova',
  'Nova Medical Centers Locator',
  ['physicalExam', 'occupational'],
  'Requires Nova Medical Centers location API or scraping',
);

export const workcareAdapter = makeStubAdapter(
  'workcare',
  'WorkCare Locator',
  ['physicalExam', 'occupational'],
  'Requires WorkCare location API or scraping https://www.workcare.com/',
);

export const premiseHealthAdapter = makeStubAdapter(
  'premise',
  'Premise Health Locator',
  ['physicalExam', 'occupational'],
  'Requires Premise Health location API or scraping https://www.premisehealth.com/',
);

export const marathonHealthAdapter = makeStubAdapter(
  'marathon',
  'Marathon Health Locator',
  ['physicalExam', 'occupational'],
  'Requires Marathon Health location API or scraping https://www.marathon-health.com/',
);

export const ALL_STUB_ADAPTERS: ProviderSourceAdapter[] = [
  fmcsaAdapter, faaAdapter, acrAdapter, fdaMqsaAdapter, iacAdapter,
  questAdapter, labcorpAdapter, crlAdapter, escreenAdapter,
  formfoxAdapter, disaAdapter, concentraAdapter, medexpressAdapter,
  afcUrgentCareAdapter, careNowAdapter, fastPaceAdapter,
  novaAdapter, workcareAdapter, premiseHealthAdapter, marathonHealthAdapter,
];
