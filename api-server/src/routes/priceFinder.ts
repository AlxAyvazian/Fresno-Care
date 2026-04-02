import { Router } from "express";

const router = Router();

// Taxonomy codes/descriptions by service type
const TAXONOMY_MAP: Record<string, string[]> = {
  urgentCare:    ['Urgent Care', 'Clinic/Center, Urgent Care', 'Walk-in Clinic'],
  dental:        ['Dentist', 'Dentist General Practice', 'Oral & Maxillofacial Surgery', 'Orthodontics', 'Pediatric Dentistry'],
  pharmacy:      ['Pharmacy', 'Pharmacist'],
  physicalExam:  ['Preventive Medicine', 'Occupational Medicine', 'Family Medicine', 'Internal Medicine'],
  faamedical:    ['Aviation Medicine', 'Occupational Medicine', 'Aerospace Medicine'],
  stressTest:    ['Cardiology', 'Cardiovascular Disease', 'Clinical Cardiac Electrophysiology'],
  mammogram:     ['Radiology', 'Diagnostic Radiology', 'Breast Imaging'],
  dotExam:       ['Occupational Medicine', 'Occupational Therapy'],
  vaccinations:  ['Immunization', 'Public Health & General Preventive Medicine', 'Family Medicine'],
  fqhc:          ['Federally Qualified Health Center'],
};

// Search query override — used to improve NPI hits for specialty types
const SEARCH_LABEL: Record<string, string> = {
  urgentCare:   'urgent care clinic',
  dental:       'dental',
  pharmacy:     'pharmacy',
  physicalExam: 'physical exam / preventive medicine',
  faamedical:   'FAA aviation medical examiner',
  stressTest:   'cardiology / stress test',
  mammogram:    'mammogram / radiology',
  dotExam:      'DOT physical exam / occupational medicine',
  vaccinations: 'vaccination / immunization clinic',
};

// Known transparent-pricing clinic networks by type
const TRANSPARENT_NETWORKS: Record<string, Array<{name:string;desc:string;url:string;tag:string}>> = {
  urgentCare: [
    { name:'Sesame Care', desc:'Transparent cash-pay urgent care & primary care. Prices listed upfront.', url:'https://sesamecare.com/urgent-care', tag:'CASH PAY' },
    { name:'GoodRx Care', desc:'Online urgent care with upfront pricing, starting at $20.', url:'https://www.goodrx.com/care/urgent-care', tag:'ONLINE' },
    { name:'MinuteClinic (CVS)', desc:'Walk-in urgent care — prices posted online before your visit.', url:'https://www.cvs.com/minuteclinic/visit-types-and-costs', tag:'TRANSPARENT' },
    { name:'Mira Health', desc:'Low flat-fee urgent care membership — $45/mo includes visits & labs.', url:'https://www.talkmira.com/', tag:'FLAT FEE' },
    { name:'MDsave', desc:'Prepay for urgent care at listed prices and save up to 60%.', url:'https://www.mdsave.com/', tag:'PREPAY' },
    { name:'Solv Health', desc:'Book urgent care online — many locations list wait times and prices.', url:'https://www.solvhealth.com/', tag:'BOOKING' },
  ],
  dental: [
    { name:'Affordable Care', desc:'600+ dental practices with transparent fee schedules.', url:'https://www.affordablecare.com/', tag:'FEE SCHEDULE' },
    { name:'SmileDirectClub', desc:'Orthodontic care with published pricing starting at $1,950.', url:'https://smiledirectclub.com/', tag:'TRANSPARENT' },
    { name:'1-800-Dentist', desc:'Find local dentists and compare prices in your area.', url:'https://www.1800dentist.com/', tag:'COMPARE' },
    { name:'Open Care', desc:'Compares dental practices by price, insurance, and location.', url:'https://www.opencare.com/', tag:'COMPARE' },
    { name:'Dental Plans', desc:'Discount dental plans with listed savings on procedures.', url:'https://www.dentalplans.com/', tag:'DISCOUNT' },
    { name:'CostHelper Health', desc:'Real user-reported dental costs with ranges for common procedures.', url:'https://health.costhelper.com/dentist.html', tag:'COST GUIDE' },
  ],
  pharmacy: [
    { name:'GoodRx', desc:'Compare prescription prices at pharmacies near you.', url:'https://www.goodrx.com/', tag:'FREE COUPONS' },
    { name:'RxSaver', desc:'Compare pharmacy prices and print discount coupons.', url:'https://www.rxsaver.com/', tag:'COMPARE' },
    { name:'Mark Cuban Cost Plus Drugs', desc:'Transparent drug pricing — 1,000+ medications at cost + 15%.', url:'https://costplusdrugs.com/', tag:'COST + 15%' },
    { name:'Blink Health', desc:'Prepay for prescriptions online and pick up at local pharmacies.', url:'https://www.blinkhealth.com/', tag:'PREPAY' },
  ],
  physicalExam: [
    { name:'Sesame Care – Physical Exams', desc:'Book a physical exam with upfront transparent pricing.', url:'https://sesamecare.com/physical-exam', tag:'CASH PAY' },
    { name:'MDsave – Physicals', desc:'Pre-purchase physical exam packages at listed prices.', url:'https://www.mdsave.com/', tag:'PREPAY' },
    { name:'Concentra', desc:'Occupational health physicals with pricing available by location.', url:'https://www.concentra.com/', tag:'OCC HEALTH' },
    { name:'MinuteClinic – Annual Physical', desc:'CVS walk-in physical exams with published visit costs.', url:'https://www.cvs.com/minuteclinic/services/preventive-care/physical-exams', tag:'WALK-IN' },
    { name:'LabCorp OnDemand', desc:'Wellness panels and physical exam lab work at transparent prices.', url:'https://www.labcorp.com/labs-and-appointments', tag:'LAB WORK' },
    { name:'FAIR Health Consumer', desc:'Look up fair prices for physical exam codes in your zip code.', url:'https://fairhealthconsumer.org/', tag:'PRICE GUIDE' },
  ],
  faamedical: [
    { name:'FAA AME Locator', desc:'Official FAA tool to find certified Aviation Medical Examiners near you.', url:'https://designee.faa.gov/designeeLocator', tag:'OFFICIAL FAA' },
    { name:'AOPA Medical Certification', desc:'AOPA guide to FAA medical exams with typical cost ranges.', url:'https://www.aopa.org/go-fly/medical-resources/a-guide-to-faa-medical-certification', tag:'COST GUIDE' },
    { name:'FAA Medical FAQ', desc:'FAA official guidance on Class 1, 2, and 3 medical exam requirements.', url:'https://www.faa.gov/pilots/medical_certification', tag:'REQUIREMENTS' },
    { name:'Sesame Care – Aviation Medical', desc:'Find AMEs who list transparent pricing on Sesame platform.', url:'https://sesamecare.com/', tag:'TRANSPARENT' },
    { name:'MDsave – Aviation Medical', desc:'Pre-purchase FAA medical exam packages where available.', url:'https://www.mdsave.com/', tag:'PREPAY' },
    { name:'AeroMD', desc:'Specialized FAA medical exam service with upfront online booking.', url:'https://aeromd.com/', tag:'SPECIALIST' },
  ],
  stressTest: [
    { name:'MDsave – Stress Test', desc:'Pre-purchase treadmill stress test at listed prices, up to 60% off.', url:'https://www.mdsave.com/procedures/stress-test', tag:'PREPAY' },
    { name:'Healthcare Bluebook – Stress Test', desc:'Find fair prices for exercise stress tests in your area.', url:'https://www.healthcarebluebook.com/', tag:'FAIR PRICE' },
    { name:'FAIR Health – Cardiology', desc:'Estimate out-of-pocket costs for cardiac stress testing.', url:'https://fairhealthconsumer.org/', tag:'ESTIMATOR' },
    { name:'Sesame Care – Cardiology', desc:'Book cardiology consultations with upfront transparent pricing.', url:'https://sesamecare.com/', tag:'CASH PAY' },
    { name:'New Choice Health', desc:'Compare stress test prices at facilities near you.', url:'https://www.newchoicehealth.com/', tag:'COMPARE' },
    { name:'Amino Health', desc:'Find cardiologists by price and patient outcomes.', url:'https://amino.com/', tag:'OUTCOMES' },
  ],
  mammogram: [
    { name:'MDsave – Mammogram', desc:'Pre-purchase screening mammograms at listed prices, typically $80–$250.', url:'https://www.mdsave.com/procedures/mammogram', tag:'PREPAY' },
    { name:'New Choice Health – Mammogram', desc:'Compare mammogram prices at imaging centers near you.', url:'https://www.newchoicehealth.com/mammogram', tag:'COMPARE' },
    { name:'Healthcare Bluebook', desc:'Fair price benchmark for screening and diagnostic mammograms.', url:'https://www.healthcarebluebook.com/', tag:'FAIR PRICE' },
    { name:'Susan G. Komen – Free Screening', desc:'Connects uninsured/underinsured women to free or low-cost mammograms.', url:'https://www.komen.org/breast-health/screening/mammograms/free-low-cost-mammograms/', tag:'FREE/LOW COST' },
    { name:'CDC NBCCEDP', desc:'National Breast and Cervical Cancer Early Detection Program — free mammograms for qualifying women.', url:'https://www.cdc.gov/cancer/nbccedp/', tag:'FREE PROGRAM' },
    { name:'Sesame Care – Imaging', desc:'Book imaging services with transparent upfront pricing.', url:'https://sesamecare.com/', tag:'CASH PAY' },
  ],
  dotExam: [
    { name:'Concentra – DOT Physicals', desc:'DOT physical exams at 500+ locations. Prices typically $75–$150.', url:'https://www.concentra.com/occupational-health/dot-physicals/', tag:'CHAIN PRICING' },
    { name:'CareNow – DOT Physicals', desc:'Urgent care chain offering DOT exams with online check-in.', url:'https://www.carenow.com/services/dot-physical/', tag:'WALK-IN' },
    { name:'FMCSA Medical Examiner Locator', desc:'Official FMCSA tool to find certified DOT medical examiners near you.', url:'https://ai.fmcsa.dot.gov/mcs150/commonMESearchForm.aspx', tag:'OFFICIAL FMCSA' },
    { name:'OHS Health', desc:'Occupational health clinics specializing in DOT exams with listed fees.', url:'https://ohshealth.com/', tag:'TRANSPARENT' },
    { name:'Sesame Care – DOT Physical', desc:'Find DOT examiners with upfront transparent pricing.', url:'https://sesamecare.com/', tag:'CASH PAY' },
    { name:'MDsave – DOT Physical', desc:'Pre-purchase DOT exam packages at listed prices.', url:'https://www.mdsave.com/', tag:'PREPAY' },
  ],
  vaccinations: [
    { name:'VaccineFinder (CDC)', desc:'Official CDC tool to find COVID, flu, and other vaccines near you — many free.', url:'https://vaccinefinder.org/', tag:'FREE / CDC' },
    { name:'CVS Pharmacy – Vaccines', desc:'Walk-in vaccinations with prices listed online. Many covered by insurance.', url:'https://www.cvs.com/immunizations/in-store-immunizations', tag:'PRICE LIST' },
    { name:'Walgreens – Vaccines', desc:'Walk-in vaccine clinic with published vaccine prices by type.', url:'https://www.walgreens.com/topic/pharmacy/walgreens-immunization-services.jsp', tag:'PRICE LIST' },
    { name:'Costco Pharmacy – Vaccines', desc:'Low-cost vaccines at Costco pharmacies — prices posted in-store and online.', url:'https://www.costco.com/pharmacy-immunizations.html', tag:'LOW COST' },
    { name:'Sesame Care – Vaccinations', desc:'Book vaccinations with upfront transparent pricing.', url:'https://sesamecare.com/', tag:'CASH PAY' },
    { name:'Vaccines.gov', desc:'Find flu shots, travel vaccines, and immunization clinics near you.', url:'https://www.vaccines.gov/', tag:'LOCATOR' },
  ],
};

// Pricing resource guides
const PRICING_RESOURCES = [
  { name:'Healthcare Bluebook', desc:'Fair price range for medical procedures in your area.', url:'https://www.healthcarebluebook.com/', tag:'FAIR PRICE' },
  { name:'FAIR Health Consumer', desc:'Estimate out-of-pocket costs for medical and dental care.', url:'https://fairhealthconsumer.org/', tag:'ESTIMATOR' },
  { name:'ClearHealthCosts', desc:'Crowdsourced prices for medical procedures. Find what others paid.', url:'https://clearhealthcosts.com/', tag:'CROWDSOURCED' },
];

interface NpiResult {
  basic: Record<string, string>;
  addresses: Array<Record<string, string>>;
  taxonomies: Array<{code: string; desc: string; primary: boolean}>;
}

async function searchNpi(city: string, state: string, taxonomyDesc: string, limit = 20): Promise<NpiResult[]> {
  const params = new URLSearchParams({
    version: '2.1',
    city: city.trim(),
    state: state.trim().toUpperCase(),
    taxonomy_description: taxonomyDesc,
    enumeration_type: 'NPI-2',
    limit: String(limit),
  });

  const url = `https://npiregistry.cms.hhs.gov/api/?${params}`;
  const resp = await fetch(url, { signal: AbortSignal.timeout(8000) });
  if (!resp.ok) throw new Error(`NPI API error ${resp.status}`);
  const data = await resp.json() as { results?: NpiResult[]; result_count?: number };
  return data.results || [];
}

function formatNpiResult(r: NpiResult, serviceType: string) {
  const name = r.basic?.organization_name ||
    `${r.basic?.first_name || ''} ${r.basic?.last_name || ''}`.trim();
  const addr = r.addresses?.[0];
  const address = addr
    ? `${addr.address_1}, ${addr.city}, ${addr.state} ${addr.postal_code?.slice(0, 5)}`
    : '';
  const phone = addr?.telephone_number || '';
  const taxonomy = r.taxonomies?.find(t => t.primary)?.desc || r.taxonomies?.[0]?.desc || '';
  const isFqhc = taxonomy.toLowerCase().includes('federally qualified') ||
    taxonomy.toLowerCase().includes('fqhc');

  return {
    name: name || 'Unknown',
    address,
    phone,
    taxonomy,
    isFqhc,
    npiUrl: `https://npiregistry.cms.hhs.gov/provider-view/${r.basic?.npi || ''}`,
    searchUrl: `https://www.google.com/search?q=${encodeURIComponent(name + ' ' + (addr?.city || '') + ' ' + (addr?.state || '') + ' pricing cost')}`,
  };
}

router.get('/price-finder', async (req, res) => {
  try {
    const city = String(req.query.city || '').trim();
    const state = String(req.query.state || '').trim();
    const serviceType = String(req.query.serviceType || 'urgentCare');

    if (!city) {
      res.status(400).json({ error: 'city is required' });
      return;
    }

    const taxonomies = TAXONOMY_MAP[serviceType] || TAXONOMY_MAP.urgentCare;
    const fqhcTaxonomies = TAXONOMY_MAP.fqhc;

    // Search NPI in parallel — primary taxonomy + FQHCs
    const searches: Promise<NpiResult[]>[] = [];
    for (const tax of taxonomies.slice(0, 2)) {
      searches.push(searchNpi(city, state, tax, 15).catch(() => []));
    }
    // Always include FQHCs (they publish pricing by law)
    searches.push(searchNpi(city, state, fqhcTaxonomies[0], 10).catch(() => []));

    const allResults = await Promise.all(searches);

    // Deduplicate by organization name
    const seen = new Set<string>();
    const clinics: ReturnType<typeof formatNpiResult>[] = [];
    for (const batch of allResults) {
      for (const r of batch) {
        const key = r.basic?.organization_name || `${r.basic?.first_name}-${r.basic?.last_name}`;
        if (key && !seen.has(key)) {
          seen.add(key);
          clinics.push(formatNpiResult(r, serviceType));
        }
      }
    }

    // FQHCs come first (they're required to post sliding scale fees)
    clinics.sort((a, b) => (b.isFqhc ? 1 : 0) - (a.isFqhc ? 1 : 0));

    const networks = TRANSPARENT_NETWORKS[serviceType] || TRANSPARENT_NETWORKS.urgentCare;

    res.json({
      location: `${city}${state ? ', ' + state.toUpperCase() : ''}`,
      serviceType,
      clinicCount: clinics.length,
      clinics: clinics.slice(0, 20),
      networks,
      pricingResources: PRICING_RESOURCES,
    });
  } catch (err) {
    console.error('price-finder error', err);
    res.status(500).json({ error: 'Search failed. Please try again.' });
  }
});

export default router;
