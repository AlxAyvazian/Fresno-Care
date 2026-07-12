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
  "case_status_changed",
  "publication_status_changed",
  "note_added",
] as const;

export type ModerationStatus = (typeof MODERATION_STATUSES)[number];
export type PublicationStatus = (typeof PUBLICATION_STATUSES)[number];
export type ModerationEventType = (typeof MODERATION_EVENT_TYPES)[number];

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

type ChangeContext = {
  actorLabel: string;
  note?: string;
};

function apiUrl(path: string): string {
  return `${API_BASE_URL}/api${path}`;
}

async function request<T>(path: string, adminKey: string, init?: RequestInit): Promise<T> {
  const response = await fetch(apiUrl(path), {
    ...init,
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bearer ${adminKey}`,
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

export async function getAdminReports(adminKey: string, limit = 100): Promise<AdminReport[]> {
  const safeLimit = Math.min(Math.max(Math.trunc(limit), 1), 250);
  const payload = await request<{ reports: AdminReport[] }>(
    `/admin/reports?limit=${safeLimit}`,
    adminKey,
  );
  return payload.reports;
}

export async function getModerationEvents(
  adminKey: string,
  publicId: string,
): Promise<ModerationEvent[]> {
  const payload = await request<{ events: ModerationEvent[] }>(
    `/admin/reports/${encodeURIComponent(publicId)}/events`,
    adminKey,
  );
  return payload.events;
}

export async function addModerationNote(
  adminKey: string,
  publicId: string,
  actorLabel: string,
  note: string,
): Promise<ModerationEvent> {
  const payload = await request<{ event: ModerationEvent }>(
    `/admin/reports/${encodeURIComponent(publicId)}/notes`,
    adminKey,
    {
      method: "POST",
      body: JSON.stringify({ actorLabel, note }),
    },
  );
  return payload.event;
}

export async function updateAdminReportStatus(
  adminKey: string,
  publicId: string,
  status: ModerationStatus,
  context: ChangeContext,
): Promise<AdminReport> {
  const payload = await request<{ report: AdminReport }>(
    `/admin/reports/${encodeURIComponent(publicId)}/status`,
    adminKey,
    {
      method: "PATCH",
      body: JSON.stringify({ status, ...context }),
    },
  );
  return payload.report;
}

export async function updateAdminPublicationStatus(
  adminKey: string,
  publicId: string,
  publicationStatus: PublicationStatus,
  context: ChangeContext,
): Promise<AdminReport> {
  const payload = await request<{ report: AdminReport }>(
    `/admin/reports/${encodeURIComponent(publicId)}/publication`,
    adminKey,
    {
      method: "PATCH",
      body: JSON.stringify({ publicationStatus, ...context }),
    },
  );
  return payload.report;
}
