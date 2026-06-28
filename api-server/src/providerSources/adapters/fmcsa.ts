import type { ProviderCandidate, CoordinateStatus, TrustTier } from "../types";

export async function searchFmcsa(city: string, state: string): Promise<ProviderCandidate[]> {
  const results: ProviderCandidate[] = [];
  try {
    // The FMCSA National Registry uses ASP.NET WebForms with heavy session/viewstate.
    // Direct POST from Node often fails due to missing VIEWSTATE / EVENTVALIDATION.
    // We attempt a basic form POST; if blocked, we report it honestly.
    const form = new URLSearchParams();
    form.append("__EVENTTARGET", "");
    form.append("__EVENTARGUMENT", "");
    form.append("ctl00$MainContentPlaceHolder$txtCity", city);
    form.append("ctl00$MainContentPlaceHolder$ddlState", state.toUpperCase());
    form.append("ctl00$MainContentPlaceHolder$btnSearch", "Search");

    const resp = await fetch("https://ai.fmcsa.dot.gov/mcs150/commonMESearchForm.aspx", {
      method: "POST",
      body: form,
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      signal: AbortSignal.timeout(15000),
    });
    if (!resp.ok) {
      throw new Error(`HTTP ${resp.status}`);
    }
    const html = await resp.text();
    if (html.includes("__VIEWSTATE") && !html.includes("commonMESearchForm")) {
      throw new Error("FMCSA returned a session/login redirect instead of search results");
    }

    const rowRegex = /<tr[^>]*>\s*<td[^>]*>([^<]*)<\/td>\s*<td[^>]*>([^<]*)<\/td>\s*<td[^>]*>([^<]*)<\/td>\s*<td[^>]*>([^<]*)<\/td>\s*<td[^>]*>([^<]*)<\/td>/gi;
    let match: RegExpExecArray | null;
    let found = 0;
    while ((match = rowRegex.exec(html)) !== null) {
      const name = match[1].trim();
      const addr = match[2].trim();
      const cityMatch = match[3].trim();
      const stateMatch = match[4].trim();
      const phone = match[5].trim();
      if (!name || /no records|error|exception/i.test(name)) continue;
      found++;
      results.push({
        id: `fmcsa-${name.toLowerCase().replace(/\s+/g, "-")}`,
        name, address: `${addr}, ${cityMatch}, ${stateMatch}`,
        city: cityMatch, state: stateMatch, postalCode: "",
        phone: phone.replace(/\D/g, "").length >= 10 ? phone : "",
        website: "",
        coordinateStatus: "unverified" as CoordinateStatus,
        source: "FMCSA", sourceDetail: "FMCSA National Registry",
        sourceUrl: "https://ai.fmcsa.dot.gov/mcs150/commonMESearchForm.aspx",
        confidence: "high", trustTier: "registry" as TrustTier, score: 50, badges: ["FMCSA"],
        evidence: [{
          serviceDetected: "DOT physical",
          evidenceUrl: "https://ai.fmcsa.dot.gov/mcs150/commonMESearchForm.aspx",
          evidenceTextSnippet: `Certified Medical Examiner: ${name} in ${cityMatch}, ${stateMatch}`,
          confidence: 95, source: "FMCSA National Registry",
        }],
        _rawSources: ["FMCSA"],
      });
    }
    if (found === 0) {
      // Could be a valid empty result OR the HTML structure changed
      if (!html.includes("Medical Examiner") && !html.includes("Search Results")) {
        throw new Error("FMCSA page structure changed or anti-bot protection active — no result rows found");
      }
    }
  } catch (e: any) {
    // Re-throw so the orchestrator can record this as an adapter error
    throw new Error(`FMCSA adapter blocked/unavailable: ${e.message || String(e)} — needs API key, scraper strategy, or manual import`);
  }
  return results;
}
