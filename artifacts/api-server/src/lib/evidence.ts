import path from "node:path";

export const MAX_EVIDENCE_FILES = 5;
export const MAX_EVIDENCE_TOTAL_BYTES = 30 * 1024 * 1024;
export const MAX_EVIDENCE_FILE_BYTES = 20 * 1024 * 1024;

export const ALLOWED_EVIDENCE_TYPES = new Set([
  "image/jpeg",
  "image/png",
  "image/webp",
  "application/pdf",
  "video/mp4",
]);

function startsWith(buffer: Buffer, signature: number[]): boolean {
  return signature.every((value, index) => buffer[index] === value);
}

export function contentMatchesMime(buffer: Buffer, mimeType: string): boolean {
  if (buffer.length < 12) return false;

  switch (mimeType) {
    case "image/jpeg":
      return startsWith(buffer, [0xff, 0xd8, 0xff]);
    case "image/png":
      return startsWith(buffer, [0x89, 0x50, 0x4e, 0x47, 0x0d, 0x0a, 0x1a, 0x0a]);
    case "image/webp":
      return buffer.subarray(0, 4).toString("ascii") === "RIFF"
        && buffer.subarray(8, 12).toString("ascii") === "WEBP";
    case "application/pdf":
      return buffer.subarray(0, 5).toString("ascii") === "%PDF-";
    case "video/mp4":
      return buffer.subarray(4, 8).toString("ascii") === "ftyp";
    default:
      return false;
  }
}

export function sanitizeEvidenceFilename(value: string): string {
  const basename = path.basename(value || "evidence");
  const sanitized = basename
    .normalize("NFKC")
    .replace(/[^a-zA-Z0-9._ -]/g, "_")
    .replace(/\s+/g, " ")
    .trim();
  return (sanitized || "evidence").slice(0, 180);
}
