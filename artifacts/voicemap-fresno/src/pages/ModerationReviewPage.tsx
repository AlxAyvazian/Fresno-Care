import { useCallback, useEffect, useMemo, useState } from "react";
import {
  AlertCircle,
  Download,
  Eye,
  FileCheck2,
  History,
  KeyRound,
  LockKeyhole,
  LogOut,
  MailCheck,
  MailWarning,
  MapPin,
  MessageSquarePlus,
  RefreshCw,
  RotateCw,
  ShieldCheck,
  UserRound,
} from "lucide-react";
import { useLocation } from "wouter";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  addModerationNote,
  downloadAdminEvidence,
  getAdminDelivery,
  getAdminEvidence,
  getAdminReports,
  getAdminSession,
  getModerationEvents,
  loginAdmin,
  logoutAdmin,
  MODERATION_STATUSES,
  PUBLICATION_STATUSES,
  retryAdminDelivery,
  updateAdminPublicationStatus,
  updateAdminReportStatus,
  type AdminDelivery,
  type AdminEvidence,
  type AdminReport,
  type AdminSession,
  type ModerationEvent,
  type ModerationStatus,
  type PublicationStatus,
} from "@/lib/moderationApi";
import { STATUS_LABELS } from "@/lib/storage";

const PUBLICATION_LABELS: Record<PublicationStatus, string> = {
  pending: "Awaiting review",
  approved: "Approved for public view",
  rejected: "Rejected from publication",
};

const EVENT_LABELS: Record<ModerationEvent["eventType"], string> = {
  report_submitted: "Report submitted for review",
  case_status_changed: "Case status changed",
  publication_status_changed: "Publication decision changed",
  note_added: "Reviewer note",
  evidence_uploaded: "Private evidence uploaded",
  notification_sent: "Agency notification sent",
  notification_failed: "Agency notification failed",
};

const DELIVERY_LABELS: Record<AdminDelivery["status"], string> = {
  pending: "Delivery pending",
  sent: "Sent to agencies",
  failed: "Delivery failed",
  not_configured: "Delivery not configured",
};

function formatDate(value: string): string {
  return new Intl.DateTimeFormat(undefined, {
    dateStyle: "medium",
    timeStyle: "short",
  }).format(new Date(value));
}

function formatBytes(bytes: number): string {
  if (bytes < 1024 * 1024) return `${Math.max(Math.round(bytes / 1024), 1)} KB`;
  return `${(bytes / (1024 * 1024)).toFixed(1)} MB`;
}

export default function ModerationReviewPage() {
  const [, navigate] = useLocation();
  const [actorInput, setActorInput] = useState("");
  const [keyInput, setKeyInput] = useState("");
  const [session, setSession] = useState<AdminSession | null>(null);
  const [checkingSession, setCheckingSession] = useState(true);
  const [reports, setReports] = useState<AdminReport[]>([]);
  const [eventsByReport, setEventsByReport] = useState<Record<string, ModerationEvent[]>>({});
  const [evidenceByReport, setEvidenceByReport] = useState<Record<string, AdminEvidence[]>>({});
  const [deliveryByReport, setDeliveryByReport] = useState<Record<string, AdminDelivery | null>>({});
  const [expandedReport, setExpandedReport] = useState<string | null>(null);
  const [changeNotes, setChangeNotes] = useState<Record<string, string>>({});
  const [noteDrafts, setNoteDrafts] = useState<Record<string, string>>({});
  const [loading, setLoading] = useState(false);
  const [loggingIn, setLoggingIn] = useState(false);
  const [loadingDetails, setLoadingDetails] = useState<string | null>(null);
  const [updating, setUpdating] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  useEffect(() => {
    let cancelled = false;
    void getAdminSession()
      .then((restored) => {
        if (!cancelled) setSession(restored);
      })
      .catch(() => {
        if (!cancelled) setSession(null);
      })
      .finally(() => {
        if (!cancelled) setCheckingSession(false);
      });
    return () => {
      cancelled = true;
    };
  }, []);

  const loadReports = useCallback(async () => {
    if (!session) return;
    setLoading(true);
    setError(null);
    try {
      setReports(await getAdminReports(250));
    } catch (loadError) {
      setReports([]);
      setError(loadError instanceof Error ? loadError.message : "Unable to load moderation reports.");
    } finally {
      setLoading(false);
    }
  }, [session]);

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

  async function signIn() {
    const actor = actorInput.trim();
    const key = keyInput;
    if (!actor || !key) return;

    setLoggingIn(true);
    setError(null);
    try {
      const authenticated = await loginAdmin(actor, key);
      setSession(authenticated);
      setKeyInput("");
    } catch (loginError) {
      setSession(null);
      setError(loginError instanceof Error ? loginError.message : "Unable to sign in.");
    } finally {
      setLoggingIn(false);
    }
  }

  async function signOut() {
    if (!session) return;
    try {
      await logoutAdmin(session.csrfToken);
    } catch {
      // Clear the local state even if the server session already expired.
    }
    setSession(null);
    setReports([]);
    setEventsByReport({});
    setEvidenceByReport({});
    setDeliveryByReport({});
    setExpandedReport(null);
    setError(null);
  }

  async function loadDetails(publicId: string) {
    setLoadingDetails(publicId);
    setError(null);
    try {
      const [events, evidence, delivery] = await Promise.all([
        getModerationEvents(publicId),
        getAdminEvidence(publicId),
        getAdminDelivery(publicId),
      ]);
      setEventsByReport((current) => ({ ...current, [publicId]: events }));
      setEvidenceByReport((current) => ({ ...current, [publicId]: evidence }));
      setDeliveryByReport((current) => ({ ...current, [publicId]: delivery }));
    } catch (detailsError) {
      setError(detailsError instanceof Error ? detailsError.message : "Unable to load private report details.");
    } finally {
      setLoadingDetails(null);
    }
  }

  async function toggleDetails(publicId: string) {
    if (expandedReport === publicId) {
      setExpandedReport(null);
      return;
    }
    setExpandedReport(publicId);
    await loadDetails(publicId);
  }

  async function changeStatus(report: AdminReport, status: ModerationStatus) {
    if (!session) return;
    setUpdating(`${report.publicId}:status`);
    setError(null);
    try {
      const updated = await updateAdminReportStatus(
        report.publicId,
        status,
        { note: changeNotes[report.publicId]?.trim() || undefined },
        session.csrfToken,
      );
      setReports((current) => current.map((item) => item.publicId === updated.publicId ? updated : item));
      setChangeNotes((current) => ({ ...current, [report.publicId]: "" }));
      if (expandedReport === report.publicId) await loadDetails(report.publicId);
    } catch (updateError) {
      setError(updateError instanceof Error ? updateError.message : "Unable to update report status.");
    } finally {
      setUpdating(null);
    }
  }

  async function changePublication(report: AdminReport, publicationStatus: PublicationStatus) {
    if (!session) return;
    setUpdating(`${report.publicId}:publication`);
    setError(null);
    try {
      const updated = await updateAdminPublicationStatus(
        report.publicId,
        publicationStatus,
        { note: changeNotes[report.publicId]?.trim() || undefined },
        session.csrfToken,
      );
      setReports((current) => current.map((item) => item.publicId === updated.publicId ? updated : item));
      setChangeNotes((current) => ({ ...current, [report.publicId]: "" }));
      if (expandedReport === report.publicId) await loadDetails(report.publicId);
    } catch (updateError) {
      setError(updateError instanceof Error ? updateError.message : "Unable to update publication status.");
    } finally {
      setUpdating(null);
    }
  }

  async function addNote(report: AdminReport) {
    if (!session) return;
    const note = noteDrafts[report.publicId]?.trim();
    if (!note) return;

    setUpdating(`${report.publicId}:note`);
    setError(null);
    try {
      const event = await addModerationNote(report.publicId, note, session.csrfToken);
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

  async function retryDelivery(report: AdminReport) {
    if (!session) return;
    setUpdating(`${report.publicId}:delivery`);
    setError(null);
    try {
      await retryAdminDelivery(report.publicId, session.csrfToken);
      await loadDetails(report.publicId);
      await loadReports();
    } catch (deliveryError) {
      setError(deliveryError instanceof Error ? deliveryError.message : "Unable to retry agency delivery.");
    } finally {
      setUpdating(null);
    }
  }

  async function downloadEvidence(evidence: AdminEvidence) {
    setUpdating(`evidence:${evidence.id}`);
    setError(null);
    try {
      await downloadAdminEvidence(evidence);
    } catch (downloadError) {
      setError(downloadError instanceof Error ? downloadError.message : "Unable to download evidence.");
    } finally {
      setUpdating(null);
    }
  }

  if (checkingSession) {
    return (
      <main className="min-h-screen px-4 pb-16 pt-28">
        <div className="mx-auto max-w-md glass-card rounded-3xl p-10 text-center text-sm text-muted-foreground">
          Checking secure moderation session…
        </div>
      </main>
    );
  }

  if (!session) {
    return (
      <main className="min-h-screen px-4 pb-16 pt-28">
        <div className="mx-auto max-w-md">
          <section className="glass-card rounded-3xl p-8 sm:p-10">
            <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-primary/10 text-primary">
              <LockKeyhole size={28} />
            </div>
            <h1 className="mt-5 font-heading text-3xl font-bold">Moderation access</h1>
            <p className="mt-3 text-sm leading-relaxed text-muted-foreground">
              Sign in to review precise locations, private reporter details, evidence files, and agency-delivery history. The admin credential is exchanged once for a signed HTTP-only session and is not stored in browser storage.
            </p>
            {error && (
              <div className="mt-5 rounded-2xl border border-destructive/30 bg-destructive/10 p-4 text-sm text-destructive">
                {error}
              </div>
            )}
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
                  if (event.key === "Enter") void signIn();
                }}
                placeholder="Admin password"
                autoComplete="current-password"
                className="rounded-xl"
              />
              <Button
                type="button"
                onClick={() => void signIn()}
                disabled={loggingIn || !keyInput || !actorInput.trim()}
                className="w-full rounded-xl gap-2"
              >
                <KeyRound size={16} /> {loggingIn ? "Signing in…" : "Open moderation"}
              </Button>
            </div>
            <p className="mt-4 text-xs leading-relaxed text-muted-foreground">
              Login attempts are rate-limited. Reviewer actions are attributed to the authenticated session in the audit history.
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
                Review private reports, download validated evidence, verify agency delivery, and control public publication from one protected workspace.
              </p>
              <div className="mt-4 inline-flex items-center gap-2 rounded-xl bg-muted/50 px-3 py-2 text-xs font-medium">
                <UserRound size={14} /> Reviewing as {session.actorLabel}
              </div>
            </div>
            <div className="flex flex-wrap gap-2">
              <Button type="button" variant="outline" onClick={() => void loadReports()} disabled={loading} className="rounded-xl gap-2">
                <RefreshCw size={15} className={loading ? "animate-spin" : ""} /> Refresh
              </Button>
              <Button type="button" variant="outline" onClick={() => void signOut()} className="rounded-xl gap-2">
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
              No reports are available.
            </div>
          ) : (
            reports.map((report) => {
              const busy = updating?.startsWith(report.publicId) ?? false;
              const events = eventsByReport[report.publicId] ?? [];
              const evidence = evidenceByReport[report.publicId] ?? [];
              const delivery = deliveryByReport[report.publicId];
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
                      disabled={loadingDetails === report.publicId}
                      onClick={() => void toggleDetails(report.publicId)}
                      className="rounded-xl gap-2"
                    >
                      <History size={15} className={loadingDetails === report.publicId ? "animate-spin" : ""} />
                      {expanded ? "Hide private details" : "Open evidence, delivery, and audit history"}
                    </Button>

                    {expanded && (
                      <div className="mt-5 space-y-5">
                        <div className="grid gap-4 lg:grid-cols-2">
                          <section className="rounded-2xl border border-border/50 bg-background/55 p-5">
                            <div className="flex items-center gap-2">
                              <FileCheck2 size={18} className="text-primary" />
                              <h3 className="font-heading text-lg font-bold">Private evidence</h3>
                            </div>
                            {evidence.length === 0 ? (
                              <p className="mt-4 text-sm text-muted-foreground">No evidence files were uploaded.</p>
                            ) : (
                              <ul className="mt-4 space-y-2">
                                {evidence.map((file) => (
                                  <li key={file.id} className="flex items-center justify-between gap-3 rounded-xl bg-muted/40 p-3">
                                    <div className="min-w-0">
                                      <p className="truncate text-sm font-semibold">{file.originalName}</p>
                                      <p className="mt-1 text-xs text-muted-foreground">{file.mimeType} · {formatBytes(file.sizeBytes)}</p>
                                    </div>
                                    <Button
                                      type="button"
                                      size="sm"
                                      variant="outline"
                                      disabled={updating === `evidence:${file.id}`}
                                      onClick={() => void downloadEvidence(file)}
                                      className="shrink-0 rounded-lg gap-1"
                                    >
                                      <Download size={14} /> Download
                                    </Button>
                                  </li>
                                ))}
                              </ul>
                            )}
                          </section>

                          <section className="rounded-2xl border border-border/50 bg-background/55 p-5">
                            <div className="flex items-center gap-2">
                              {delivery?.status === "sent" ? <MailCheck size={18} className="text-green-600" /> : <MailWarning size={18} className="text-amber-600" />}
                              <h3 className="font-heading text-lg font-bold">Agency delivery</h3>
                            </div>
                            {!delivery ? (
                              <p className="mt-4 text-sm text-muted-foreground">No delivery attempt has been recorded.</p>
                            ) : (
                              <div className="mt-4 space-y-3 text-sm">
                                <p className="font-semibold">{DELIVERY_LABELS[delivery.status]}</p>
                                <p className="text-muted-foreground">Attempts: {delivery.attempts}</p>
                                <div>
                                  <p className="text-xs font-semibold uppercase tracking-wide text-muted-foreground">Recipients</p>
                                  <ul className="mt-2 space-y-1 break-all text-xs">
                                    {delivery.recipients.map((recipient) => <li key={recipient}>{recipient}</li>)}
                                  </ul>
                                </div>
                                {delivery.lastError && (
                                  <p className="rounded-xl bg-destructive/10 p-3 text-xs text-destructive">{delivery.lastError}</p>
                                )}
                                {delivery.status !== "sent" && (
                                  <Button
                                    type="button"
                                    variant="outline"
                                    disabled={updating === `${report.publicId}:delivery`}
                                    onClick={() => void retryDelivery(report)}
                                    className="rounded-xl gap-2"
                                  >
                                    <RotateCw size={14} /> Retry agency delivery
                                  </Button>
                                )}
                              </div>
                            )}
                          </section>
                        </div>

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
