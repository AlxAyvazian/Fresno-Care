import { useCallback, useEffect, useMemo, useState } from "react";
import {
  AlertCircle,
  Eye,
  History,
  KeyRound,
  LockKeyhole,
  LogOut,
  MapPin,
  MessageSquarePlus,
  RefreshCw,
  ShieldCheck,
  UserRound,
} from "lucide-react";
import { useLocation } from "wouter";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  addModerationNote,
  getAdminReports,
  getModerationEvents,
  MODERATION_STATUSES,
  PUBLICATION_STATUSES,
  updateAdminPublicationStatus,
  updateAdminReportStatus,
  type AdminReport,
  type ModerationEvent,
  type ModerationStatus,
  type PublicationStatus,
} from "@/lib/moderationApi";
import { STATUS_LABELS } from "@/lib/storage";

const SESSION_KEY = "fresno_care_admin_key";
const ACTOR_KEY = "fresno_care_admin_actor";

const PUBLICATION_LABELS: Record<PublicationStatus, string> = {
  pending: "Awaiting review",
  approved: "Approved for public view",
  rejected: "Rejected from publication",
};

const EVENT_LABELS: Record<ModerationEvent["eventType"], string> = {
  case_status_changed: "Case status changed",
  publication_status_changed: "Publication decision changed",
  note_added: "Reviewer note",
};

function formatDate(value: string): string {
  return new Intl.DateTimeFormat(undefined, {
    dateStyle: "medium",
    timeStyle: "short",
  }).format(new Date(value));
}

export default function ModerationReviewPage() {
  const [, navigate] = useLocation();
  const [keyInput, setKeyInput] = useState("");
  const [actorInput, setActorInput] = useState(() => sessionStorage.getItem(ACTOR_KEY) ?? "");
  const [adminKey, setAdminKey] = useState(() => sessionStorage.getItem(SESSION_KEY) ?? "");
  const [actorLabel, setActorLabel] = useState(() => sessionStorage.getItem(ACTOR_KEY) ?? "");
  const [reports, setReports] = useState<AdminReport[]>([]);
  const [eventsByReport, setEventsByReport] = useState<Record<string, ModerationEvent[]>>({});
  const [expandedReport, setExpandedReport] = useState<string | null>(null);
  const [changeNotes, setChangeNotes] = useState<Record<string, string>>({});
  const [noteDrafts, setNoteDrafts] = useState<Record<string, string>>({});
  const [loading, setLoading] = useState(false);
  const [loadingEvents, setLoadingEvents] = useState<string | null>(null);
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
    const key = keyInput.trim();
    const actor = actorInput.trim();
    if (!key || !actor) return;

    sessionStorage.setItem(SESSION_KEY, key);
    sessionStorage.setItem(ACTOR_KEY, actor);
    setAdminKey(key);
    setActorLabel(actor);
    setKeyInput("");
  }

  function lock() {
    sessionStorage.removeItem(SESSION_KEY);
    sessionStorage.removeItem(ACTOR_KEY);
    setAdminKey("");
    setActorLabel("");
    setReports([]);
    setEventsByReport({});
    setExpandedReport(null);
    setError(null);
  }

  async function loadEvents(publicId: string) {
    setLoadingEvents(publicId);
    setError(null);
    try {
      const events = await getModerationEvents(adminKey, publicId);
      setEventsByReport((current) => ({ ...current, [publicId]: events }));
    } catch (eventError) {
      setError(eventError instanceof Error ? eventError.message : "Unable to load the moderation timeline.");
    } finally {
      setLoadingEvents(null);
    }
  }

  async function toggleTimeline(publicId: string) {
    if (expandedReport === publicId) {
      setExpandedReport(null);
      return;
    }

    setExpandedReport(publicId);
    await loadEvents(publicId);
  }

  async function changeStatus(report: AdminReport, status: ModerationStatus) {
    setUpdating(`${report.publicId}:status`);
    setError(null);
    try {
      const updated = await updateAdminReportStatus(adminKey, report.publicId, status, {
        actorLabel,
        note: changeNotes[report.publicId]?.trim() || undefined,
      });
      setReports((current) => current.map((item) => item.publicId === updated.publicId ? updated : item));
      setChangeNotes((current) => ({ ...current, [report.publicId]: "" }));
      if (expandedReport === report.publicId) await loadEvents(report.publicId);
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
      const updated = await updateAdminPublicationStatus(adminKey, report.publicId, publicationStatus, {
        actorLabel,
        note: changeNotes[report.publicId]?.trim() || undefined,
      });
      setReports((current) => current.map((item) => item.publicId === updated.publicId ? updated : item));
      setChangeNotes((current) => ({ ...current, [report.publicId]: "" }));
      if (expandedReport === report.publicId) await loadEvents(report.publicId);
    } catch (updateError) {
      setError(updateError instanceof Error ? updateError.message : "Unable to update publication status.");
    } finally {
      setUpdating(null);
    }
  }

  async function addNote(report: AdminReport) {
    const note = noteDrafts[report.publicId]?.trim();
    if (!note) return;

    setUpdating(`${report.publicId}:note`);
    setError(null);
    try {
      const event = await addModerationNote(adminKey, report.publicId, actorLabel, note);
      setEventsByReport((current) => ({
        ...current,
        [report.publicId]: [event, ...(current[report.publicId] ?? [])],
      }));
      setNoteDrafts((current) => ({ ...current, [report.publicId]: "" }));
    } catch (noteError) {
      setError(noteError instanceof Error ? noteError.message : "Unable to add the moderation note.");
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
              This area contains precise locations and optional reporter contact details. Enter your reviewer name and the server-configured admin key.
            </p>
            <div className="mt-6 space-y-3">
              <Input
                value={actorInput}
                onChange={(event) => setActorInput(event.target.value)}
                placeholder="Reviewer name"
                autoComplete="name"
                className="rounded-xl"
              />
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
              <Button
                type="button"
                onClick={unlock}
                disabled={!keyInput.trim() || !actorInput.trim()}
                className="w-full rounded-xl gap-2"
              >
                <KeyRound size={16} /> Open moderation
              </Button>
            </div>
            <p className="mt-4 text-xs leading-relaxed text-muted-foreground">
              Both values are kept only for this browser session. The reviewer name is written to the audit history for future actions.
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
                Every status change, publication decision, and reviewer note is appended to an immutable moderation timeline.
              </p>
              <div className="mt-4 inline-flex items-center gap-2 rounded-xl bg-muted/50 px-3 py-2 text-xs font-medium">
                <UserRound size={14} /> Reviewing as {actorLabel}
              </div>
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
              const events = eventsByReport[report.publicId] ?? [];
              const expanded = expandedReport === report.publicId;

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

                    <div className="w-full shrink-0 space-y-4 lg:w-72">
                      <div>
                        <label className="block text-xs font-semibold uppercase tracking-wide text-muted-foreground">
                          Rationale for next change
                        </label>
                        <textarea
                          value={changeNotes[report.publicId] ?? ""}
                          onChange={(event) => setChangeNotes((current) => ({
                            ...current,
                            [report.publicId]: event.target.value,
                          }))}
                          rows={3}
                          maxLength={2000}
                          placeholder="Optional explanation recorded with the next decision"
                          className="mt-2 w-full rounded-xl border border-input bg-background px-3 py-2 text-sm resize-none"
                        />
                      </div>

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

                  <div className="mt-6 border-t border-border/40 pt-5">
                    <Button
                      type="button"
                      variant="outline"
                      disabled={loadingEvents === report.publicId}
                      onClick={() => void toggleTimeline(report.publicId)}
                      className="rounded-xl gap-2"
                    >
                      <History size={15} className={loadingEvents === report.publicId ? "animate-spin" : ""} />
                      {expanded ? "Hide audit timeline" : "Open audit timeline"}
                    </Button>

                    {expanded && (
                      <div className="mt-5 space-y-4">
                        <div className="rounded-2xl bg-muted/30 p-4">
                          <label className="block text-xs font-semibold uppercase tracking-wide text-muted-foreground">Add reviewer note</label>
                          <div className="mt-2 flex flex-col gap-2 sm:flex-row">
                            <textarea
                              value={noteDrafts[report.publicId] ?? ""}
                              onChange={(event) => setNoteDrafts((current) => ({
                                ...current,
                                [report.publicId]: event.target.value,
                              }))}
                              rows={2}
                              maxLength={2000}
                              placeholder="Document a call, verification, follow-up, or reasoning"
                              className="min-h-20 flex-1 rounded-xl border border-input bg-background px-3 py-2 text-sm resize-none"
                            />
                            <Button
                              type="button"
                              onClick={() => void addNote(report)}
                              disabled={busy || !(noteDrafts[report.publicId]?.trim())}
                              className="rounded-xl gap-2 sm:self-end"
                            >
                              <MessageSquarePlus size={15} /> Add note
                            </Button>
                          </div>
                        </div>

                        {events.length === 0 ? (
                          <p className="rounded-2xl bg-muted/30 p-4 text-sm text-muted-foreground">
                            No moderation events have been recorded for this report yet.
                          </p>
                        ) : (
                          <ol className="space-y-3">
                            {events.map((event) => (
                              <li key={event.id} className="rounded-2xl border border-border/40 bg-background/60 p-4">
                                <div className="flex flex-col gap-1 sm:flex-row sm:items-center sm:justify-between">
                                  <p className="text-sm font-semibold">{EVENT_LABELS[event.eventType]}</p>
                                  <time className="text-xs text-muted-foreground">{formatDate(event.createdAt)}</time>
                                </div>
                                <p className="mt-1 text-xs text-muted-foreground">By {event.actorLabel}</p>
                                {event.previousValue !== null && event.newValue !== null && (
                                  <p className="mt-3 text-sm">
                                    <span className="font-mono text-muted-foreground">{event.previousValue}</span>
                                    <span className="mx-2">→</span>
                                    <span className="font-mono font-semibold">{event.newValue}</span>
                                  </p>
                                )}
                                {event.note && (
                                  <p className="mt-3 whitespace-pre-wrap rounded-xl bg-muted/40 p-3 text-sm leading-relaxed">{event.note}</p>
                                )}
                              </li>
                            ))}
                          </ol>
                        )}
                      </div>
                    )}
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
