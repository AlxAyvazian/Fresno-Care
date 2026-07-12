import { useCallback, useEffect, useMemo, useState } from "react";
import {
  AlertCircle,
  Eye,
  KeyRound,
  LockKeyhole,
  LogOut,
  MapPin,
  RefreshCw,
  ShieldCheck,
} from "lucide-react";
import { useLocation } from "wouter";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  getAdminReports,
  MODERATION_STATUSES,
  PUBLICATION_STATUSES,
  updateAdminPublicationStatus,
  updateAdminReportStatus,
  type AdminReport,
  type ModerationStatus,
  type PublicationStatus,
} from "@/lib/moderationApi";
import { STATUS_LABELS } from "@/lib/storage";

const SESSION_KEY = "fresno_care_admin_key";

const PUBLICATION_LABELS: Record<PublicationStatus, string> = {
  pending: "Awaiting review",
  approved: "Approved for public view",
  rejected: "Rejected from publication",
};

export default function ModerationReviewPage() {
  const [, navigate] = useLocation();
  const [keyInput, setKeyInput] = useState("");
  const [adminKey, setAdminKey] = useState(() => sessionStorage.getItem(SESSION_KEY) ?? "");
  const [reports, setReports] = useState<AdminReport[]>([]);
  const [loading, setLoading] = useState(false);
  const [updating, setUpdating] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  const loadReports = useCallback(async () => {
    if (!adminKey) return;

    setLoading(true);
    setError(null);
    try {
      setReports(await getAdminReports(adminKey, 250));
    } catch (loadError) {
      setReports([]);
      setError(loadError instanceof Error ? loadError.message : "Unable to load moderation reports.");
    } finally {
      setLoading(false);
    }
  }, [adminKey]);

  useEffect(() => {
    void loadReports();
  }, [loadReports]);

  const publicationCounts = useMemo(() => {
    return PUBLICATION_STATUSES.reduce<Record<PublicationStatus, number>>(
      (result, status) => {
        result[status] = reports.filter((report) => report.publicationStatus === status).length;
        return result;
      },
      { pending: 0, approved: 0, rejected: 0 },
    );
  }, [reports]);

  function unlock() {
    const value = keyInput.trim();
    if (!value) return;
    sessionStorage.setItem(SESSION_KEY, value);
    setAdminKey(value);
    setKeyInput("");
  }

  function lock() {
    sessionStorage.removeItem(SESSION_KEY);
    setAdminKey("");
    setReports([]);
    setError(null);
  }

  async function changeStatus(report: AdminReport, status: ModerationStatus) {
    setUpdating(`${report.publicId}:status`);
    setError(null);
    try {
      const updated = await updateAdminReportStatus(adminKey, report.publicId, status);
      setReports((current) => current.map((item) => item.publicId === updated.publicId ? updated : item));
    } catch (updateError) {
      setError(updateError instanceof Error ? updateError.message : "Unable to update report status.");
    } finally {
      setUpdating(null);
    }
  }

  async function changePublication(report: AdminReport, publicationStatus: PublicationStatus) {
    setUpdating(`${report.publicId}:publication`);
    setError(null);
    try {
      const updated = await updateAdminPublicationStatus(adminKey, report.publicId, publicationStatus);
      setReports((current) => current.map((item) => item.publicId === updated.publicId ? updated : item));
    } catch (updateError) {
      setError(updateError instanceof Error ? updateError.message : "Unable to update publication status.");
    } finally {
      setUpdating(null);
    }
  }

  if (!adminKey) {
    return (
      <main className="min-h-screen px-4 pb-16 pt-28">
        <div className="mx-auto max-w-md">
          <section className="glass-card rounded-3xl p-8 sm:p-10">
            <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-primary/10 text-primary">
              <LockKeyhole size={28} />
            </div>
            <h1 className="mt-5 font-heading text-3xl font-bold">Moderation access</h1>
            <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
              This area contains precise locations and optional reporter contact details. Enter the server-configured admin key to continue.
            </p>
            <div className="mt-6 space-y-3">
              <Input
                type="password"
                value={keyInput}
                onChange={(event) => setKeyInput(event.target.value)}
                onKeyDown={(event) => {
                  if (event.key === "Enter") unlock();
                }}
                placeholder="Admin API key"
                autoComplete="off"
                className="rounded-xl"
              />
              <Button type="button" onClick={unlock} disabled={!keyInput.trim()} className="w-full rounded-xl gap-2">
                <KeyRound size={16} /> Open moderation
              </Button>
            </div>
            <p className="mt-4 text-xs leading-relaxed text-muted-foreground">
              The key is kept only for this browser session and is cleared when you sign out or close the session.
            </p>
          </section>
        </div>
      </main>
    );
  }

  return (
    <main className="min-h-screen px-4 pb-16 pt-24">
      <div className="mx-auto max-w-6xl space-y-6">
        <section className="glass-card rounded-3xl p-7 sm:p-9">
          <div className="flex flex-col gap-5 sm:flex-row sm:items-start sm:justify-between">
            <div>
              <div className="mb-3 inline-flex items-center gap-2 rounded-full bg-destructive/10 px-3 py-1 text-xs font-semibold text-destructive">
                <ShieldCheck size={14} /> Private moderation
              </div>
              <h1 className="font-heading text-3xl font-bold sm:text-4xl">Report review queue</h1>
              <p className="mt-3 max-w-3xl text-sm leading-relaxed text-muted-foreground">
                New reports remain private until publication is explicitly approved. Status routing and public approval are separate controls.
              </p>
            </div>
            <div className="flex flex-wrap gap-2">
              <Button type="button" variant="outline" onClick={() => void loadReports()} disabled={loading} className="rounded-xl gap-2">
                <RefreshCw size={15} className={loading ? "animate-spin" : ""} /> Refresh
              </Button>
              <Button type="button" variant="outline" onClick={lock} className="rounded-xl gap-2">
                <LogOut size={15} /> Sign out
              </Button>
            </div>
          </div>
        </section>

        {error && (
          <section className="flex items-start gap-3 rounded-2xl border border-destructive/30 bg-destructive/10 p-4 text-sm">
            <AlertCircle size={18} className="mt-0.5 shrink-0 text-destructive" />
            <div>
              <p className="font-semibold">Moderation request failed</p>
              <p className="mt-1 text-muted-foreground">{error}</p>
            </div>
          </section>
        )}

        <section className="grid gap-3 sm:grid-cols-3">
          {PUBLICATION_STATUSES.map((status) => (
            <div key={status} className="glass-card rounded-2xl p-5">
              <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                {PUBLICATION_LABELS[status]}
              </p>
              <p className="mt-2 font-heading text-3xl font-bold">{publicationCounts[status]}</p>
            </div>
          ))}
        </section>

        <section className="space-y-4">
          {loading && reports.length === 0 ? (
            <div className="glass-card rounded-3xl p-10 text-center text-sm text-muted-foreground">Loading review queue…</div>
          ) : reports.length === 0 ? (
            <div className="glass-card rounded-3xl p-10 text-center text-sm text-muted-foreground">
              No reports are available, or the supplied credential was not accepted.
            </div>
          ) : (
            reports.map((report) => {
              const busy = updating?.startsWith(report.publicId) ?? false;
              return (
                <article key={report.publicId} className="glass-card rounded-3xl p-6 sm:p-7">
                  <div className="flex flex-col gap-5 lg:flex-row lg:items-start lg:justify-between">
                    <div className="min-w-0 flex-1">
                      <div className="flex flex-wrap gap-2">
                        <span className="rounded-full bg-primary/10 px-3 py-1 text-xs font-semibold capitalize text-primary">
                          {report.animalType} · {report.count}
                        </span>
                        <span className={`rounded-full px-3 py-1 text-xs font-semibold ${
                          report.publicationStatus === "approved"
                            ? "bg-green-500/15 text-green-700 dark:text-green-300"
                            : report.publicationStatus === "rejected"
                              ? "bg-destructive/10 text-destructive"
                              : "bg-amber-500/15 text-amber-800 dark:text-amber-300"
                        }`}>
                          {PUBLICATION_LABELS[report.publicationStatus]}
                        </span>
                        {report.inDanger === "yes" && (
                          <span className="rounded-full bg-destructive/10 px-3 py-1 text-xs font-semibold text-destructive">
                            Immediate concern
                          </span>
                        )}
                      </div>

                      <h2 className="mt-4 font-heading text-xl font-bold">{report.neighborhood}</h2>
                      <div className="mt-2 flex items-start gap-2 rounded-xl bg-destructive/5 p-3 text-sm">
                        <MapPin size={16} className="mt-0.5 shrink-0 text-destructive" />
                        <div>
                          <p className="text-xs font-semibold uppercase tracking-wide text-destructive">Private precise location</p>
                          <p className="mt-1">{report.location}</p>
                        </div>
                      </div>

                      <p className="mt-5 whitespace-pre-wrap text-sm leading-relaxed">{report.description}</p>

                      <div className="mt-5 grid gap-3 sm:grid-cols-2">
                        <div className="rounded-2xl bg-muted/40 p-4 text-sm">
                          <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">Observed</p>
                          <p className="mt-2">{report.dateObserved}{report.timeObserved ? ` at ${report.timeObserved}` : ""}</p>
                        </div>
                        <div className="rounded-2xl bg-muted/40 p-4 text-sm">
                          <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">Reporter contact</p>
                          <p className="mt-2 break-words">{report.reporterContact || "Not provided"}</p>
                        </div>
                      </div>

                      <p className="mt-5 text-xs text-muted-foreground">
                        Public ID: <span className="font-mono">{report.publicId}</span>
                      </p>
                    </div>

                    <div className="w-full shrink-0 space-y-4 lg:w-64">
                      <div>
                        <label className="block text-xs font-semibold uppercase tracking-wide text-muted-foreground">Case status</label>
                        <select
                          value={report.status}
                          disabled={busy}
                          onChange={(event) => void changeStatus(report, event.target.value as ModerationStatus)}
                          className="mt-2 h-11 w-full rounded-xl border border-input bg-background px-3 text-sm"
                        >
                          {MODERATION_STATUSES.map((status) => (
                            <option key={status} value={status}>{STATUS_LABELS[status] ?? status}</option>
                          ))}
                        </select>
                      </div>

                      <div>
                        <label className="block text-xs font-semibold uppercase tracking-wide text-muted-foreground">Publication decision</label>
                        <select
                          value={report.publicationStatus}
                          disabled={busy}
                          onChange={(event) => void changePublication(report, event.target.value as PublicationStatus)}
                          className="mt-2 h-11 w-full rounded-xl border border-input bg-background px-3 text-sm"
                        >
                          {PUBLICATION_STATUSES.map((status) => (
                            <option key={status} value={status}>{PUBLICATION_LABELS[status]}</option>
                          ))}
                        </select>
                      </div>

                      <Button
                        type="button"
                        variant="outline"
                        disabled={report.publicationStatus !== "approved"}
                        onClick={() => navigate(`/share/${report.publicId}`)}
                        className="w-full rounded-xl gap-2"
                      >
                        <Eye size={15} /> Public view
                      </Button>
                    </div>
                  </div>
                </article>
              );
            })
          )}
        </section>
      </div>
    </main>
  );
}
