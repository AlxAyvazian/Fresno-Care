import { useEffect, useMemo, useState } from "react";
import { Link } from "wouter";
import {
  ArrowRight,
  ClipboardList,
  FileText,
  Map,
  MapPin,
  Radio,
  Shield,
  Sparkles,
  TrendingUp,
} from "lucide-react";
import { PublicFresnoMap } from "@/components/PublicFresnoMap";
import { getPublicReports, type ApiReport } from "@/lib/reportsApi";

function ActionButton({
  href,
  children,
  variant = "primary",
  dataTestId,
}: {
  href: string;
  children: React.ReactNode;
  variant?: "primary" | "glass" | "outline";
  dataTestId?: string;
}) {
  const styles = {
    primary:
      "border-white/55 bg-[#426F9D] text-white shadow-[inset_0_1px_0_rgba(255,255,255,.4),0_12px_28px_rgba(38,67,94,.28)] hover:bg-[#345F8C]",
    glass:
      "border-white/80 bg-[#FDFAE0]/72 text-foreground shadow-[inset_0_1px_0_rgba(255,255,255,.9),0_10px_24px_rgba(54,77,101,.1)] hover:bg-[#FDFAE0]/90 dark:bg-white/5 dark:hover:bg-white/10",
    outline:
      "border-[#547FA9]/55 bg-[#CAE7FF]/45 text-[#345F8C] shadow-[inset_0_1px_0_rgba(255,255,255,.68),0_8px_20px_rgba(54,77,101,.07)] hover:bg-[#CAE7FF]/70",
  };

  return (
    <Link href={href}>
      <span
        data-testid={dataTestId}
        className={`inline-flex cursor-pointer items-center gap-2 rounded-2xl border px-5 py-3 text-sm font-semibold backdrop-blur-xl transition-all duration-300 hover:-translate-y-0.5 ${styles[variant]}`}
      >
        {children}
      </span>
    </Link>
  );
}

const featureCards = [
  {
    icon: ClipboardList,
    title: "Document precisely",
    description: "Capture dates, conditions, agency contact attempts, and neighborhood context in one structured record.",
  },
  {
    icon: FileText,
    title: "Build responsible reports",
    description: "Generate careful, factual documentation without making legal conclusions or exposing private information.",
  },
  {
    icon: TrendingUp,
    title: "Reveal patterns",
    description: "Approved neighborhood-level reports make recurring hotspots visible without publishing precise locations.",
  },
];

export default function LandingPage() {
  const [reports, setReports] = useState<ApiReport[]>([]);
  const [mapOnline, setMapOnline] = useState(true);

  useEffect(() => {
    let cancelled = false;

    async function loadMap() {
      try {
        const approved = await getPublicReports(40);
        if (!cancelled) {
          setReports(approved);
          setMapOnline(true);
        }
      } catch {
        if (!cancelled) {
          setReports([]);
          setMapOnline(false);
        }
      }
    }

    void loadMap();
    return () => {
      cancelled = true;
    };
  }, []);

  const summary = useMemo(
    () => ({
      reports: reports.length,
      urgent: reports.filter((report) => report.inDanger === "yes").length,
      neighborhoods: new Set(reports.map((report) => report.neighborhood.trim()).filter(Boolean)).size,
    }),
    [reports],
  );

  return (
    <main className="liquid-page min-h-screen overflow-x-hidden px-4 pb-16 pt-28">
      <div className="liquid-orb liquid-orb--one" aria-hidden="true" />
      <div className="liquid-orb liquid-orb--two" aria-hidden="true" />

      <div className="relative z-10 mx-auto max-w-7xl space-y-8">
        <section className="glass-card glass-card--hero luminous-edge rounded-[2.2rem] p-5 sm:p-7 lg:p-9">
          <div className="grid items-stretch gap-8 lg:grid-cols-[minmax(0,.84fr)_minmax(430px,1.16fr)]">
            <div className="flex min-w-0 flex-col px-2 py-3 sm:px-4 lg:py-6">
              <div className="mb-5 flex items-start justify-between gap-4">
                <div className="liquid-badge mt-2">
                  <Shield size={14} /> Independent public-interest tool
                </div>
              </div>

              <h1 className="max-w-2xl font-heading text-4xl font-extrabold leading-[1.04] sm:text-5xl lg:text-[3.45rem]">
                Give Fresno’s stray animals a visible record.
              </h1>

              <p className="mt-5 max-w-xl text-base leading-relaxed text-muted-foreground sm:text-lg">
                Document animal-welfare concerns, preserve evidence, and reveal neighborhood patterns without publishing precise locations.
              </p>

              <div className="mt-7 flex flex-wrap gap-3">
                <ActionButton href="/submit" variant="primary" dataTestId="button-document-concern">
                  Document a concern <ArrowRight size={16} />
                </ActionButton>
                <ActionButton href="/dashboard" variant="glass" dataTestId="button-view-dashboard">
                  <Map size={16} /> Open live map
                </ActionButton>
                <ActionButton href="/generate" variant="outline" dataTestId="button-generate-report">
                  Generate report
                </ActionButton>
              </div>

              <div className="mt-8 grid max-w-lg grid-cols-3 gap-3">
                {[
                  ["Approved", summary.reports],
                  ["Urgent", summary.urgent],
                  ["Areas", summary.neighborhoods],
                ].map(([label, value]) => (
                  <div key={label} className="rounded-2xl border border-white/70 bg-[#FDFAE0]/55 p-3 backdrop-blur-xl">
                    <p className="font-heading text-2xl font-extrabold">{value}</p>
                    <p className="mt-1 text-[10px] font-bold uppercase tracking-[.14em] text-muted-foreground">{label}</p>
                  </div>
                ))}
              </div>
            </div>

            <div className="glass-card glass-card--map flex h-full min-h-[520px] flex-col rounded-[1.8rem] p-3">
              <div className="flex items-center justify-between gap-4 px-3 pb-3 pt-1">
                <div>
                  <div className="flex items-center gap-2 text-sm font-semibold">
                    <MapPin size={16} className="text-primary" /> Fresno community map
                  </div>
                  <p className="mt-1 text-xs text-muted-foreground">Approved reports · neighborhood-level only</p>
                </div>
                <span className="liquid-status">
                  <span className={`liquid-status__dot ${mapOnline ? "is-live" : ""}`} />
                  {mapOnline ? "Live" : "API offline"}
                </span>
              </div>
              <PublicFresnoMap reports={reports} compact />
            </div>
          </div>
        </section>

        <section>
          <div className="mb-5 px-1">
            <p className="text-xs font-extrabold uppercase tracking-[.16em] text-primary">How it works</p>
            <h2 className="mt-2 max-w-3xl font-heading text-3xl font-extrabold">One clear workflow from observation to action.</h2>
            <p className="mt-3 max-w-2xl text-sm leading-relaxed text-muted-foreground">
              Each step is separated so residents can document, organize, and share information without confusing private and public data.
            </p>
          </div>

          <div className="grid gap-4 md:grid-cols-3">
            {featureCards.map(({ icon: Icon, title, description }, index) => (
              <article key={title} className="glass-card rounded-3xl p-6">
                <div className="flex items-start justify-between gap-5">
                  <span className="empty-glass__icon h-12 w-12 rounded-2xl">
                    <Icon size={21} />
                  </span>
                  <span className="text-xs font-extrabold tracking-[.16em] text-muted-foreground">0{index + 1}</span>
                </div>
                <h3 className="mt-6 font-heading text-xl font-extrabold">{title}</h3>
                <p className="mt-3 text-sm leading-relaxed text-muted-foreground">{description}</p>
              </article>
            ))}
          </div>
        </section>

        <section className="grid gap-6 lg:grid-cols-[1.15fr_.85fr]">
          <article className="glass-card rounded-[2rem] p-7 sm:p-9">
            <div className="liquid-badge">
              <Radio size={14} /> Fast action
            </div>
            <h2 className="mt-5 font-heading text-3xl font-extrabold">Turn one observation into an organized record.</h2>
            <div className="mt-6 grid gap-3 sm:grid-cols-3">
              {[
                ["Nearby alerts", "Follow neighborhoods and see matching approved reports.", "/watch"],
                ["Printable flyer", "Create a clean share sheet for a lost or found animal.", "/flyer"],
                ["Evidence checklist", "Confirm that dates, details, and contact attempts are captured.", "/tools"],
              ].map(([title, description, href]) => (
                <Link key={title} href={href}>
                  <span className="block h-full cursor-pointer rounded-2xl border border-white/65 bg-[#FDFAE0]/48 p-4 backdrop-blur-xl transition-all hover:-translate-y-0.5 hover:bg-[#FDFAE0]/72 dark:bg-white/5 dark:hover:bg-white/10">
                    <strong className="text-sm">{title}</strong>
                    <span className="mt-2 block text-xs leading-relaxed text-muted-foreground">{description}</span>
                  </span>
                </Link>
              ))}
            </div>
          </article>

          <article className="glass-card luminous-edge rounded-[2rem] p-7 sm:p-9">
            <Sparkles size={22} className="text-primary" />
            <h2 className="mt-5 font-heading text-2xl font-extrabold">Responsible by design</h2>
            <p className="mt-4 text-sm leading-relaxed text-muted-foreground">
              Reports remain private until reviewed. Public views use neighborhood-level placement, exclude reporter contact details, and never present allegations as established facts.
            </p>
            <div className="mt-7">
              <ActionButton href="/submit" variant="primary" dataTestId="button-cta-submit">
                Start documenting <ArrowRight size={16} />
              </ActionButton>
            </div>
          </article>
        </section>

        <footer className="px-4 py-7 text-center text-xs text-muted-foreground">
          VoiceMap Fresno is independent and is not affiliated with the City of Fresno. It does not replace emergency services.
        </footer>
      </div>
    </main>
  );
}
