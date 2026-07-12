import { useCallback, useEffect, useMemo, useState } from "react";
import { AlertCircle, MapPin, PawPrint, RefreshCw, ShieldCheck } from "lucide-react";
import { Button } from "@/components/ui/button";
import { getPublicReports, type ApiReport } from "@/lib/reportsApi";
import { getReports, STATUS_LABELS, type Report } from "@/lib/storage";

type DisplayReport = Omit<Report, "contactInfo"> & {
  publicId?: string;
};

type DashboardSource = "public-api" | "device" | "empty";

function deviceReports(): DisplayReport[] {
  return getReports().map(({ contactInfo: _contactInfo, ...report }) => report);
}

function normalizeApiReport(report: ApiReport): DisplayReport {
  return {
    ...report,
    createdAt: new Date(report.createdAt).toISOString(),
  };
}

export default function PublicDashboardPage() {
  const [reports, setReports] = useState<DisplayReport[]>([]);
  const [source, setSource] = useState<DashboardSource>("empty");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);

  const loadReports = useCallback(async () => {
    setLoading(true);
    setError(null);

    try {
      const publicReports = await getPublicReports(100);
      setReports(publicReports.map(normalizeApiReport));
      setSource(publicReports.length > 0 ? "public-api" : "empty");
    } catch {
      const localReports = deviceReports();
      setReports(localReports);
      setSource(localReports.length > 0 ? "device" : "empty");
      setError(
        localReports.length > 0
          ? "The public report service is unavailable. Showing reports saved on this device only."
          : "The public report service is unavailable and this device has no saved reports.",
      );
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void loadReports();
  }, [loadReports]);

  const stats = useMemo(() => {
    return {
      reports: reports.length,
      animals: reports.reduce((total, report) => total + report.count, 0),
      urgent: reports.filter((report) => report.inDanger === "yes").length,
      neighborhoods: new Set(reports.map((report) => report.neighborhood.trim()).filter(Boolean)).size,
    };
  }, [reports]);

  return (
    <main className="min-h-screen px-4 pb-16 pt-24">
      <div className="mx-auto max-w-6xl space-y-7">
        <section className="glass-card rounded-3xl p-7 sm:p-9">
          <div className="flex flex-col gap-5 sm:flex-row sm:items-start sm:justify-between">
            <div>
              <div className="mb-3 inline-flex items-center gap-2 rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold text-primary">
                <ShieldCheck size={14} /> Community documentation
              </div>
              <h1 className="font-heading text-3xl font-bold sm:text-4xl">Documented animal concerns</h1>
              <p className="mt-3 max-w-3xl text-sm leading-relaxed text-muted-foreground sm:text-base">
                This dashboard summarizes submitted observations. A listing does not establish a legal finding, confirm wrongdoing, or mean a government agency has reviewed the report.
              </p>
            </div>
            <Button
              type="button"
              variant="outline"
              onClick={() => void loadReports()}
              disabled={loading}
              className="shrink-0 rounded-xl gap-2"
            >
              <RefreshCw size={15} className={loading ? "animate-spin" : ""} /> Refresh
            </Button>
          </div>

          <div className="mt-5 flex flex-wrap gap-2 text-xs">
            {source === "public-api" && (
              <span className="rounded-full bg-primary/10 px-3 py-1 font-semibold text-primary">
                Public database
              </span>
            )}
            {source === "device" && (
              <span className="rounded-full bg-amber-500/15 px-3 py-1 font-semibold text-amber-800 dark:text-amber-300">
                Device-only fallback
              </span>
            )}
            {source === "empty" && !loading && (
              <span className="rounded-full bg-muted px-3 py-1 font-semibold text-muted-foreground">
                No reports available
              </span>
            )}
          </div>
        </section>

        {error && (
          <section className="flex items-start gap-3 rounded-2xl border border-amber-500/30 bg-amber-500/10 p-4 text-sm">
            <AlertCircle size={18} className="mt-0.5 shrink-0 text-amber-700 dark:text-amber-300" />
            <p>{error}</p>
          </section>
        )}

        <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          {[
            ["Reports", stats.reports],
            ["Animals observed", stats.animals],
            ["Immediate concern", stats.urgent],
            ["Neighborhoods", stats.neighborhoods],
          ].map(([label, value]) => (
            <div key={label} className="glass-card rounded-2xl p-5">
              <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">{label}</p>
              <p className="mt-2 font-heading text-3xl font-bold">{value}</p>
            </div>
          ))}
        </section>

        <section className="space-y-4">
          {loading && reports.length === 0 ? (
            <div className="glass-card rounded-3xl p-10 text-center text-sm text-muted-foreground">
              Loading documented concerns…
            </div>
          ) : reports.length === 0 ? (
            <div className="glass-card rounded-3xl p-10 text-center">
              <PawPrint size={34} className="mx-auto text-primary" />
              <h2 className="mt-4 font-heading text-xl font-bold">No reports to display</h2>
              <p className="mt-2 text-sm text-muted-foreground">
                Submitted reports will appear here after the public database is connected.
              </p>
            </div>
          ) : (
            reports.map((report) => (
              <article key={report.publicId ?? report.id} className="glass-card rounded-3xl p-6">
                <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
                  <div className="min-w-0">
                    <div className="flex flex-wrap items-center gap-2">
                      <span className="rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold capitalize text-primary">
                        {report.animalType} · {report.count}
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
                    <h2 className="mt-4 font-heading text-xl font-bold">{report.neighborhood}</h2>
                    <div className="mt-1 flex items-center gap-2 text-sm text-muted-foreground">
                      <MapPin size={14} /> Approximate neighborhood-level location
                    </div>
                  </div>
                  <time className="shrink-0 text-xs text-muted-foreground" dateTime={report.dateObserved}>
                    Observed {report.dateObserved}
                  </time>
                </div>

                <p className="mt-5 whitespace-pre-wrap text-sm leading-relaxed">{report.description}</p>

                {report.concernTypes.length > 0 && (
                  <div className="mt-5 flex flex-wrap gap-2">
                    {report.concernTypes.map((concern) => (
                      <span key={concern} className="rounded-full border border-border px-3 py-1 text-xs text-muted-foreground">
                        {concern}
                      </span>
                    ))}
                  </div>
                )}

                <p className="mt-5 text-xs text-muted-foreground">
                  Public reference: {report.publicId ?? report.id}
                </p>
              </article>
            ))
          )}
        </section>
      </div>
    </main>
  );
}
