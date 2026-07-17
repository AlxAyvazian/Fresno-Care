import type { Report } from "./storage";

const API_BASE_URL = (import.meta.env.VITE_API_URL ?? "").replace(/\/$/, "");

export const MODERATION_STATUSES = [
  "submitted",
  "routed",
  "follow-up",
  "resolved",
] as const;

export const PUBLICATION_STATUSES = [
  "pending",
  "approved",
  "rejected",
] as const;

export const MODERATION_EVENT_TYPES = [
  "report_submitted",
  "case_status_changed",
  "publication_status_changed",
  "note_added",
  "evidence_uploaded",
  "notification_sent",
  "notification_failed",
] as const;

export type ModerationStatus = (typeof MODERATION_STATUSES)[number];
export type PublicationStatus = (typeof PUBLICATION_STATUSES)[number];
export type ModerationEventType = (typeof MODERATION_EVENT_TYPES)[number];

export type AdminSession = {
  actorLabel: string;
  csrfToken: string;
  expiresAt: string;
  authMode?: string;
};

export type AdminReport = Omit<Report, "contactInfo" | "publicId" | "status"> & {
  publicId: string;
  updatedAt: string;
  publishedAt: string | null;
  reporterContact: string | null;
  status: ModerationStatus;
  publicationStatus: PublicationStatus;
};

export type ModerationEvent = {
  id: string;
  createdAt: string;
  eventType: ModerationEventType;
  actorLabel: string;
  note: string | null;
  previousValue: string | null;
  newValue: string | null;
  metadata: Record<string, string | number | boolean | null>;
};

export type AdminEvidence = {
  id: string;
  createdAt: string;
  originalName: string;
  mimeType: string;
  sizeBytes: number;
  sha256: string;
  validationStatus: "accepted" | "rejected";
};

export type AdminDelivery = {
  id: string;
  createdAt: string;
  updatedAt: string;
  status: "pending" | "sent" | "failed" | "not_configured";
  recipients: string[];
  subject: string;
  provider: string;
  providerMessageId: string | null;
  attempts: number;
  lastAttemptAt: string | null;
  lastError: string | null;
};

type ChangeContext = {
  note?: string;
};

function apiUrl(path: string): string {
  return `${API_BASE_URL}/api${path}`;
}

async function request<T>(path: string, init?: RequestInit, csrfToken?: string): Promise<T> {
  const response = await fetch(apiUrl(path), {
    ...init,
    credentials: "include",
    headers: {
      "Content-Type": "application/json",
      ...(csrfToken ? { "X-CSRF-Token": csrfToken } : {}),
      ...init?.headers,
    },
  });

  const payload = (await response.json().catch(() => null)) as T | { error?: string } | null;
  if (!response.ok) {
    const message = payload && typeof payload === "object" && "error" in payload
      ? payload.error
      : undefined;
    throw new Error(message || `Request failed with status ${response.status}`);
  }
  return payload as T;
}

export async function loginAdmin(actorLabel: string, adminKey: string): Promise<AdminSession> {
  const payload = await request<{ session: AdminSession }>("/admin/auth/login", {
    method: "POST",
    body: JSON.stringify({ actorLabel, adminKey }),
  });
  return payload.session;
}

export async function getAdminSession(): Promise<AdminSession> {
  const payload = await request<{ session: AdminSession }>("/admin/auth/session");
  if (!payload.session.csrfToken) throw new Error("Admin session is not available");
  return payload.session;
}

export async function logoutAdmin(csrfToken: string): Promise<void> {
  const response = await fetch(apiUrl("/admin/auth/logout"), {
    method: "POST",
    credentials: "include",
    headers: { "X-CSRF-Token": csrfToken },
  });
  if (!response.ok && response.status !== 204) {
    throw new Error("Unable to sign out");
  }
}

export async function getAdminReports(limit = 100): Promise<AdminReport[]> {
  const safeLimit = Math.min(Math.max(Math.trunc(limit), 1), 250);
  const payload = await request<{ reports: AdminReport[] }>(
    `/admin/reports?limit=${safeLimit}`,
  );
  return payload.reports;
}

export async function getModerationEvents(publicId: string): Promise<ModerationEvent[]> {
  const payload = await request<{ events: ModerationEvent[] }>(
    `/admin/reports/${encodeURIComponent(publicId)}/events`,
  );
  return payload.events;
}

export async function getAdminEvidence(publicId: string): Promise<AdminEvidence[]> {
  const payload = await request<{ evidence: AdminEvidence[] }>(
    `/admin/reports/${encodeURIComponent(publicId)}/evidence`,
  );
  return payload.evidence;
}

export async function downloadAdminEvidence(evidence: AdminEvidence): Promise<void> {
  const response = await fetch(apiUrl(`/admin/evidence/${encodeURIComponent(evidence.id)}`), {
    credentials: "include",
  });
  if (!response.ok) throw new Error("Unable to download evidence");
  const blob = await response.blob();
  const url = URL.createObjectURL(blob);
  const anchor = document.createElement("a");
  anchor.href = url;
  anchor.download = evidence.originalName;
  document.body.appendChild(anchor);
  anchor.click();
  anchor.remove();
  URL.revokeObjectURL(url);
}

export async function getAdminDelivery(publicId: string): Promise<AdminDelivery | null> {
  const payload = await request<{ delivery: AdminDelivery | null }>(
    `/admin/reports/${encodeURIComponent(publicId)}/delivery`,
  );
  return payload.delivery;
}

export async function retryAdminDelivery(
  publicId: string,
  csrfToken: string,
): Promise<Pick<AdminDelivery, "status" | "recipients" | "providerMessageId"> & { error: string | null }> {
  const payload = await request<{ delivery: Pick<AdminDelivery, "status" | "recipients" | "providerMessageId"> & { error: string | null } }>(
    `/admin/reports/${encodeURIComponent(publicId)}/delivery/retry`,
    { method: "POST", body: "{}" },
    csrfToken,
  );
  return payload.delivery;
}

export async function addModerationNote(
  publicId: string,
  note: string,
  csrfToken: string,
): Promise<ModerationEvent> {
  const payload = await request<{ event: ModerationEvent }>(
    `/admin/reports/${encodeURIComponent(publicId)}/notes`,
    { method: "POST", body: JSON.stringify({ note }) },
    csrfToken,
  );
  return payload.event;
}

export async function updateAdminReportStatus(
  publicId: string,
  status: ModerationStatus,
  context: ChangeContext,
  csrfToken: string,
): Promise<AdminReport> {
  const payload = await request<{ report: AdminReport }>(
    `/admin/reports/${encodeURIComponent(publicId)}/status`,
    { method: "PATCH", body: JSON.stringify({ status, ...context }) },
    csrfToken,
  );
  return payload.report;
}

export async function updateAdminPublicationStatus(
  publicId: string,
  publicationStatus: PublicationStatus,
  context: ChangeContext,
  csrfToken: string,
): Promise<AdminReport> {
  const payload = await request<{ report: AdminReport }>(
    `/admin/reports/${encodeURIComponent(publicId)}/publication`,
    { method: "PATCH", body: JSON.stringify({ publicationStatus, ...context }) },
    csrfToken,
  );
  return payload.report;
}
