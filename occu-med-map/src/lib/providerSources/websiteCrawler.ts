import type { ProviderEvidence } from './types';

const SERVICE_KEYWORDS: Record<string, string[]> = {
  'occupational medicine': ['occupational medicine', 'occ med', 'occupational health'],
  'DOT physical': ['dot physical', 'dot exam', 'fmcsa', 'dot medical exam'],
  'pulmonary function test': ['pulmonary function', 'pft', 'spirometry', 'lung function'],
  'spirometry': ['spirometry', 'spirometer', 'lung function test'],
  'audiogram': ['audiogram', 'audiometry', 'hearing test', 'hearing conservation'],
  'hearing test': ['hearing test', 'audiometry', 'hearing screening'],
  'respirator clearance': ['respirator clearance', 'respirator fit', 'respirator medical clearance'],
  'fit testing': ['fit testing', 'fit test', 'respirator fit test', 'mask fit'],
  'drug screen': ['drug screen', 'drug test', 'drug testing', 'toxicology', 'urine drug'],
  'alcohol test': ['alcohol test', 'breath alcohol', 'alcohol screening'],
  'breath alcohol': ['breath alcohol', 'bat', 'evidential breath testing'],
  'BAT': ['breath alcohol technician', 'bat', 'evidential breath testing'],
  'venipuncture': ['venipuncture', 'blood draw', 'phlebotomy', 'blood collection'],
  'lab collection': ['lab collection', 'specimen collection', 'blood draw', 'phlebotomy'],
  'chest x-ray': ['chest x-ray', 'chest xray', 'chest radiograph'],
  'x-ray': ['x-ray', 'xray', 'radiograph', 'radiography'],
  'EKG': ['ekg', 'electrocardiogram', 'ecg', 'electrocardiography'],
  'stress test': ['stress test', 'treadmill stress', 'cardiac stress', 'exercise stress'],
  'ultrasound': ['ultrasound', 'sonography', 'diagnostic ultrasound'],
  'mammogram': ['mammogram', 'mammography', 'breast imaging', 'breast screening'],
  'physical therapy': ['physical therapy', 'physiotherapy', 'pt rehabilitation'],
  'dental exam': ['dental exam', 'dental examination', 'oral exam'],
  'bitewing x-rays': ['bitewing', 'bitewing x-ray', 'dental x-ray'],
};

export async function crawlWebsiteEvidence(website: string): Promise<ProviderEvidence[]> {
  const evidence: ProviderEvidence[] = [];
  if (!website || !/^https?:\/\//i.test(website)) return evidence;

  try {
    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(), 8000);
    // Note: In-browser fetch to arbitrary domains is blocked by CORS.
    // This works for CORS-enabled sites or when running through a proxy.
    // In production, route through a backend proxy.
    const resp = await fetch(website, {
      signal: controller.signal,
      headers: { Accept: 'text/html' },
    });
    clearTimeout(timer);
    if (!resp.ok) return evidence;
    const html = await resp.text();
    const text = html
      .replace(/<script[^>]*>[\s\S]*?<\/script>/gi, '')
      .replace(/<style[^>]*>[\s\S]*?<\/style>/gi, '')
      .replace(/<[^>]+>/g, ' ')
      .replace(/\s+/g, ' ')
      .toLowerCase();

    for (const [service, keywords] of Object.entries(SERVICE_KEYWORDS)) {
      for (const kw of keywords) {
        if (text.includes(kw.toLowerCase())) {
          const idx = text.indexOf(kw.toLowerCase());
          const snippet = text.substring(Math.max(0, idx - 60), idx + kw.length + 60).trim();
          evidence.push({
            serviceDetected: service,
            evidenceUrl: website,
            evidenceTextSnippet: snippet,
            confidence: Math.min(70, 30 + snippet.length / 10),
            source: 'Website Evidence',
          });
          break; // one evidence per service per page
        }
      }
    }
  } catch (e) {
    // CORS or network failure — silently skip
  }

  return evidence;
}

export async function enrichCandidatesWithWebsiteEvidence(
  candidates: { id: string; name: string; website: string; evidence: ProviderEvidence[] }[],
): Promise<{ id: string; name: string; website: string; evidence: ProviderEvidence[] }[]> {
  const toEnrich = candidates.filter((c) => c.website).slice(0, 12);

  const enriched = await Promise.all(
    toEnrich.map(async (c) => {
      const ev = await crawlWebsiteEvidence(c.website);
      return { ...c, evidence: [...c.evidence, ...ev] };
    }),
  );

  const enrichedMap = new Map(enriched.map((c) => [c.id, c]));
  return candidates.map((c) => {
    const match = enrichedMap.get(c.id);
    return match || c;
  });
}
