export interface Report {
  id: string;
  publicId?: string;
  createdAt: string;
  animalType: 'cat' | 'dog' | 'other';
  count: number;
  location: string;
  neighborhood: string;
  dateObserved: string;
  timeObserved: string;
  inDanger: 'yes' | 'no' | 'unsure';
  concernTypes: string[];
  description: string;
  evidenceNotes: string;
  agenciesContacted: string;
  responseReceived: string;
  contactInfo?: string;
  anonymous: boolean;
  status: 'draft' | 'submitted' | 'routed' | 'follow-up' | 'resolved';
}

const STORAGE_KEY = 'voicemap_reports';

function normalizeReport(report: Report): Report {
  if (!report.anonymous) return report;

  return {
    ...report,
    contactInfo: undefined,
  };
}

export function getReports(): Report[] {
  try {
    const raw = localStorage.getItem(STORAGE_KEY);
    if (!raw) return [];

    const reports = JSON.parse(raw) as Report[];
    return reports.map(normalizeReport);
  } catch {
    return [];
  }
}

export function saveReport(report: Report): void {
  const safeReport = normalizeReport(report);
  const reports = getReports();
  const idx = reports.findIndex((r) => r.id === safeReport.id);
  if (idx >= 0) {
    reports[idx] = safeReport;
  } else {
    reports.push(safeReport);
  }
  localStorage.setItem(STORAGE_KEY, JSON.stringify(reports));
}

export function updateReportStatus(id: string, status: Report['status']): void {
  const reports = getReports();
  const r = reports.find((report) => report.id === id);
  if (r) {
    r.status = status;
    localStorage.setItem(STORAGE_KEY, JSON.stringify(reports));
  }
}

export function generateId(): string {
  return `vm-${Date.now()}-${Math.random().toString(36).slice(2, 7)}`;
}

export function getDemoReports(): Report[] {
  return [
    {
      id: 'demo-1',
      createdAt: new Date(Date.now() - 5 * 24 * 60 * 60 * 1000).toISOString(),
      animalType: 'cat',
      count: 3,
      location: 'Blackstone Ave & Shields Ave',
      neighborhood: 'Tower District',
      dateObserved: '2026-04-28',
      timeObserved: '14:30',
      inDanger: 'yes',
      concernTypes: ['appears starving', 'repeated stray sightings'],
      description: 'Three thin cats observed near a dumpster. Appear to have been present for several days. No visible owner or caretaker.',
      evidenceNotes: 'Photos taken on mobile device. Multiple sightings on consecutive days.',
      agenciesContacted: 'Fresno Animal Center',
      responseReceived: 'No response yet',
      anonymous: false,
      status: 'submitted',
    },
    {
      id: 'demo-2',
      createdAt: new Date(Date.now() - 2 * 24 * 60 * 60 * 1000).toISOString(),
      animalType: 'dog',
      count: 1,
      location: 'Fulton St & Ventura Ave',
      neighborhood: 'Fresno High',
      dateObserved: '2026-05-01',
      timeObserved: '09:00',
      inDanger: 'yes',
      concernTypes: ['exposed to heat/cold', 'appears injured'],
      description: 'Dog observed limping near an alley. Appears to have a wound on hind leg. Hot day — animal panting heavily with no water source visible.',
      evidenceNotes: 'Single clear photo of the dog from about 10 feet. Animal appeared docile.',
      agenciesContacted: 'Fresno Police Non-Emergency',
      responseReceived: 'Officer reported they would send Animal Control',
      anonymous: false,
      status: 'routed',
    },
    {
      id: 'demo-3',
      createdAt: new Date(Date.now() - 10 * 24 * 60 * 60 * 1000).toISOString(),
      animalType: 'cat',
      count: 2,
      location: 'Palm Ave & McKinley Ave',
      neighborhood: 'Fig Garden',
      dateObserved: '2026-04-23',
      timeObserved: '18:00',
      inDanger: 'unsure',
      concernTypes: ['possible neglect', 'abandoned'],
      description: 'Two cats observed repeatedly in an empty lot adjacent to a recently vacated property. Unclear if they were left behind.',
      evidenceNotes: 'No photos yet. Will attempt to document on next visit.',
      agenciesContacted: 'None yet',
      responseReceived: 'N/A',
      anonymous: true,
      status: 'draft',
    },
    {
      id: 'demo-4',
      createdAt: new Date(Date.now() - 20 * 24 * 60 * 60 * 1000).toISOString(),
      animalType: 'dog',
      count: 2,
      location: 'Fresno St & Tulare St',
      neighborhood: 'Downtown',
      dateObserved: '2026-04-13',
      timeObserved: '11:30',
      inDanger: 'no',
      concernTypes: ['repeated stray sightings'],
      description: 'Two dogs have been spotted near the transit center for over a week. They appear healthy but have no visible collars or tags.',
      evidenceNotes: 'Multiple community members have noticed the same animals.',
      agenciesContacted: 'Fresno Animal Center, City Council',
      responseReceived: 'Animal Center said they would dispatch next available officer',
      anonymous: false,
      status: 'resolved',
    },
  ];
}

export function getStats(reports: Report[]) {
  return {
    total: reports.length,
    open: reports.filter((report) => report.status === 'submitted' || report.status === 'draft').length,
    followUp: reports.filter((report) => report.status === 'follow-up').length,
    resolved: reports.filter((report) => report.status === 'resolved').length,
    routed: reports.filter((report) => report.status === 'routed').length,
    animals: reports.reduce((sum, report) => sum + report.count, 0),
  };
}

export const CONCERN_TYPES = [
  'appears injured',
  'appears starving',
  'abandoned',
  'trapped',
  'exposed to heat/cold',
  'repeated stray sightings',
  'possible neglect',
  'aggressive or unsafe situation',
  'deceased animal',
  'other',
];

export const STATUS_LABELS: Record<Report['status'], string> = {
  draft: 'Draft',
  submitted: 'Submitted',
  routed: 'Routed',
  'follow-up': 'Follow-Up Needed',
  resolved: 'Resolved',
};

export const STATUS_COLORS: Record<Report['status'], string> = {
  draft: 'bg-muted text-muted-foreground',
  submitted: 'bg-primary/20 text-primary',
  routed: 'bg-accent/30 text-foreground',
  'follow-up': 'bg-destructive/20 text-destructive',
  resolved: 'bg-green-500/20 text-green-700 dark:text-green-400',
};
