import { load } from 'cheerio';

const BASE_URL = 'https://bluehive.com';

async function fetchHtml(url: string): Promise<string> {
  const res = await fetch(url, {
    headers: {
      'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
      Accept: 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
      'Accept-Language': 'en-US,en;q=0.5',
    },
  });
  if (!res.ok) throw new Error(`HTTP ${res.status}`);
  return await res.text();
}

function segments(url: string): string[] {
  return url.replace(/\/$/, '').split('/').filter(Boolean);
}

function extractStates($: any): string[] {
  const urls = new Set<string>();
  $('a[href^="/provider/"]').each((_: any, el: any) => {
    const href = $(el).attr('href');
    if (!href) return;
    const segs = segments(href);
    if (segs.length === 2 && segs[0] === 'provider') {
      urls.add(href);
    }
  });
  return [...urls].sort();
}

const SERVICE_SLUGS = [
  'chest-x-ray',
  'dot-physical',
  'drug-test',
  'flu-vaccine',
  'titer-screening',
  'glucose-screening',
  'sports-physical',
  'preventive-health-exam',
  'faa-medical-class-2',
  'faa-medical-class-3',
  'pre-placement-post-offer-evaluation',
  'hepatitis-b-vaccine',
];

function isServiceSlug(href: string): boolean {
  for (const slug of SERVICE_SLUGS) {
    if (href.includes(slug)) return true;
  }
  return false;
}

function extractCities($: any, stateUrl: string): string[] {
  const stateSegs = segments(stateUrl);
  const urls = new Set<string>();
  const browseHeading = $('h2:contains("Browse by City")');
  if (browseHeading.length > 0) {
    const container = browseHeading.parent();
    container.find('a[href^="/provider/"]').each((_: any, el: any) => {
      const href = $(el).attr('href');
      if (!href) return;
      const segs = segments(href);
      if (
        segs.length === 3 &&
        segs[0] === 'provider' &&
        segs[1] === stateSegs[1] &&
        !isServiceSlug(href)
      ) {
        urls.add(href);
      }
    });
  }
  return [...urls].sort();
}

function extractProviders($: any, stateUrl: string): string[] {
  const stateSegs = segments(stateUrl);
  const urls = new Set<string>();
  $('a[href^="/provider/"]').each((_: any, el: any) => {
    const href = $(el).attr('href');
    if (!href) return;
    const segs = segments(href);
    if (segs.length === 2 && segs[0] === 'provider' && segs[1] !== stateSegs[1]) {
      urls.add(href);
    }
  });
  return [...urls].sort();
}

function extractProviderData(html: string, sourceUrl: string) {
  const $ = load(html);

  let medicalBusiness: any = null;
  let faqPage: any = null;
  let breadcrumbList: any = null;

  $('script[type="application/ld+json"]').each((_, el) => {
    try {
      const text = $(el).text().trim();
      if (!text) return;
      const json = JSON.parse(text);
      if (json['@type'] === 'MedicalBusiness') medicalBusiness = json;
      else if (json['@type'] === 'FAQPage') faqPage = json;
      else if (json['@type'] === 'BreadcrumbList') breadcrumbList = json;
    } catch {
      // ignore
    }
  });

  if (!medicalBusiness) return null;

  const addr = medicalBusiness.address || {};
  const street = addr.streetAddress || '';
  const parts = street.split(',').map((s: string) => s.trim());
  const address_1 = parts[0] || '';
  const address_2 = parts.slice(1).join(', ') || '';

  let hours = '';
  if (faqPage?.mainEntity && Array.isArray(faqPage.mainEntity)) {
    const entry = faqPage.mainEntity.find(
      (q: any) =>
        q.name?.toLowerCase().includes('hours') ||
        q.name?.toLowerCase().includes('office hours')
    );
    if (entry?.acceptedAnswer?.text) {
      hours = entry.acceptedAnswer.text.replace(/\r\n/g, '\n').replace(/\r/g, '\n').trim();
    }
  }

  const servicesArr: string[] = [];
  if (
    medicalBusiness.hasOfferCatalog?.itemListElement &&
    Array.isArray(medicalBusiness.hasOfferCatalog.itemListElement)
  ) {
    for (const item of medicalBusiness.hasOfferCatalog.itemListElement) {
      const name = item?.itemOffered?.name;
      if (name && !servicesArr.includes(name)) servicesArr.push(name);
    }
  }

  const categoriesSet = new Set<string>();
  $('[data-service-category]').each((_, el) => {
    const cat = $(el).attr('data-service-category');
    if (cat) categoriesSet.add(cat);
  });

  let website = '';
  const socialHosts = ['facebook.com', 'twitter.com', 'instagram.com', 'linkedin.com', 'youtube.com'];
  if (medicalBusiness.sameAs && Array.isArray(medicalBusiness.sameAs)) {
    const nonSocial = medicalBusiness.sameAs.find(
      (u: string) => !socialHosts.some((h) => u.includes(h))
    );
    if (nonSocial) website = nonSocial;
  }
  if (!website && medicalBusiness.url) {
    website = medicalBusiness.url;
  }

  const bodyText = $('body').text().toLowerCase();
  const accepts_new_patients = bodyText.includes('accepts new patients') ? 'Yes' : '';
  const telehealth = bodyText.includes('telehealth') ? 'Yes' : '';

  let source_city_url = '';
  let source_state_url = '';
  if (breadcrumbList?.itemListElement && Array.isArray(breadcrumbList.itemListElement)) {
    const stateItem = breadcrumbList.itemListElement.find((it: any) => it.position === 3);
    const cityItem = breadcrumbList.itemListElement.find((it: any) => it.position === 4);
    if (stateItem?.item) source_state_url = stateItem.item;
    if (cityItem?.item) source_city_url = cityItem.item;
  }

  return {
    clinic_name: medicalBusiness.name || '',
    address_1,
    address_2,
    city: addr.addressLocality || '',
    state: addr.addressRegion || '',
    zip: addr.postalCode || '',
    phone: medicalBusiness.telephone || '',
    fax: medicalBusiness.faxNumber || '',
    website,
    hours,
    services: servicesArr.join('; '),
    service_categories: [...categoriesSet].join('; '),
    accepts_new_patients,
    telehealth,
    source_url: sourceUrl,
    source_city_url,
    source_state_url,
  };
}

function assert(condition: boolean, message: string) {
  if (!condition) throw new Error(`ASSERTION FAILED: ${message}`);
}

async function main() {
  console.log('=== Test 1: Main page states ===');
  const mainHtml = await fetchHtml(`${BASE_URL}/provider/`);
  const main$ = load(mainHtml);
  const states = extractStates(main$);
  console.log(`States found: ${states.length}`);
  console.log(`First 5: ${states.slice(0, 5).join(', ')}`);
  assert(states.length >= 50, 'Should find at least 50 states');

  console.log('\n=== Test 2: Delaware state page cities ===');
  const stateHtml = await fetchHtml(`${BASE_URL}/provider/delaware/`);
  const state$ = load(stateHtml);
  const cities = extractCities(state$, '/provider/delaware/');
  console.log(`Cities found: ${cities.length}`);
  cities.forEach((c) => console.log(`  ${c}`));

  // Smoke test: must include real cities
  const expectedCities = ['wilmington', 'dover', 'newark', 'georgetown', 'bear', 'greenville', 'smyrna', 'seaford'];
  for (const city of expectedCities) {
    assert(
      cities.some((c) => c.toLowerCase().includes(city)),
      `Expected city ${city} to be present`
    );
  }

  // Smoke test: must NOT include service pages
  const forbiddenSlugs = [
    'chest-x-ray',
    'faa-medical-class-2',
    'faa-medical-class-3',
    'flu-vaccine',
    'glucose-screening',
    'sports-physical',
    'titer-screening',
  ];
  for (const slug of forbiddenSlugs) {
    assert(
      !cities.some((c) => c.includes(slug)),
      `Service slug ${slug} should NOT appear in city list`
    );
  }
  console.log('  Delaware smoke tests PASSED');

  console.log('\n=== Test 3: City page providers ===');
  const cityHtml = await fetchHtml(`${BASE_URL}/provider/delaware/wilmington/`);
  const city$ = load(cityHtml);
  const providers = extractProviders(city$, '/provider/delaware/');
  console.log(`Providers found: ${providers.length}`);
  console.log(`First 5: ${providers.slice(0, 5).join(', ')}`);
  assert(providers.length >= 5, 'Wilmington should have at least 5 providers');

  console.log('\n=== Test 4: Provider page data ===');
  const providerUrl = `${BASE_URL}${providers[0]}`;
  const providerHtml = await fetchHtml(providerUrl);
  const data = extractProviderData(providerHtml, providerUrl);
  console.log(JSON.stringify(data, null, 2));
  assert(data !== null, 'Should extract provider data');
  if (!data) throw new Error('data is null');
  assert(data.clinic_name.length > 0, 'Should have clinic name');
  assert(data.city.length > 0, 'Should have city');
  assert(data.state.length > 0, 'Should have state');
  assert(data.phone.length > 0, 'Should have phone');

  console.log('\n=== ALL TESTS PASSED ===');
}

main().catch((err) => {
  console.error('Test failed:', err);
  process.exit(1);
});
