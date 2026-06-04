import type { Company, CompanyProfile, LocationRecord, Metric, ReportRecord, SourceRecord } from "./types";

export const gditCompanies: Company[] = [
  {
    id: "gdit",
    name: "GDIT (General Dynamics Information Technology)",
    shortName: "GDIT",
    sector: "Government IT, combatant-command digital modernization, cyber, cloud, data center operations, OCONUS mission support, STRATCOM/SOCOM enterprise IT",
    headquarters: "Falls Church, Virginia",
    employees: 30000,
    employeesAsOf: "FY2024 / uploaded GDIT research dossier",
    summary: "GDIT is not a traditional high-physical-injury contractor, but the scale and mission mix make it one of the juiciest targets in the portfolio. The story is a 30,000-person cleared IT workforce, a 2025 award surge across STRATCOM, EMITS 2, SOCOM, Army base readiness, and NOAA supercomputing, plus a small but high-consequence OCONUS population in Cameroon, Egypt, Somalia, and worldwide SOCOM environments. The strategic wedge is not just pre-employment exam volume; it is the lack of visible formal programs around DBA-covered deployed IT workers, data-center hearing conservation, SCIF ergonomics, and mission-consequence behavioral health.",
    tags: ["Combatant Command IT", "STRATCOM", "SOCOM", "OCONUS DBA", "Cleared Workforce", "Data Center Risk", "Behavioral Health"],
  },
];

export const gditSources: SourceRecord[] = [
  { id: "gdit-uploaded-dossier", companyId: "gdit", label: "Uploaded GDIT research dossier", type: "Manual", note: "Uploaded GDIT profile states approximately 30,000 employees, $8.75B FY2024 revenue, no GDIT-specific TRIR/fatality publication, and modeled annual direct injury costs of $4.1M-$7.3M." },
  { id: "gdit-stratcom-2025", companyId: "gdit", label: "$1.5B STRATCOM IT modernization award", type: "URL", url: "https://www.prnewswire.com/news-releases/gdit-awarded-1-5-billion-enterprise-it-modernization-contract-to-strengthen-us-strategic-commands-operational-readiness-302567345.html", note: "2025 STRATCOM award: $1.5B, one-year base plus six option years, supporting strategic deterrence, global strike, nuclear command and control, and electromagnetic spectrum operations." },
  { id: "gdit-emits2-2025", companyId: "gdit", label: "$1.25B EMITS 2 Army Europe & Africa award", type: "URL", url: "https://www.gdit.com/about-gdit/press-releases/gdit-awarded-usd1-25-billion-enterprise-mission-information-technology/", note: "2025 EMITS 2 award: $1.25B, five-month transition base and seven option years supporting U.S. Army Europe and Africa, NATO, mission partners, networks, cybersecurity, AI/ML, cloud, and data analytics." },
  { id: "gdit-socom-2025", companyId: "gdit", label: "$396M SOCOM IT Enterprise award", type: "URL", url: "https://virginiabusiness.com/gdit-396m-special-operations-command-contract/", note: "2025 SOCOM IT Enterprise award: $396M, one-year base plus four option years, enterprise IT support for Special Operations Forces missions worldwide, including AI, multicloud, and zero trust solutions." },
  { id: "gdit-oconus-careers", companyId: "gdit", label: "GDIT OCONUS recruiting footprint", type: "URL", url: "https://www.gdit.com/careers/featured-opportunities/supporting-military-missions-overseas/", note: "GDIT overseas careers page lists clearance-linked OCONUS locations including Cameroon, Egypt, Somalia, Afghanistan, Bahrain, Iraq, Israel, Jordan, Kuwait, Lebanon, Qatar, Syria, Turkey, UAE, and Yemen." },
  { id: "gdit-bls-benchmarks", companyId: "gdit", label: "BLS TRIR benchmark model", type: "Benchmark", note: "Uploaded dossier applies BLS benchmarks to GDIT worker segments: cleared IT analysts/engineers TRIR 0.50, data center technicians TRIR 1.80, OCONUS deployed IT/mission personnel approximately 2.80, and mission support approximately 0.60." },
];

export const gditMetrics: Metric[] = [
  { id: "gdit-employees", companyId: "gdit", label: "Employees", value: 30000, unit: "count", category: "workforce", trend: 8.5, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-fy2024-revenue", companyId: "gdit", label: "FY2024 revenue", value: 8750000000, unit: "usd", category: "financial", trend: 8.9, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-2025-contract-surge", companyId: "gdit", label: "2025 contract surge", value: 3446000000, unit: "usd", category: "financial", trend: 9.6, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-stratcom-value", companyId: "gdit", label: "STRATCOM IT modernization", value: 1500000000, unit: "usd", category: "financial", trend: 9.4, sourceId: "gdit-stratcom-2025" },
  { id: "gdit-emits2-value", companyId: "gdit", label: "EMITS 2 Army Europe/Africa", value: 1250000000, unit: "usd", category: "financial", trend: 9.3, sourceId: "gdit-emits2-2025" },
  { id: "gdit-socom-value", companyId: "gdit", label: "SOCOM IT Enterprise", value: 396000000, unit: "usd", category: "financial", trend: 8.9, sourceId: "gdit-socom-2025" },
  { id: "gdit-expected-injuries", companyId: "gdit", label: "Expected recordable injuries/year", value: 108, unit: "count", category: "safety", trend: 7.4, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-direct-injury-cost-low", companyId: "gdit", label: "Direct injury cost low", value: 4100000, unit: "usd", category: "risk", trend: 7.1, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-direct-injury-cost-high", companyId: "gdit", label: "Direct injury cost high", value: 7300000, unit: "usd", category: "risk", trend: 8.2, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-total-economic-burden-high", companyId: "gdit", label: "Total economic burden high", value: 37000000, unit: "usd", category: "risk", trend: 9.2, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-cleared-it-workers", companyId: "gdit", label: "Cleared IT analysts & engineers", value: 22000, unit: "count", category: "workforce", trend: 7.0, sourceId: "gdit-bls-benchmarks" },
  { id: "gdit-data-center-workers", companyId: "gdit", label: "Data center technicians", value: 2000, unit: "count", category: "workforce", trend: 6.8, sourceId: "gdit-bls-benchmarks" },
  { id: "gdit-oconus-workers", companyId: "gdit", label: "OCONUS deployed IT/mission personnel", value: 1500, unit: "count", category: "workforce", trend: 8.5, sourceId: "gdit-oconus-careers" },
  { id: "gdit-mission-support-workers", companyId: "gdit", label: "Mission support workers", value: 4500, unit: "count", category: "workforce", trend: 7.3, sourceId: "gdit-bls-benchmarks" },
  { id: "gdit-turnover-hires-low", companyId: "gdit", label: "Annual hires at 15% turnover", value: 4500, unit: "count", category: "workforce", trend: 8.2, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-turnover-hires-high", companyId: "gdit", label: "Annual hires at 20% turnover", value: 6000, unit: "count", category: "workforce", trend: 8.6, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-surge-hires-high", companyId: "gdit", label: "Additional surge hires high", value: 1500, unit: "count", category: "workforce", trend: 8.8, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-occu-med-potential", companyId: "gdit", label: "Annual Occu-Med revenue potential", value: 1965000, unit: "usd", category: "financial", trend: 9.0, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-preemployment-potential", companyId: "gdit", label: "Pre-employment physicals", value: 1088000, unit: "usd", category: "financial", trend: 8.7, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-dba-potential", companyId: "gdit", label: "DBA pre-deploy medicals", value: 338000, unit: "usd", category: "financial", trend: 8.6, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-ergonomic-potential", companyId: "gdit", label: "Ergonomic assessments", value: 200000, unit: "usd", category: "financial", trend: 7.4, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-behavioral-potential", companyId: "gdit", label: "Behavioral health screen", value: 155000, unit: "usd", category: "financial", trend: 8.3, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-data-center-audiometry", companyId: "gdit", label: "Data center audiometry", value: 39000, unit: "usd", category: "financial", trend: 6.2, sourceId: "gdit-uploaded-dossier" },
  { id: "gdit-drug-screen", companyId: "gdit", label: "Drug screen pre-employ", value: 145000, unit: "usd", category: "financial", trend: 6.7, sourceId: "gdit-uploaded-dossier" },
];

const gditSections: CompanyProfile["sections"] = [
  {
    id: "overview",
    title: "Overview",
    narrative: "GDIT is the portfolio's large-scale government IT contractor profile: roughly 30,000 employees, $8.75B in FY2024 revenue, and no visible GDIT-specific TRIR or fatality publication. The juicy detail is that the risk does not look like old-school industrial injury risk; it looks like cleared workforce volume, combatant-command mission pressure, OCONUS DBA exposure, data-center technician hazards, and health-program documentation gaps.",
    bullets: ["Largest government IT contractor profile in the current portfolio by modeled scale", "FY2024 revenue modeled at $8.75B with roughly 30,000 employees", "No subsidiary-level TRIR or fatality data identified in the uploaded dossier", "Risk model is built from BLS benchmarks applied to worker composition rather than company-published GDIT safety metrics", "2025 awards create a major new-hire and exam-demand surge on top of baseline turnover"],
    metrics: ["gdit-employees", "gdit-fy2024-revenue", "gdit-2025-contract-surge"],
  },
  {
    id: "contract-surge",
    title: "2025 Contract Surge: Exam Demand at Scale",
    narrative: "The contract surge is the strongest volume story. The uploaded dossier stacks STRATCOM IT modernization, EMITS 2 Army Europe/Africa, SOCOM IT Enterprise, Army base readiness, and NOAA supercomputing into roughly $3.446B in 2025 awards. That is not just revenue; it is onboarding, clearance processing, pre-employment physicals, drug screens, possible deployments, and new program-specific medical-readiness workflows.",
    bullets: ["STRATCOM IT modernization: $1.5B, one-year base plus six option years", "EMITS 2 Army Europe & Africa: $1.25B, five-month transition plus seven option years", "SOCOM IT Enterprise: $396M, one-year base plus four option years", "NOAA/NWS supercomputing: approximately $180M", "Army base readiness task order: modeled at approximately $120M", "Three major 2025 awards alone could drive roughly 500-1,500 additional hires in 2025-2026"],
    metrics: ["gdit-2025-contract-surge", "gdit-stratcom-value", "gdit-emits2-value", "gdit-socom-value"],
  },
  {
    id: "oconus-dba",
    title: "OCONUS Problem: IT Workers in Hostile Environments",
    narrative: "This is the best differentiator. GDIT's public overseas recruiting footprint includes Cameroon, Egypt, Somalia, and broader Asia/Middle East locations. That means the pitch should not treat GDIT as a simple domestic IT shop. A network engineer, systems administrator, or mission-support analyst can be DBA-covered when supporting U.S. government work overseas, even when the job title does not look physically dangerous.",
    bullets: ["OCONUS recruiting footprint includes Africa locations listed as Cameroon, Egypt, and Somalia", "GDIT's overseas page also lists Afghanistan, Bahrain, Iraq, Israel, Jordan, Kuwait, Lebanon, Qatar, Syria, Turkey, UAE, Yemen, and several European locations", "The uploaded dossier models approximately 1,500 OCONUS deployed IT/mission personnel", "OCONUS deployed IT/mission personnel carry the highest modeled TRIR benchmark at approximately 2.8", "The risk is not only injury frequency; it is unlimited DBA medical liability tied to deployment fitness-for-duty documentation"],
    metrics: ["gdit-oconus-workers", "gdit-dba-potential", "gdit-direct-injury-cost-high"],
  },
  {
    id: "stratcom-socom-behavioral-health",
    title: "Behavioral Health: STRATCOM and SOCOM Dimension",
    narrative: "The behavioral-health angle is sharper than a generic EAP pitch. STRATCOM work touches strategic deterrence, global strike, nuclear command and control, and electromagnetic spectrum operations. SOCOM work supports Special Operations Forces missions worldwide. These are cleared, mission-consequence roles where workers may avoid mental health care because of clearance-preservation fear, even when operational stress is building.",
    bullets: ["STRATCOM award supports nuclear command and control, global strike, strategic deterrence, and electromagnetic spectrum operations", "SOCOM award supports Special Operations Forces missions worldwide", "Standard EAP referral language is probably too weak for cleared mission-critical populations", "The stronger offering is a documented, confidential, clearance-aware behavioral-health screening and escalation pathway", "This becomes an occupational-risk management issue, not just an employee wellness benefit"],
    metrics: ["gdit-behavioral-potential", "gdit-stratcom-value", "gdit-socom-value"],
  },
  {
    id: "data-center-hearing-conservation",
    title: "Data Center + Hearing Conservation Wedge",
    narrative: "The data-center technician segment is small compared with GDIT's cleared IT workforce, but it is the highest domestic per-capita risk category in the model. The uploaded dossier calls out server rack handling, raised-floor electrical hazards, repetitive cable management, heavy equipment movement, and sustained server-noise environments. That creates a concrete occupational-health wedge: baseline audiometry, hearing conservation, ergonomic assessment, and technician-specific surveillance.",
    bullets: ["Data center technicians: approximately 2,000 workers", "Modeled BLS TRIR benchmark: approximately 1.8", "Estimated direct injury cost: approximately $0.7M-$1.4M annually", "Server noise creates a specific hearing-conservation conversation, not just a general physical exam conversation", "Data-center audiometry is modeled at approximately $39K annually before broader surveillance expansion"],
    metrics: ["gdit-data-center-workers", "gdit-data-center-audiometry", "gdit-ergonomic-potential"],
  },
  {
    id: "ergonomic-liability",
    title: "Ergonomic Liability: 30,000 Screen Workers",
    narrative: "The ergonomic angle is the easiest program to productize. GDIT's cleared workforce is overwhelmingly screen-based: software engineers, cyber analysts, data scientists, system administrators, and mission-support analysts. Many work in government-furnished facilities and SCIF environments where fixed furniture and monitor placement create cumulative trauma risk that can be hard to correct after the fact.",
    bullets: ["Cleared IT analysts and engineers: approximately 22,000 workers", "Even low TRIR applied to 22,000 workers creates material injury volume", "Uploaded dossier estimates roughly 55 recordable injuries per year in the cleared IT/engineering population", "Cumulative trauma issues can trigger restricted duty, lost clearance time, staffing disruption, and return-to-work delays", "Occu-Med can frame ergonomic assessments as a measurable annual prevention program instead of a one-off accommodation response"],
    metrics: ["gdit-cleared-it-workers", "gdit-expected-injuries", "gdit-ergonomic-potential"],
  },
  {
    id: "injury-cost-architecture",
    title: "Injury Cost Architecture",
    narrative: "The direct-cost model is only the visible layer. The uploaded dossier estimates $4.1M-$7.3M in annual direct injury costs, but applying a 3x-5x indirect multiplier creates a total economic burden of roughly $12M-$37M when project staffing disruption, clearance delays, and return-to-work friction are included.",
    bullets: ["Total expected injuries: approximately 108 per year", "Direct annual injury cost estimate: approximately $4.1M-$7.3M", "Modeled total economic burden: approximately $12M-$37M", "Large cleared IT population drives volume despite low per-capita injury rate", "OCONUS and data-center populations carry the sharper per-capita and liability-tail risks"],
    metrics: ["gdit-expected-injuries", "gdit-direct-injury-cost-low", "gdit-direct-injury-cost-high", "gdit-total-economic-burden-high"],
  },
  {
    id: "revenue-potential",
    title: "Revenue Potential",
    narrative: "The immediate revenue case is nearly $2M annually before any premium program buildout. Pre-employment physicals dominate the baseline volume, but the high-value differentiation comes from DBA pre-deploy medicals, behavioral health screens, ergonomic assessments, and data-center audiometry.",
    bullets: ["Total modeled annual Occu-Med opportunity: approximately $1.965M", "Pre-employment physicals: approximately $1.088M", "DBA pre-deploy medicals: approximately $338K", "Ergonomic assessments: approximately $200K", "Behavioral health screens: approximately $155K", "Data-center audiometry: approximately $39K", "Drug screens: approximately $145K"],
    metrics: ["gdit-occu-med-potential", "gdit-preemployment-potential", "gdit-dba-potential", "gdit-behavioral-potential"],
  },
  {
    id: "what-occu-med-should-say",
    title: "What Occu-Med Should Say",
    narrative: "The strongest positioning is direct: GDIT probably already buys occupational-health services somewhere, but it may not be analyzing whether those vendors actually document OCONUS fitness-for-duty, hearing conservation, SCIF ergonomics, and clearance-aware behavioral-health risk in a way that protects mission continuity and DBA defensibility.",
    bullets: ["Lead with the contract surge and onboarding volume, then pivot immediately to hidden risk", "Do not pitch as generic urgent-care capacity", "Pitch as a programmatic documentation layer for cleared, OCONUS, data-center, and mission-critical populations", "Use STRATCOM and SOCOM as the emotional/operational hook", "Ask whether GDIT has baseline audiograms, OCONUS fitness-for-duty protocols, and clearance-aware behavioral-health documentation for these populations"],
    metrics: ["gdit-occu-med-potential", "gdit-turnover-hires-low", "gdit-surge-hires-high"],
  },
  {
    id: "source-library",
    title: "Source Library",
    narrative: "The profile is grounded in the uploaded GDIT dossier and refreshed contract/career sources for STRATCOM, EMITS 2, SOCOM, and OCONUS recruiting geography. The next evidence upgrade should be customer-specific headcount and any internal vendor/pricing intelligence.",
    bullets: ["Uploaded GDIT research dossier", "GDIT/General Dynamics STRATCOM modernization announcement", "GDIT EMITS 2 Army Europe and Africa announcement", "Virginia Business SOCOM IT Enterprise award coverage", "GDIT OCONUS careers page", "BLS benchmark framework used for modeled worker-risk estimates"],
    metrics: [],
  },
];

export const gditProfiles: CompanyProfile[] = [{ companyId: "gdit", sections: gditSections }];

export const gditLocations: LocationRecord[] = [
  { id: "gdit-falls-church", companyId: "gdit", company: "GDIT", city: "Falls Church", state: "VA", country: "USA", region: "United States", facilityType: "Headquarters / enterprise IT operations", activity: "Government IT, cyber, cloud, mission support, and combatant-command modernization", notes: "Headquartered in Falls Church, Virginia; portfolio profile models 30,000 employees and $8.75B FY2024 revenue.", coordinates: [-77.1711, 38.8823] },
  { id: "gdit-offutt-stratcom", companyId: "gdit", company: "GDIT", city: "Offutt AFB", state: "NE", country: "USA", region: "United States", facilityType: "STRATCOM IT modernization environment", activity: "Strategic deterrence, global strike, nuclear command and control, enterprise IT modernization", notes: "$1.5B STRATCOM modernization award; domestic but high mission-consequence behavioral-health and continuity signal.", coordinates: [-95.9183, 41.1183] },
  { id: "gdit-army-europe-africa", companyId: "gdit", company: "GDIT", city: "Wiesbaden", country: "Germany", region: "Europe / Africa", facilityType: "Army Europe and Africa enterprise IT support", activity: "EMITS 2 support to U.S. Army Europe and Africa headquarters, subordinate organizations, NATO, and partners", notes: "$1.25B EMITS 2 task order with geographic dispersion across Europe and Africa.", coordinates: [8.2398, 50.0782] },
  { id: "gdit-socom-worldwide", companyId: "gdit", company: "GDIT", city: "Worldwide SOCOM missions", country: "Global", region: "Worldwide", facilityType: "Special Operations Forces IT support", activity: "Enterprise IT, AI, multicloud, and zero-trust support for SOF missions worldwide", notes: "$396M SOCOM IT Enterprise contract; strongest behavioral-health and OCONUS mission-support differentiator.", coordinates: [-82.5211, 27.8493] },
  { id: "gdit-cameroon", companyId: "gdit", company: "GDIT", city: "Cameroon", country: "Cameroon", region: "Africa", facilityType: "OCONUS recruiting footprint", activity: "Potential deployed IT and communications mission support", notes: "GDIT overseas careers page lists Cameroon under Africa OCONUS locations requiring potential clearance-linked support.", coordinates: [11.5021, 3.848] },
  { id: "gdit-egypt", companyId: "gdit", company: "GDIT", city: "Egypt", country: "Egypt", region: "Africa / Middle East", facilityType: "OCONUS recruiting footprint", activity: "Potential deployed IT and communications mission support", notes: "GDIT overseas careers page lists Egypt under Africa OCONUS locations.", coordinates: [31.2357, 30.0444] },
  { id: "gdit-somalia", companyId: "gdit", company: "GDIT", city: "Somalia", country: "Somalia", region: "Africa", facilityType: "OCONUS recruiting footprint", activity: "Potential deployed IT and communications mission support", notes: "GDIT overseas careers page lists Somalia under Africa OCONUS locations; this is a key DBA exposure signal.", coordinates: [45.3182, 2.0469] },
];

export const gditReports: ReportRecord[] = [
  {
    id: "gdit-juicy-detail-profile",
    companyId: "gdit",
    title: "GDIT juicy-detail opportunity profile: contract surge, OCONUS DBA, STRATCOM/SOCOM behavioral health, and data-center surveillance",
    createdAt: "2026-06-04",
    summary: "GDIT combines a 30,000-person cleared IT workforce, an estimated $8.75B FY2024 revenue base, a 2025 contract surge of roughly $3.446B, high-consequence STRATCOM and SOCOM mission environments, active OCONUS recruiting footprints, and nearly $2M in modeled annual Occu-Med revenue potential. The pitch should be programmatic documentation and risk control, not generic physicals.",
    signals: ["2025 award stack includes $1.5B STRATCOM, $1.25B EMITS 2, $396M SOCOM, NOAA supercomputing, and Army base readiness", "OCONUS locations include Cameroon, Egypt, Somalia, and broader Middle East/Asia theaters", "Baseline turnover of 15%-20% implies roughly 4,500-6,000 new hires per year before contract-surge hiring", "Uploaded model estimates roughly 108 recordable injuries per year and $4.1M-$7.3M in annual direct injury costs", "Indirect burden model reaches approximately $12M-$37M when clearance delays, RTW delays, and staffing disruption are included", "Largest modeled Occu-Med lane is pre-employment physicals at approximately $1.088M annually", "Best strategic differentiators are DBA pre-deploy medicals, behavioral health for mission-critical cleared workers, data-center audiometry, and SCIF ergonomics"],
  },
];
