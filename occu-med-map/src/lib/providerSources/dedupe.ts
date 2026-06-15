import type { ProviderCandidate } from './types';

function normalizeName(name: string): string {
  return name
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\b(llc|inc|corp|ltd|pllc|pa|md|do|np|dds|od|dc|pt|phd|aprn)\b/g, '')
    .replace(/\s+/g, ' ')
    .trim();
}

function normalizeAddress(address: string): string {
  return address
    .toLowerCase()
    .replace(/[^a-z0-9\s]/g, ' ')
    .replace(/\b(street|st|avenue|ave|road|rd|drive|dr|boulevard|blvd|suite|ste|unit|floor|fl)\b/g, '')
    .replace(/\s+/g, ' ')
    .trim();
}

function normalizePhone(phone: string): string {
  return phone.replace(/\D/g, '').slice(-10);
}

function extractDomain(url: string): string {
  try {
    return new URL(url).hostname.replace(/^www\./, '').toLowerCase();
  } catch {
    return '';
  }
}

function makeKey(candidate: ProviderCandidate): string {
  const parts: string[] = [];

  if (candidate.npi) {
    parts.push(`npi:${candidate.npi}`);
  }

  const nameNorm = normalizeName(candidate.name);
  if (nameNorm) parts.push(`name:${nameNorm}`);

  const addrNorm = normalizeAddress(candidate.address);
  if (addrNorm) parts.push(`addr:${addrNorm}`);

  const phoneNorm = normalizePhone(candidate.phone);
  if (phoneNorm) parts.push(`phone:${phoneNorm}`);

  const domain = extractDomain(candidate.website);
  if (domain) parts.push(`domain:${domain}`);

  return parts.join('|');
}

export function dedupeCandidates(candidates: ProviderCandidate[]): ProviderCandidate[] {
  const groups: ProviderCandidate[][] = [];
  const seen = new Map<string, number>();

  for (const c of candidates) {
    const key = makeKey(c);
    const idx = seen.get(key);
    if (idx !== undefined) {
      groups[idx].push(c);
    } else {
      seen.set(key, groups.length);
      groups.push([c]);
    }
  }

  return groups.map((group) => mergeGroup(group));
}

function mergeGroup(group: ProviderCandidate[]): ProviderCandidate {
  const base = group[0];
  const allSources = new Set<string>();
  const allBadges = new Set<string>();
  const allEvidence = [...base.evidence];

  for (const c of group) {
    (c._rawSources || [c.source]).forEach((s) => allSources.add(s));
    c.badges.forEach((b) => allBadges.add(b));
    for (const ev of c.evidence) {
      if (!allEvidence.some((e) => e.evidenceUrl === ev.evidenceUrl && e.serviceDetected === ev.serviceDetected)) {
        allEvidence.push(ev);
      }
    }
  }

  // Pick best contact info across sources
  const bestPhone = group.find((c) => c.phone)?.phone || base.phone;
  const bestFax = group.find((c) => c.fax)?.fax || base.fax;
  const bestWebsite = group.find((c) => c.website)?.website || base.website;
  const bestLat = group.find((c) => c.lat !== undefined)?.lat ?? base.lat;
  const bestLng = group.find((c) => c.lng !== undefined)?.lng ?? base.lng;
  const bestNpi = group.find((c) => c.npi)?.npi || base.npi;

  return {
    ...base,
    phone: bestPhone,
    fax: bestFax,
    website: bestWebsite,
    lat: bestLat,
    lng: bestLng,
    npi: bestNpi,
    evidence: allEvidence,
    badges: Array.from(allBadges),
    _rawSources: Array.from(allSources),
  };
}
