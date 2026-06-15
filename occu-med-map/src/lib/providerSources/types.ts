export interface ProviderCandidate {
  id: string;
  name: string;
  address: string;
  city: string;
  state: string;
  postalCode: string;
  phone: string;
  fax?: string;
  website: string;
  lat?: number;
  lng?: number;
  taxonomy?: string;
  taxonomyCode?: string;
  npi?: string;
  source: string;
  sourceDetail?: string;
  sourceUrl?: string;
  confidence: 'high' | 'medium' | 'low';
  score: number;
  badges: string[];
  evidence: ProviderEvidence[];
  internalStatus?: InternalStatus;
  distanceMiles?: number;
  // For dedupe merging
  _rawSources?: string[];
}

export interface ProviderEvidence {
  serviceDetected: string;
  evidenceUrl: string;
  evidenceTextSnippet: string;
  confidence: number; // 0-100
  source: 'Website Evidence' | string;
}

export type InternalStatus =
  | 'Candidate'
  | 'Needs Call'
  | 'Pricing Pending'
  | 'Confirmed'
  | 'Rejected'
  | 'No Response'
  | 'Does Not Perform Service'
  | 'Do Not Use';

export const ALL_INTERNAL_STATUSES: InternalStatus[] = [
  'Candidate',
  'Needs Call',
  'Pricing Pending',
  'Confirmed',
  'Rejected',
  'No Response',
  'Does Not Perform Service',
  'Do Not Use',
];

export interface ProviderSourceAdapter {
  id: string;
  label: string;
  supportedServiceTypes: string[];
  search(params: {
    city: string;
    state: string;
    zip?: string;
    radiusMiles: number;
    serviceType: string;
  }): Promise<ProviderCandidate[]>;
}

export interface SearchParams {
  city: string;
  state: string;
  zip?: string;
  radiusMiles: number;
  serviceType: string;
  centerLat: number;
  centerLng: number;
}

export interface SourceResult {
  sourceId: string;
  sourceLabel: string;
  ok: boolean;
  count: number;
  error?: string;
  rawCount?: number;
  urls?: string[];
}

export interface UnifiedSearchResponse {
  params: SearchParams;
  results: ProviderCandidate[];
  sourceResults: SourceResult[];
  audit: SearchAudit;
}

export interface SearchAudit {
  serviceType: string;
  activeAdapters: string[];
  urlsRequested: string[];
  rawResultCounts: Record<string, number>;
  normalizedCount: number;
  dedupedCount: number;
  geocodedCount: number;
  finalMarkerCount: number;
  errorsBySource: Record<string, string>;
  durationMs: number;
}

export interface SourceBadge {
  id: string;
  label: string;
  color: string;
}

export const SOURCE_BADGES: SourceBadge[] = [
  { id: 'npi', label: 'NPI', color: '#3b82f6' },
  { id: 'fmcsa', label: 'FMCSA', color: '#f97316' },
  { id: 'faa', label: 'FAA', color: '#06b6d4' },
  { id: 'acr', label: 'ACR', color: '#a855f7' },
  { id: 'fda_mqsa', label: 'FDA MQSA', color: '#ec4899' },
  { id: 'iac', label: 'IAC', color: '#f59e0b' },
  { id: 'quest', label: 'Quest', color: '#ef4444' },
  { id: 'labcorp', label: 'Labcorp', color: '#22c55e' },
  { id: 'crl', label: 'CRL', color: '#8b5cf6' },
  { id: 'escreen', label: 'eScreen', color: '#14b8a6' },
  { id: 'chain', label: 'Chain Locator', color: '#64748b' },
  { id: 'website', label: 'Website Evidence', color: '#eab308' },
  { id: 'occumed', label: 'Occu-Med Confirmed', color: '#10b981' },
  { id: 'osm', label: 'OpenStreetMap', color: '#6366f1' },
];
