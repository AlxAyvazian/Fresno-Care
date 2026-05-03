import type { Report } from "./storage";

/**
 * Encodes a Report object into a URL-safe base64 string.
 * Uses encodeURIComponent so non-ASCII characters survive the round-trip.
 */
export function encodeReport(r: Report): string {
  return btoa(unescape(encodeURIComponent(JSON.stringify(r))));
}

/**
 * Decodes a base64 string back into a Report.
 * Returns null on any decoding error.
 */
export function decodeReport(encoded: string): Report | null {
  try {
    return JSON.parse(decodeURIComponent(escape(atob(encoded))));
  } catch {
    return null;
  }
}

/**
 * Builds the full share URL for a report.
 * Works in both dev and production because it reads window.location.origin
 * and uses the current base path.
 */
export function buildShareUrl(r: Report): string {
  const base = window.location.origin + window.location.pathname.replace(/\/$/, "");
  const basePath = import.meta.env.BASE_URL?.replace(/\/$/, "") ?? "";
  return `${window.location.origin}${basePath}/share?r=${encodeReport(r)}`;
}
