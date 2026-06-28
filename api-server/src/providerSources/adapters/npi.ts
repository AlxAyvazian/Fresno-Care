import type { ProviderCandidate, CoordinateStatus, TrustTier } from "../types";

const NPI_TAXONOMY_MAP: Record<string, string[]> = {
  urgent: ["Clinic/Center, Urgent Care", "Urgent Care", "Urgent Care Medicine"],
  occupational: ["Occupational Medicine", "Preventive Medicine, Occupational Medicine"],
  primaryCare: ["Family Medicine", "General Practice", "Internal Medicine", "Pediatric Medicine"],
  dentist: ["Dentist", "Dentist General Practice", "Dental Public Health", "Pediatric Dentistry"],
  radiology: ["Diagnostic Radiology", "Radiology"],
  pulmonary: ["Pulmonary Disease", "Internal Medicine", "Critical Care Medicine"],
  lab: ["Clinical Medical Laboratory", "Clinical Laboratory Technician", "Phlebotomy"],
  physio: ["Physical Therapist", "Physical Therapy"],
  chiropractic: ["Chiropractor", "Chiropractic"],
  audiology: ["Audiologist", "Audiologist-Hearing Aid Fitter", "Hearing Instrument Specialist"],
  behavioral: ["Clinical Psychologist", "Psychiatry", "Mental Health Counselor"],
  dotExam: ["Occupational Medicine", "Family Medicine", "Internal Medicine", "Chiropractor"],
  faamedical: ["Aerospace Medicine", "Occupational Medicine", "Family Medicine"],
  stressTest: ["Cardiovascular Disease", "Cardiology", "Internal Medicine"],
  mammogram: ["Diagnostic Radiology", "Radiology"],
  drugscreen: ["Clinical Medical Laboratory"],
};

export async function searchNpi(city: string, state: string, serviceType: string): Promise<ProviderCandidate[]> {
  const taxonomies = NPI_TAXONOMY_MAP[serviceType] || [serviceType];
  const all: ProviderCandidate[] = [];

  const batches = await Promise.allSettled(
    taxonomies.map(async (taxonomy) => {
      const params = new URLSearchParams({
        version: "2.1", city: city.trim(), state: state.trim().toUpperCase(),
        taxonomy_description: taxonomy, limit: "200",
      });
      const resp = await fetch(`https://npiregistry.cms.hhs.gov/api/?${params.toString()}`, { signal: AbortSignal.timeout(10000) });
      if (!resp.ok) throw new Error(`NPI ${resp.status}`);
      const data = await resp.json() as { results?: any[] };
      return (data.results || []).map((r) => {
        const basic = r.basic || {};
        const addr = r.addresses?.find((a: any) => a.address_purpose === "LOCATION") || r.addresses?.[0] || {};
        const tax = r.taxonomies?.find((t: any) => t.primary) || r.taxonomies?.[0] || {};
        const isOrg = r.enumeration_type === "NPI-2";
        const name = isOrg
          ? (basic.organization_name || basic.organization_name_2 || "Unknown Organization")
          : [basic.first_name, basic.middle_name, basic.last_name].filter(Boolean).join(" ").trim() || "Unknown Provider";
        const npi = String(r.number || "");
        return {
          id: `npi-${npi}`, name,
          address: [addr.address_1, addr.city, addr.state, addr.postal_code?.slice?.(0, 5)].filter(Boolean).join(", "),
          city: addr.city || "", state: addr.state || "", postalCode: addr.postal_code || "",
          phone: addr.telephone_number || "", website: "", npi,
          taxonomy: tax.desc || taxonomy, taxonomyCode: tax.code || "",
          source: "NPI", sourceDetail: `NPI ${r.enumeration_type || ""}`.trim(),
          sourceUrl: npi ? `https://npiregistry.cms.hhs.gov/provider-view/${npi}` : "",
          coordinateStatus: "unverified" as CoordinateStatus,
          confidence: "medium" as const, trustTier: "registry" as TrustTier, score: isOrg ? 35 : 30, badges: ["NPI"], evidence: [], _rawSources: ["NPI"],
        };
      }).filter((c) => c.address && c.city && c.state);
    }),
  );

  batches.forEach((b) => { if (b.status === "fulfilled") all.push(...b.value); });
  return all;
}
