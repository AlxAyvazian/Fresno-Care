import type { Report } from "./storage";

const API_BASE_URL = (import.meta.env.VITE_API_URL ?? "").replace(/\/$/, "");

export const MODERATION_STATUSES = [
  "submitted",
  "routed",
  "follow-up",
  "resolved",
] as const;

export type ModerationStatus = (typeof MODERATION_STATUSES)[number];

export type AdminReport = Omit<Report, "contactInfo" | "publicId" | "status"> & {
  publicId: string;
  updatedAt: string;
  reporterContact: string | null;
  status: ModerationStatus;
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

export async function updateAdminReportStatus(
  adminKey: string,
  publicId: string,
  status: ModerationStatus,
): Promise<AdminReport> {
  const payload = await request<{ report: AdminReport }>(
    `/admin/reports/${encodeURIComponent(publicId)}/status`,
    adminKey,
    {
      method: "PATCH",
      body: JSON.stringify({ status }),
    },
  );
  return payload.report;
}
