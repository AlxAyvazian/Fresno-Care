import { Link } from "wouter";
import { ClipboardList, FileText, BarChart2, ArrowRight, Shield, AlertTriangle, TrendingUp, MapPin, Printer, Rss, Clock3 } from "lucide-react";
import { KurzgesagtCat } from "@/components/KurzgesagtCat";
import { KurzgesagtDog } from "@/components/KurzgesagtDog";
import { AnimatedBackground } from "@/components/AnimatedBackground";
import { getReports } from "@/lib/storage";
import { HotspotSummary } from "@/components/HotspotSummary";

function GlowButton({ href, children, variant = "primary", dataTestId }: {
  href: string;
  children: React.ReactNode;
  variant?: "primary" | "secondary" | "outline";
  dataTestId?: string;
}) {
  const base = "inline-flex items-center gap-2 px-6 py-3 rounded-2xl font-semibold text-sm transition-all duration-300 cursor-pointer";
  const styles = {
    primary: "bg-primary text-primary-foreground hover:opacity-90 shadow-lg hover:shadow-primary/40",
    secondary: "bg-destructive text-destructive-foreground hover:opacity-90 shadow-lg hover:shadow-destructive/40",
    outline: "border-2 border-primary text-primary hover:bg-primary/10",
  };
  return (
    <Link href={href}>
      <span data-testid={dataTestId} className={`${base} ${styles[variant]}`}>
        {children}
      </span>
    </Link>
  );
}

const features = [
  {
    icon: <ClipboardList size={24} />,
    title: "Document Evidence",
    desc: "Capture detailed observations of stray animal welfare concerns with dates, locations, and evidence notes.",
    color: "from-primary/20 to-primary/5",
    iconBg: "bg-primary/20 text-primary",
  },
  {
    icon: <FileText size={24} />,
    title: "Generate Responsible Reports",
    desc: "Create structured, legally careful reports using responsible language that protects you and documents concerns accurately.",
    color: "from-accent/20 to-accent/5",
    iconBg: "bg-accent/30 text-foreground",
  },
  {
    icon: <TrendingUp size={24} />,
    title: "Escalate Patterns",
    desc: "Route documented patterns to animal control, city officials, and local media with pre-written professional messages.",
    color: "from-destructive/20 to-destructive/5",
    iconBg: "bg-destructive/20 text-destructive",
  },
];

const howItWorks = [
  { num: "01", title: "Observe & Document", desc: "Fill out a detailed report form with location, time, animal condition, and concern type." },
  { num: "02", title: "Build Your Evidence File", desc: "Add notes, photo descriptions, and contact attempts. Track whether agencies responded." },
  { num: "03", title: "Generate a Report Packet", desc: "Create a formal, responsible documentation packet ready to send to officials." },
  { num: "04", title: "Escalate to the Right People", desc: "Use pre-written messages to contact animal control, city council, and local media." },
];

export default function LandingPage() {
  const reports = getReports();
  return (
    <div className="relative min-h-screen overflow-x-hidden">
      <AnimatedBackground />

      <section className="relative z-10 pt-32 pb-24 px-4">
        <div className="max-w-6xl mx-auto">
          <div className="flex flex-col lg:flex-row items-center gap-12">
            <div className="flex-1 text-center lg:text-left">
              <div
                className="inline-flex items-center gap-2 px-3 py-1 rounded-full text-xs font-semibold mb-6 border"
                style={{ background: 'rgba(2,131,145,0.15)', borderColor: 'rgba(2,131,145,0.3)', color: '#028391' }}
              >
                <Shield size={12} />
                Free Public-Interest Tool — Fresno, CA
              </div>

              <h1 className="font-heading text-5xl md:text-6xl lg:text-7xl font-bold text-foreground leading-[1.1] mb-6">
                Give Fresno's
                <br />
                <span className="text-primary">Stray Animals</span>
                <br />
                a Voice
              </h1>

              <p className="text-lg text-muted-foreground max-w-lg mx-auto lg:mx-0 mb-8 leading-relaxed">
                A free tool for Fresno residents to document animal welfare concerns, organize evidence,
                and generate responsible reports that create real pressure for city response.
              </p>

              <div className="flex flex-wrap gap-3 justify-center lg:justify-start">
                <GlowButton href="/submit" variant="primary" dataTestId="button-document-concern">
                  Document a Concern <ArrowRight size={16} />
                </GlowButton>
                <GlowButton href="/generate" variant="secondary" dataTestId="button-generate-report">
                  Generate a Report
                </GlowButton>
                <GlowButton href="/dashboard" variant="outline" dataTestId="button-view-dashboard">
                  View Dashboard
                </GlowButton>
              </div>
            </div>

            <div className="flex items-end gap-6 justify-center flex-shrink-0">
              <div className="relative"><KurzgesagtCat size={160} /></div>
              <div className="relative" style={{ marginBottom: '20px' }}><KurzgesagtDog size={140} /></div>
            </div>
          </div>
        </div>
      </section>

      <section className="relative z-10 py-10 px-4">
        <div className="max-w-6xl mx-auto grid lg:grid-cols-[1.2fr_0.8fr] gap-6">
          <div className="glass-card rounded-3xl p-6">
            <div className="flex items-center gap-2 mb-4">
              <Rss size={15} className="text-primary" />
              <h3 className="font-heading font-bold text-sm">Fast Action Strip</h3>
            </div>
            <div className="grid sm:grid-cols-3 gap-3">
              <a href="/watch" className="rounded-2xl p-4 bg-primary/10 border border-primary/20 hover:bg-primary/15 transition-colors">
                <p className="font-semibold text-sm mb-1">Nearby alerts</p>
                <p className="text-xs text-muted-foreground">Follow neighborhoods and see matching reports.</p>
              </a>
              <a href="/flyer" className="rounded-2xl p-4 bg-accent/20 border border-border/40 hover:bg-accent/30 transition-colors">
                <p className="font-semibold text-sm mb-1">Printable flyer</p>
                <p className="text-xs text-muted-foreground">Make a share sheet in one click.</p>
              </a>
              <a href="/tools" className="rounded-2xl p-4 bg-destructive/10 border border-destructive/20 hover:bg-destructive/15 transition-colors">
                <p className="font-semibold text-sm mb-1">Evidence checklist</p>
                <p className="text-xs text-muted-foreground">Quickly verify you captured the right details.</p>
              </a>
            </div>
          </div>
          <HotspotSummary reports={reports} />
        </div>
      </section>

      <section className="relative z-10 py-12 px-4">
        <div className="max-w-4xl mx-auto">
          <div className="glass-card rounded-3xl p-7 flex gap-4 items-start">
            <Shield size={22} className="text-primary mt-0.5 flex-shrink-0" />
            <div>
              <h4 className="font-heading font-bold text-base mb-1">Responsible Documentation</h4>
              <p className="text-muted-foreground text-sm leading-relaxed">
                VoiceMap uses careful legal language throughout. All submissions are described as
                "reported concerns" and "alleged incidents." This tool helps organize evidence —
                it does not make legal findings, does not label individuals, and does not replace
                emergency services. Always call 911 if an animal is in immediate danger.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section className="relative z-10 py-20 px-4">
        <div className="max-w-4xl mx-auto text-center">
          <div className="flex justify-center gap-6 mb-8">
            <KurzgesagtCat size={80} className="opacity-80" />
            <KurzgesagtDog size={80} className="opacity-80" />
          </div>
          <h2 className="font-heading text-3xl md:text-4xl font-bold mb-4">Ready to document a concern?</h2>
          <p className="text-muted-foreground mb-8 max-w-lg mx-auto">
            It only takes a few minutes to create a documented record that could make a real difference.
          </p>
          <GlowButton href="/submit" variant="primary" dataTestId="button-cta-submit">
            Start Documenting <ArrowRight size={16} />
          </GlowButton>
        </div>
      </section>

      <footer className="relative z-10 py-8 px-4 text-center text-muted-foreground text-sm border-t border-border/40">
        <p>VoiceMap Fresno — A free public-interest tool. Not affiliated with the City of Fresno.</p>
        <p className="mt-1 text-xs opacity-60">
          This tool helps organize reported concerns. It does not make legal conclusions or replace emergency services.
        </p>
      </footer>
    </div>
  );
}
