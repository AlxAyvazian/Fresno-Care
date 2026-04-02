// Medicare physician fee schedule national averages + state geographic cost index
// Medicare allowed amounts sourced from CMS 2024 Physician Fee Schedule
// State cost index derived from CMS Geographic Practice Cost Index (GPCI) locality data

export interface ProcedureRate {
  name: string;
  cpt: string;
  medicareAvg: number;   // Medicare allowed amount (national avg, $)
  selfPayLow: number;    // Typical self-pay low end ($)
  selfPayHigh: number;   // Typical self-pay high end ($)
  description: string;
}

export const PROCEDURE_RATES: Record<string, ProcedureRate> = {
  urgentCareL3: {
    name: 'Urgent Care Visit (Level 3)',
    cpt: '99213',
    medicareAvg: 115, selfPayLow: 100, selfPayHigh: 230,
    description: 'Established patient, low-moderate complexity, ~15 min',
  },
  urgentCareL4: {
    name: 'Urgent Care Visit (Level 4)',
    cpt: '99214',
    medicareAvg: 167, selfPayLow: 140, selfPayHigh: 320,
    description: 'Established patient, moderate complexity, ~25 min',
  },
  urgentCareNew: {
    name: 'Urgent Care New Patient (Level 3)',
    cpt: '99203',
    medicareAvg: 145, selfPayLow: 120, selfPayHigh: 280,
    description: 'New patient, moderate complexity, ~30 min',
  },
  dentalExam: {
    name: 'Dental Exam (New Patient)',
    cpt: 'D0150',
    medicareAvg: 0, selfPayLow: 50, selfPayHigh: 200,
    description: 'Comprehensive oral evaluation — not covered by Medicare',
  },
  dentalCleaning: {
    name: 'Dental Cleaning (Adult)',
    cpt: 'D1110',
    medicareAvg: 0, selfPayLow: 75, selfPayHigh: 200,
    description: 'Adult prophylaxis — not covered by Medicare',
  },
  dentalXray: {
    name: 'Dental X-rays (Bitewings)',
    cpt: 'D0274',
    medicareAvg: 0, selfPayLow: 25, selfPayHigh: 100,
    description: '4 bitewing radiographic images',
  },
  physicalExam: {
    name: 'Annual Preventive Physical (Adult)',
    cpt: '99396',
    medicareAvg: 187, selfPayLow: 100, selfPayHigh: 300,
    description: 'Periodic preventive medicine visit, age 40–64',
  },
  physicalExamElderly: {
    name: 'Medicare Annual Wellness Visit',
    cpt: 'G0439',
    medicareAvg: 171, selfPayLow: 0, selfPayHigh: 0,
    description: 'Covered 100% by Medicare — no cost to beneficiary',
  },
  dotExam: {
    name: 'DOT Physical Exam (FMCSA)',
    cpt: '99456',
    medicareAvg: 118, selfPayLow: 75, selfPayHigh: 175,
    description: 'Commercial driver physical — must use FMCSA-certified examiner',
  },
  faaClass3: {
    name: 'FAA Medical Exam (Class 3)',
    cpt: '99455',
    medicareAvg: 105, selfPayLow: 75, selfPayHigh: 175,
    description: 'Private/student pilot — valid 5 years under age 40',
  },
  faaClass1: {
    name: 'FAA Medical Exam (Class 1)',
    cpt: '99455',
    medicareAvg: 105, selfPayLow: 150, selfPayHigh: 275,
    description: 'Airline Transport Pilot — annual exam required',
  },
  stressTest: {
    name: 'Exercise Stress Test (Treadmill)',
    cpt: '93015',
    medicareAvg: 348, selfPayLow: 250, selfPayHigh: 750,
    description: 'Cardiovascular stress test with ECG monitoring',
  },
  stressEcho: {
    name: 'Stress Echocardiogram',
    cpt: '93350',
    medicareAvg: 612, selfPayLow: 500, selfPayHigh: 1800,
    description: 'Echo imaging before and after stress test',
  },
  mammogramScreen: {
    name: 'Screening Mammogram (2D)',
    cpt: '77067',
    medicareAvg: 148, selfPayLow: 80, selfPayHigh: 280,
    description: 'Annual screening — Medicare covers 1/year at no cost',
  },
  mammogram3D: {
    name: 'Screening Mammogram (3D/Tomo)',
    cpt: '77063',
    medicareAvg: 183, selfPayLow: 130, selfPayHigh: 400,
    description: '3D digital breast tomosynthesis — better sensitivity',
  },
  fluShot: {
    name: 'Influenza Vaccine',
    cpt: '90658',
    medicareAvg: 32, selfPayLow: 0, selfPayHigh: 55,
    description: 'Seasonal flu shot — covered free by Medicare Part B',
  },
  covidVaccine: {
    name: 'COVID-19 Vaccine',
    cpt: '91300',
    medicareAvg: 0, selfPayLow: 0, selfPayHigh: 200,
    description: 'Free through most insurance and pharmacies',
  },
  travelVaccine: {
    name: 'Travel Vaccine (Typhoid)',
    cpt: '90691',
    medicareAvg: 0, selfPayLow: 80, selfPayHigh: 200,
    description: 'Travel vaccines typically not covered by insurance',
  },
  labPanel: {
    name: 'Comprehensive Metabolic Panel',
    cpt: '80053',
    medicareAvg: 14, selfPayLow: 15, selfPayHigh: 100,
    description: '14-test blood panel — use GoodRx or Lab Corp for cash price',
  },
  cbcBlood: {
    name: 'Complete Blood Count (CBC)',
    cpt: '85025',
    medicareAvg: 10, selfPayLow: 10, selfPayHigh: 60,
    description: 'Standard blood count panel',
  },
  drugScreen: {
    name: 'Drug Test (Urine Screen, 10-panel)',
    cpt: '80305',
    medicareAvg: 28, selfPayLow: 25, selfPayHigh: 80,
    description: 'Workplace or DOT 10-panel urine drug screen',
  },
  audiogram: {
    name: 'Audiogram (Hearing Test)',
    cpt: '92557',
    medicareAvg: 62, selfPayLow: 50, selfPayHigh: 200,
    description: 'Pure tone audiometry — occupational hearing conservation',
  },
  pulmonaryPFT: {
    name: 'Pulmonary Function Test (Spirometry)',
    cpt: '94010',
    medicareAvg: 45, selfPayLow: 40, selfPayHigh: 175,
    description: 'Basic spirometry — common in occ-med baseline exams',
  },
  visionScreen: {
    name: 'Vision Screening',
    cpt: '99173',
    medicareAvg: 20, selfPayLow: 15, selfPayHigh: 80,
    description: 'Snellen chart and basic vision screening',
  },
};

// State geographic cost index relative to national average (1.00)
// Derived from CMS GPCI locality payment area data
// Values > 1.0 = more expensive than national avg; < 1.0 = less expensive
export const STATE_COST_INDEX: Record<string, number> = {
  DC: 1.30, MA: 1.20, CA: 1.22, NY: 1.18, NJ: 1.15, AK: 1.15, HI: 1.14,
  CT: 1.12, MD: 1.11, WA: 1.09, IL: 1.07, OR: 1.07, MN: 1.05, CO: 1.05,
  NV: 1.06, RI: 1.05, DE: 1.04, PA: 1.03, VA: 1.03, WI: 1.02, MI: 1.01,
  TX: 1.01, FL: 1.00, OH: 0.99, AZ: 0.99, NC: 0.98, GA: 0.97, IN: 0.96,
  SC: 0.95, UT: 0.95, NH: 0.94, TN: 0.94, KY: 0.93, MO: 0.92, LA: 0.92,
  NE: 0.92, KS: 0.91, IA: 0.91, VT: 0.90, ME: 0.90, ID: 0.90, NM: 0.90,
  OK: 0.90, MT: 0.89, AL: 0.89, ND: 0.89, WV: 0.88, SD: 0.88, WY: 0.88,
  AR: 0.88, MS: 0.87,
};

export const STATE_COST_TIER: Record<string, string> = {
  DC: 'Very High', MA: 'Very High', CA: 'Very High',
  NY: 'High', NJ: 'High', AK: 'High', HI: 'High', CT: 'High', MD: 'High',
  WA: 'Above Avg', IL: 'Above Avg', OR: 'Above Avg', MN: 'Above Avg',
  CO: 'Above Avg', NV: 'Above Avg', RI: 'Above Avg', DE: 'Above Avg',
  PA: 'Average', VA: 'Average', WI: 'Average', MI: 'Average', TX: 'Average',
  FL: 'Average', OH: 'Average', AZ: 'Average',
  NC: 'Below Avg', GA: 'Below Avg', IN: 'Below Avg', SC: 'Below Avg',
  UT: 'Below Avg', NH: 'Below Avg', TN: 'Below Avg', KY: 'Below Avg',
  MO: 'Below Avg', LA: 'Below Avg', NE: 'Below Avg', KS: 'Below Avg',
  IA: 'Below Avg', VT: 'Below Avg', ME: 'Below Avg', ID: 'Below Avg',
  NM: 'Below Avg', OK: 'Below Avg',
  MT: 'Low', AL: 'Low', ND: 'Low', WV: 'Low', SD: 'Low',
  WY: 'Low', AR: 'Low', MS: 'Low',
};

export function adjustedPrice(basePrice: number, state: string): number {
  const idx = STATE_COST_INDEX[state] ?? 1.0;
  return Math.round(basePrice * idx);
}

export function tierColor(tier: string): string {
  switch (tier) {
    case 'Very High':  return '#ef4444';
    case 'High':       return '#f97316';
    case 'Above Avg':  return '#eab308';
    case 'Average':    return '#22c55e';
    case 'Below Avg':  return '#06b6d4';
    case 'Low':        return '#3b82f6';
    default:           return '#6b7280';
  }
}
