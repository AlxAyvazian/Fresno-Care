import { createHmac, timingSafeEqual } from "node:crypto";

const TOKEN_TTL_SECONDS = 60 * 60;

type UploadTokenPayload = {
  publicId: string;
  exp: number;
};

function secret(): string | null {
  return process.env.EVIDENCE_UPLOAD_SECRET?.trim()
    || process.env.ADMIN_SESSION_SECRET?.trim()
    || process.env.ADMIN_API_KEY?.trim()
    || null;
}

function sign(value: string, signingSecret: string): string {
  return createHmac("sha256", signingSecret).update(value).digest("base64url");
}

function safeEqual(left: string, right: string): boolean {
  const leftBuffer = Buffer.from(left);
  const rightBuffer = Buffer.from(right);
  return leftBuffer.length === rightBuffer.length && timingSafeEqual(leftBuffer, rightBuffer);
}

export function createReportUploadToken(publicId: string): string | null {
  const signingSecret = secret();
  if (!signingSecret) return null;

  const payload: UploadTokenPayload = {
    publicId,
    exp: Math.floor(Date.now() / 1000) + TOKEN_TTL_SECONDS,
  };
  const encoded = Buffer.from(JSON.stringify(payload)).toString("base64url");
  return `${encoded}.${sign(encoded, signingSecret)}`;
}

export function verifyReportUploadToken(token: string, expectedPublicId: string): boolean {
  const signingSecret = secret();
  if (!signingSecret) return false;

  const [encoded, suppliedSignature] = token.split(".", 2);
  if (!encoded || !suppliedSignature || !safeEqual(suppliedSignature, sign(encoded, signingSecret))) {
    return false;
  }

  try {
    const payload = JSON.parse(Buffer.from(encoded, "base64url").toString("utf8")) as Partial<UploadTokenPayload>;
    return payload.publicId === expectedPublicId
      && typeof payload.exp === "number"
      && payload.exp > Math.floor(Date.now() / 1000);
  } catch {
    return false;
  }
}
