export const NPI_CATEGORY_MAP: Record<string, {
  label: string;
  icon: string;
  color: string;
  taxonomyDescriptions: string[];
  preferredType: 'NPI-1' | 'NPI-2' | 'both';
}> = {
  urgent: {
    label: 'Urgent Care',
    icon: '\u26A1',
    color: '#f59e0b',
    taxonomyDescriptions: ['Clinic/Center, Urgent Care', 'Urgent Care', 'Urgent Care Medicine', 'Emergency Medicine'],
    preferredType: 'NPI-2',
  },
  occupational: {
    label: 'Occupational Medicine',
    icon: '\u1FA7A',
    color: '#22d3ee',
    taxonomyDescriptions: ['Occupational Medicine', 'Preventive Medicine, Occupational Medicine', 'Occupational Health'],
    preferredType: 'both',
  },
  primaryCare: {
    label: 'Primary Care',
    icon: '\u1F9D1\u200D\u2695\uFE0F',
    color: '#84cc16',
    taxonomyDescriptions: ['Family Medicine', 'General Practice', 'Internal Medicine', 'Pediatric Medicine'],
    preferredType: 'both',
  },
  dentist: {
    label: 'Dentistry',
    icon: '\u1F9B7',
    color: '#06b6d4',
    taxonomyDescriptions: ['Dentist', 'Dentist General Practice', 'Dental Public Health', 'Pediatric Dentistry', 'Endodontics', 'Periodontics', 'Prosthodontics', 'Orthodontics and Dentofacial Orthopedics'],
    preferredType: 'both',
  },
  radiology: {
    label: 'Radiology / Imaging',
    icon: '\u1FA7C',
    color: '#f472b6',
    taxonomyDescriptions: ['Diagnostic Radiology', 'Radiology', 'Radiological Physics', 'Radiology, Diagnostic'],
    preferredType: 'both',
  },
  pulmonary: {
    label: 'Pulmonary / PFT',
    icon: '\u1FAC1',
    color: '#f97316',
    taxonomyDescriptions: ['Pulmonary Disease', 'Internal Medicine', 'Critical Care Medicine'],
    preferredType: 'both',
  },
  lab: {
    label: 'Labs / Phlebotomy',
    icon: '\u1F9EA',
    color: '#ec4899',
    taxonomyDescriptions: ['Clinical Medical Laboratory', 'Clinical Laboratory Technician', 'Phlebotomy', 'Medical Technologist'],
    preferredType: 'NPI-2',
  },
  physio: {
    label: 'Physical Therapy',
    icon: '\u1F9B4',
    color: '#8b5cf6',
    taxonomyDescriptions: ['Physical Therapist', 'Physical Therapy', 'Rehabilitation Practitioner'],
    preferredType: 'both',
  },
  chiropractic: {
    label: 'Chiropractic',
    icon: '\u1F9B4',
    color: '#fb7185',
    taxonomyDescriptions: ['Chiropractor', 'Chiropractic'],
    preferredType: 'both',
  },
  audiology: {
    label: 'Audiology',
    icon: '\u1F3A7',
    color: '#60a5fa',
    taxonomyDescriptions: ['Audiologist', 'Audiologist-Hearing Aid Fitter', 'Hearing Instrument Specialist'],
    preferredType: 'both',
  },
  behavioral: {
    label: 'Behavioral Health',
    icon: '\u1F9E0',
    color: '#a78bfa',
    taxonomyDescriptions: ['Clinical Psychologist', 'Psychiatry', 'Mental Health Counselor', 'Social Worker, Clinical', 'Behavioral Analyst'],
    preferredType: 'both',
  },
};

export type NpiProviderCategory = keyof typeof NPI_CATEGORY_MAP;

export const NPI_CATEGORY_KEYS = Object.keys(NPI_CATEGORY_MAP) as NpiProviderCategory[];

export interface NormalizedNpiProvider {
  npi: string;
  name: string;
  providerType: 'individual' | 'organization';
  taxonomyCode: string;
  taxonomyDescription: string;
  address: string;
  city: string;
  state: string;
  postalCode: string;
  phone: string;
  lat: number | null;
  lng: number | null;
  source: 'NPI Registry';
}

export function getCategoryConfig(category: string) {
  return NPI_CATEGORY_MAP[category] || null;
}

export function getTaxonomiesForCategory(category: string): string[] {
  return NPI_CATEGORY_MAP[category]?.taxonomyDescriptions || [];
}

export function isNpiCategory(category: string): category is NpiProviderCategory {
  return category in NPI_CATEGORY_MAP;
}
