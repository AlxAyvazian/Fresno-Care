import type { ProviderCandidate } from './types';

export function scoreProvider(candidate: ProviderCandidate): number {
  let score = 0;

  // Base source scores
  const sourceScores: Record<string, number> = {
    'Occu-Med Confirmed': 100,
    'FMCSA': 50,
    'FAA': 50,
    'ACR': 30,
    'FDA MQSA': 30,
    'IAC': 30,
    'Concentra': 40,
    'MedExpress': 40,
    'AFC Urgent Care': 40,
    'CareNow': 40,
    'Fast Pace Health': 40,
    'Nova Medical Centers': 40,
    'WorkCare': 40,
    'Premise Health': 40,
    'Marathon Health': 40,
    'Quest': 40,
    'Labcorp': 40,
    'CRL': 30,
    'eScreen': 30,
    'FormFox': 30,
    'DISA': 30,
    'NPI': 20,
    'OpenStreetMap': 5,
  };

  for (const src of candidate._rawSources || [candidate.source]) {
    for (const [key, val] of Object.entries(sourceScores)) {
      if (src.toLowerCase().includes(key.toLowerCase())) {
        score += val;
        break;
      }
    }
  }

  // Website evidence
  if (candidate.evidence && candidate.evidence.length > 0) {
    const bestEvidence = Math.max(...candidate.evidence.map((e) => e.confidence));
    score += Math.round(bestEvidence * 0.35);
  }

  // Contact signals
  if (candidate.phone) score += 5;
  if (candidate.fax) score += 10;

  // Cap at reasonable max
  return Math.min(score, 250);
}

export function recalculateConfidence(candidate: ProviderCandidate): ProviderCandidate['confidence'] {
  if (candidate.score >= 100) return 'high';
  if (candidate.score >= 50) return 'medium';
  return 'low';
}

export function buildExplanation(candidate: ProviderCandidate): string {
  const lines: string[] = [];

  if (candidate._rawSources?.includes('Occu-Med Confirmed')) {
    lines.push('Occu-Med confirmed provider');
  }
  if (candidate._rawSources?.some((s) => s.includes('FMCSA') || s.includes('FAA'))) {
    lines.push('Official certification registry match');
  }
  if (candidate._rawSources?.some((s) =>
    ['Concentra', 'MedExpress', 'CareNow', 'Fast Pace', 'Nova', 'WorkCare', 'Premise', 'Marathon', 'AFC'].some((ch) => s.includes(ch))
  )) {
    lines.push('Official chain locator match');
  }
  if (candidate.evidence && candidate.evidence.length > 0) {
    const top = candidate.evidence[0];
    lines.push(`Website confirms: "${top.serviceDetected}"`);
  }
  if (candidate._rawSources?.includes('NPI') || candidate._rawSources?.some((s) => s.includes('ACR') || s.includes('FDA MQSA') || s.includes('IAC'))) {
    lines.push('Accreditation directory match');
  }
  if (candidate.npi) {
    lines.push('NPI taxonomy match');
  }
  if (candidate.phone) lines.push('Phone number available');
  if (candidate.fax) lines.push('Fax number available');
  if (candidate.distanceMiles !== undefined) {
    lines.push(`${candidate.distanceMiles.toFixed(1)} miles from search location`);
  }

  if (lines.length === 0) {
    lines.push('Low-confidence candidate — limited verification data');
  }

  return lines.join(' · ');
}
