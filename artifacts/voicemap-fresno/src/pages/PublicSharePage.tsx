import { useEffect, useState } from "react";
import { AlertCircle, CalendarDays, Copy, MapPin, PawPrint, ShieldCheck } from "lucide-react";
import { useRoute } from "wouter";
import { Button } from "@/components/ui/button";
import { getPublicReport, type ApiReport } from "@/lib/reportsApi";
import { STATUS_LABELS } from "@/lib/storage";

export default function PublicSharePage() {
  const [, params] = useRoute<{ publicId: string }>("/share/:publicId");
  const publicId = params?.publicId;
  const [report, setReport] = useState<ApiReport | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [copied, setCopied] = useState(false);

  useEffect(() => {
    let cancelled = false;

    async function load() {
      if (!publicId) {
        setError("The public report reference is missing.");
        setLoading(false);
        return;
      }

      setLoading(true);
      setError(null);

      try {
        const result = await getPublicReport(publicId);
        if (!cancelled) setReport(result);
      } catch (loadError) {
        if (!cancelled) {
          setError(loadError instanceof Error ? loadError.message : "Unable to load this report.");
        }
      } finally {
        if (!cancelled) setLoading(false);
      }
    }

    void load();
    return () => {
      cancelled = true;
    };
  }, [publicId]);

  async function copyLink() {
    await navigator.clipboard.writeText(window.location.href);
    setCopied(true);
    window.setTimeout(() => setCopied(false), 1800);
  }

  return (
    <main className="min-h-screen px-4 pb-16 pt-24">
      <div className="mx-auto max-w-3xl">
        {loading ? (
          <div className="glass-card rounded-3xl p-10 text-center text-sm text-muted-foreground">
            Loading public report…
          </div>
        ) : error || !report ? (
          <div className="glass-card rounded-3xl p-8 text-center">
            <AlertCircle size={36} className="mx-auto text-destructive" />
            <h1 className="mt-4 font-heading text-2xl font-bold">Report unavailable</h1>
            <p className="mt-2 text-sm text-muted-foreground">
              {error ?? "This public report could not be found."}
            </p>
          </div>
        ) : (
          <article className="glass-card overflow-hidden rounded-3xl">
            <header className="border-b border-border/50 p-7 sm:p-9">
              <div className="flex flex-col gap-5 sm:flex-row sm:items-start sm:justify-between">
                <div>
                  <div className="inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">
                    <ShieldCheck size={14} /> Public report
                  </div>
                  <h1 className="mt-4 font-heading text-3xl font-bold">Documented animal concern</h1>
                  <p className="mt-3 max-w-2xl text-sm leading-relaxed text-muted-foreground">
                    This page presents a submitted observation. It does not establish a legal finding, identify a responsible person, or confirm review by a government agency.
                  </p>
                </div>
                <Button type="button" variant="outline" onClick={() => void copyLink()} className="shrink-0 rounded-xl gap-2">
                  <Copy size={15} /> {copied ? "Copied" : "Copy link"}
                </Button>
              </div>
            </header>

            <div className="space-y-7 p-7 sm:p-9">
              <div className="flex flex-wrap gap-2">
                <span className="rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold capitalize text-primary">
                  <PawPrint size={12} className="mr-1 inline" /> {report.animalType} · {report.count}
                </span>
                <span className="rounded-full bg-muted px-3 py-1 text-xs font-semibold text-muted-foreground">
                  {STATUS_LABELS[report.status] ?? report.status}
                </span>
                {report.inDanger === "yes" && (
                  <span className="rounded-full bg-destructive/10 px-3 py-1 text-xs font-semibold text-destructive">
                    Immediate concern reported
                  </span>
                )}
              </div>

              <section>
                <h2 className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">Observation</h2>
                <p className="mt-3 whitespace-pre-wrap text-sm leading-relaxed sm:text-base">{report.description}</p>
              </section>

              <section className="grid gap-4 sm:grid-cols-2">
                <div className="rounded-2xl bg-muted/40 p-4">
                  <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                    <MapPin size={14} /> Public location
                  </div>
                  <p className="mt-2 font-semibold">{report.neighborhood}</p>
                  <p className="mt-1 text-xs text-muted-foreground">Neighborhood-level location only</p>
                </div>
                <div className="rounded-2xl bg-muted/40 p-4">
                  <div className="flex items-center gap-2 text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                    <CalendarDays size={14} /> Date observed
                  </div>
                  <p className="mt-2 font-semibold">{report.dateObserved}</p>
                  {report.timeObserved && <p className="mt-1 text-xs text-muted-foreground">Time: {report.timeObserved}</p>}
                </div>
              </section>

              {report.concernTypes.length > 0 && (
                <section>
                  <h2 className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">Reported concerns</h2>
                  <div className="mt-3 flex flex-wrap gap-2">
                    {report.concernTypes.map((concern) => (
                      <span key={concern} className="rounded-full border border-border px-3 py-1 text-xs text-muted-foreground">
                        {concern}
                      </span>
                    ))}
                  </div>
                </section>
              )}

              {report.evidenceNotes && (
                <section>
                  <h2 className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">Evidence notes</h2>
                  <p className="mt-3 whitespace-pre-wrap text-sm leading-relaxed">{report.evidenceNotes}</p>
                </section>
              )}

              <footer className="border-t border-border/50 pt-5 text-xs text-muted-foreground">
                Public reference: <span className="font-mono">{report.publicId}</span>
              </footer>
            </div>
          </article>
        )}
      </div>
    </main>
  );
}
