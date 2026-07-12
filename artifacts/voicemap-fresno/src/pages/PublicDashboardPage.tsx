import { useCallback, useEffect, useMemo, useState } from "react";
import {
  AlertCircle,
  MapPin,
  PawPrint,
  RefreshCw,
} from "lucide-react";
import { Button } from "@/components/ui/button";
import { PublicFresnoMap } from "@/components/PublicFresnoMap";
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
          : "The public report service is unavailable. The map remains available, but approved reports cannot be loaded.",
      );
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    void loadReports();
  }, [loadReports]);

  const stats = useMemo(
    () => ({
      reports: reports.length,
      animals: reports.reduce((total, report) => total + report.count, 0),
      urgent: reports.filter((report) => report.inDanger === "yes").length,
      neighborhoods: new Set(reports.map((report) => report.neighborhood.trim()).filter(Boolean)).size,
    }),
    [reports],
  );

  const connectionLabel =
    source === "public-api"
      ? "Public database connected"
      : source === "device"
        ? "Device-only fallback"
        : "Awaiting approved reports";

  return (
    <main className="liquid-page min-h-screen px-3 pb-20 pt-24 sm:px-4 sm:pt-28">
      <div className="liquid-orb liquid-orb--one" aria-hidden="true" />
      <div className="liquid-orb liquid-orb--two" aria-hidden="true" />

      <div className="relative z-10 mx-auto max-w-[96rem] space-y-5">
        <section className="glass-card rounded-[2rem] p-3 sm:p-4">
          <div className="flex flex-col gap-3 px-2 pb-3 pt-1 sm:flex-row sm:items-center sm:justify-between sm:px-3">
            <div>
              <h1 className="font-heading text-2xl font-extrabold sm:text-3xl">Live Fresno animal-concern map</h1>
              <p className="mt-1 text-xs text-muted-foreground sm:text-sm">
                Approved reports are displayed at neighborhood level; precise locations remain private.
              </p>
            </div>

            <div className="flex flex-wrap items-center gap-2">
              <span className="liquid-status">
                <span className={`liquid-status__dot ${source === "public-api" ? "is-live" : ""}`} />
                {connectionLabel}
              </span>
              <Button
                type="button"
                variant="outline"
                onClick={() => void loadReports()}
                disabled={loading}
                className="liquid-button gap-2 rounded-2xl"
              >
                <RefreshCw size={15} className={loading ? "animate-spin" : ""} /> Refresh
              </Button>
            </div>
          </div>

          <PublicFresnoMap reports={reports} />
        </section>

        {error && (
          <section className="glass-alert flex items-start gap-3 rounded-2xl p-4 text-sm">
            <AlertCircle size={18} className="mt-0.5 shrink-0 text-amber-800 dark:text-amber-300" />
            <div>
              <p className="font-semibold">The frontend cannot reach the public API.</p>
              <p className="mt-1 text-muted-foreground">{error}</p>
            </div>
          </section>
        )}

        <section className="grid gap-3 sm:grid-cols-2 lg:grid-cols-4">
          {[
            ["Approved reports", stats.reports],
            ["Animals observed", stats.animals],
            ["Immediate concerns", stats.urgent],
            ["Neighborhoods", stats.neighborhoods],
          ].map(([label, value]) => (
            <div key={label} className="glass-card rounded-3xl p-5">
              <p className="text-xs font-extrabold uppercase tracking-[0.14em] text-muted-foreground">{label}</p>
              <p className="mt-2 font-heading text-4xl font-extrabold">{value}</p>
            </div>
          ))}
        </section>

        <section className="space-y-4">
          <div className="flex items-end justify-between gap-4 px-1">
            <div>
              <p className="text-xs font-extrabold uppercase tracking-[0.16em] text-primary">Approved reports</p>
              <h2 className="mt-1 font-heading text-2xl font-extrabold">Community record</h2>
            </div>
            <span className="hidden text-xs text-muted-foreground sm:block">Precise addresses remain private</span>
          </div>

          {loading && reports.length === 0 ? (
            <div className="glass-card rounded-3xl p-10 text-center text-sm text-muted-foreground">
              Loading documented concerns…
            </div>
          ) : reports.length === 0 ? (
            <div className="glass-card empty-glass rounded-[2rem] p-10 text-center sm:p-12">
              <div className="empty-glass__icon">
                <PawPrint size={30} />
              </div>
              <h3 className="mt-5 font-heading text-2xl font-extrabold">No approved reports yet</h3>
              <p className="mx-auto mt-2 max-w-lg text-sm leading-relaxed text-muted-foreground">
                The map remains active. Reports appear after private moderation approves neighborhood-level publication.
              </p>
            </div>
          ) : (
            <div className="grid gap-4 lg:grid-cols-2">
              {reports.map((report) => (
                <article key={report.publicId ?? report.id} className="glass-card report-glass rounded-3xl p-6">
                  <div className="flex flex-col gap-4 sm:flex-row sm:items-start sm:justify-between">
                    <div className="min-w-0">
                      <div className="flex flex-wrap items-center gap-2">
                        <span className="liquid-chip capitalize">
                          {report.animalType} · {report.count}
                        </span>
                        <span className="liquid-chip liquid-chip--muted">
                          {STATUS_LABELS[report.status] ?? report.status}
                        </span>
                        {report.inDanger === "yes" && (
                          <span className="liquid-chip liquid-chip--danger">Immediate concern</span>
                        )}
                      </div>
                      <h3 className="mt-5 font-heading text-xl font-extrabold">{report.neighborhood}</h3>
                      <div className="mt-2 flex items-center gap-2 text-sm text-muted-foreground">
                        <MapPin size={14} /> Neighborhood-level location
                      </div>
                    </div>
                    <time className="shrink-0 text-xs text-muted-foreground" dateTime={report.dateObserved}>
                      {report.dateObserved}
                    </time>
                  </div>

                  <p className="mt-5 line-clamp-4 whitespace-pre-wrap text-sm leading-relaxed text-muted-foreground">
                    {report.description}
                  </p>

                  {report.concernTypes.length > 0 && (
                    <div className="mt-5 flex flex-wrap gap-2">
                      {report.concernTypes.slice(0, 4).map((concern) => (
                        <span key={concern} className="liquid-chip liquid-chip--outline">
                          {concern}
                        </span>
                      ))}
                    </div>
                  )}

                  <p className="mt-5 truncate text-[11px] text-muted-foreground">
                    Public reference: {report.publicId ?? report.id}
                  </p>
                </article>
              ))}
            </div>
          )}
        </section>
      </div>
    </main>
  );
}
