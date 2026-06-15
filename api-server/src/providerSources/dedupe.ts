import type { ProviderCandidate } from "./types";

function normalizeName(name: string) { return name.toLowerCase().replace(/[^a-z0-9\s]/g, " ").replace(/\b(llc|inc|corp|ltd|pllc|pa|md|do|np|dds|od|dc|pt|phd|aprn)\b/g, "").replace(/\s+/g, " ").trim(); }
function normalizeAddress(addr: string) { return addr.toLowerCase().replace(/[^a-z0-9\s]/g, " ").replace(/\b(street|st|avenue|ave|road|rd|drive|dr|boulevard|blvd|suite|ste|unit|floor|fl)\b/g, "").replace(/\s+/g, " ").trim(); }
function normalizePhone(phone: string) { return phone.replace(/\D/g, "").slice(-10); }
function extractDomain(url: string) { try { return new URL(url).hostname.replace(/^www\./, "").toLowerCase(); } catch { return ""; } }

function makeKey(c: ProviderCandidate): string {
  const parts: string[] = [];
  if (c.npi) parts.push(`npi:${c.npi}`);
  const nn = normalizeName(c.name); if (nn) parts.push(`name:${nn}`);
  const na = normalizeAddress(c.address); if (na) parts.push(`addr:${na}`);
  const np = normalizePhone(c.phone); if (np) parts.push(`phone:${np}`);
  const nd = extractDomain(c.website); if (nd) parts.push(`domain:${nd}`);
  return parts.join("|");
}

export function dedupeCandidates(candidates: ProviderCandidate[]): ProviderCandidate[] {
  const groups: ProviderCandidate[][] = [];
  const seen = new Map<string, number>();
  for (const c of candidates) {
    const key = makeKey(c);
    const idx = seen.get(key);
    if (idx !== undefined) groups[idx].push(c);
    else { seen.set(key, groups.length); groups.push([c]); }
  }
  return groups.map((g) => {
    const base = g[0];
    const allSources = new Set<string>();
    const allBadges = new Set<string>();
    const allEvidence = [...base.evidence];
    for (const c of g) {
      (c._rawSources || [c.source]).forEach((s) => allSources.add(s));
      c.badges.forEach((b) => allBadges.add(b));
      for (const ev of c.evidence) {
        if (!allEvidence.some((e) => e.evidenceUrl === ev.evidenceUrl && e.serviceDetected === ev.serviceDetected)) allEvidence.push(ev);
      }
    }
    return {
      ...base,
      phone: g.find((c) => c.phone)?.phone || base.phone,
      fax: g.find((c) => c.fax)?.fax || base.fax,
      website: g.find((c) => c.website)?.website || base.website,
      lat: g.find((c) => c.lat !== undefined)?.lat ?? base.lat,
      lng: g.find((c) => c.lng !== undefined)?.lng ?? base.lng,
      npi: g.find((c) => c.npi)?.npi || base.npi,
      evidence: allEvidence,
      badges: Array.from(allBadges),
      _rawSources: Array.from(allSources),
    };
  });
}
