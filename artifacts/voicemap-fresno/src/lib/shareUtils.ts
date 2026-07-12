import type { Report } from "./storage";

/**
 * Public share links must never contain reporter contact information.
 * The current v1 sharing format still embeds report data in the URL, so this
 * boundary is intentionally enforced for both encoding and decoding.
 */
export function sanitizeReportForSharing(report: Report): Report {
  return {
    ...report,
    contactInfo: undefined,
  };
}

/**
 * Encodes a privacy-filtered Report object into a URL-safe base64 string.
 * Uses encodeURIComponent so non-ASCII characters survive the round-trip.
 */
export function encodeReport(report: Report): string {
  const publicReport = sanitizeReportForSharing(report);
  return btoa(unescape(encodeURIComponent(JSON.stringify(publicReport))));
}

/**
 * Decodes a base64 string back into a privacy-filtered Report.
 * Returns null on any decoding error.
 */
export function decodeReport(encoded: string): Report | null {
  try {
    const report = JSON.parse(
      decodeURIComponent(escape(atob(encoded))),
    ) as Report;
    return sanitizeReportForSharing(report);
  } catch {
    return null;
  }
}

/**
 * Builds the full share URL for a report.
 * Works in both development and production because it uses the configured
 * Vite base path and the current origin.
 */
export function buildShareUrl(report: Report): string {
  const basePath = import.meta.env.BASE_URL?.replace(/\/$/, "") ?? "";
  return `${window.location.origin}${basePath}/share?r=${encodeReport(report)}`;
}
