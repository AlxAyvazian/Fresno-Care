import type { Report } from "./storage";

const API_BASE_URL = (import.meta.env.VITE_API_URL ?? "").replace(/\/$/, "");

export type DeliveryStatus = "pending" | "sent" | "failed" | "not_configured";

type ApiReport = Omit<Report, "id" | "contactInfo"> & {
  id: string;
  publicId: string;
  publishedAt: string | null;
};

type CreateReportReceipt = {
  publicId: string;
  createdAt: string;
  status: Report["status"];
  publicationStatus: "pending";
  deduplicated: boolean;
  evidenceUploadToken: string | null;
  evidenceUploaded: number;
  deliveryStatus: DeliveryStatus;
};

type CreateReportResponse = {
  receipt: CreateReportReceipt;
};

export type EvidenceUploadResult = {
  id: string;
  originalName: string;
  mimeType: string;
  sizeBytes: number;
  createdAt?: string;
  deduplicated: boolean;
};

export type FinalizeReportResponse = {
  receipt: CreateReportReceipt;
  delivery: {
    status: DeliveryStatus;
    recipientCount: number;
    error: string | null;
  };
};

function apiUrl(path: string): string {
  return `${API_BASE_URL}/api${path}`;
}

async function parseJson<T>(response: Response): Promise<T> {
  const payload = (await response.json().catch(() => null)) as T | { error?: string } | null;

  if (!response.ok) {
    const message = payload && typeof payload === "object" && "error" in payload
      ? payload.error
      : undefined;
    throw new Error(message || `Request failed with status ${response.status}`);
  }

  return payload as T;
}

export async function createReport(report: Report): Promise<CreateReportReceipt> {
  const response = await fetch(apiUrl("/reports"), {
    method: "POST",
    headers: { "Content-Type": "application/json" },
    body: JSON.stringify({
      animalType: report.animalType,
      count: report.count,
      location: report.location,
      neighborhood: report.neighborhood,
      dateObserved: report.dateObserved,
      timeObserved: report.timeObserved || undefined,
      inDanger: report.inDanger,
      concernTypes: report.concernTypes,
      description: report.description,
      evidenceNotes: report.evidenceNotes || undefined,
      agenciesContacted: report.agenciesContacted || undefined,
      responseReceived: report.responseReceived || undefined,
      reporterContact: report.anonymous ? undefined : report.contactInfo,
      anonymous: report.anonymous,
      website: "",
    }),
  });

  const payload = await parseJson<CreateReportResponse>(response);
  return payload.receipt;
}

export async function uploadReportEvidence(
  publicId: string,
  evidenceUploadToken: string,
  file: File,
): Promise<EvidenceUploadResult> {
  const response = await fetch(apiUrl(`/reports/${encodeURIComponent(publicId)}/evidence`), {
    method: "POST",
    headers: {
      "Content-Type": file.type,
      "X-Evidence-Token": evidenceUploadToken,
      "X-File-Name": encodeURIComponent(file.name),
    },
    body: file,
  });
  const payload = await parseJson<{ evidence: EvidenceUploadResult }>(response);
  return payload.evidence;
}

export async function finalizeReport(
  publicId: string,
  evidenceUploadToken: string,
): Promise<FinalizeReportResponse> {
  const response = await fetch(apiUrl(`/reports/${encodeURIComponent(publicId)}/finalize`), {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "X-Evidence-Token": evidenceUploadToken,
    },
    body: "{}",
  });
  return parseJson<FinalizeReportResponse>(response);
}

export async function getPublicReports(limit = 100): Promise<ApiReport[]> {
  const safeLimit = Math.min(Math.max(Math.trunc(limit), 1), 250);
  const response = await fetch(apiUrl(`/reports?limit=${safeLimit}`));
  const payload = await parseJson<{ reports: ApiReport[] }>(response);
  return payload.reports;
}

export async function getPublicReport(publicId: string): Promise<ApiReport> {
  const response = await fetch(apiUrl(`/reports/${encodeURIComponent(publicId)}`));
  const payload = await parseJson<{ report: ApiReport }>(response);
  return payload.report;
}

export type { ApiReport, CreateReportReceipt };
