import {
  createHmac,
  randomBytes,
  timingSafeEqual,
} from "node:crypto";
import type { Request, Response } from "express";

export const ADMIN_SESSION_COOKIE = "fresno_care_admin_session";
const SESSION_TTL_SECONDS = 8 * 60 * 60;

type AdminSessionPayload = {
  actorLabel: string;
  csrf: string;
  exp: number;
};

function safeEqual(left: string, right: string): boolean {
  const leftBuffer = Buffer.from(left);
  const rightBuffer = Buffer.from(right);
  return leftBuffer.length === rightBuffer.length && timingSafeEqual(leftBuffer, rightBuffer);
}

function sessionSecret(): string | null {
  return process.env.ADMIN_SESSION_SECRET?.trim()
    || process.env.ADMIN_API_KEY?.trim()
    || null;
}

function sign(encodedPayload: string, secret: string): string {
  return createHmac("sha256", secret).update(encodedPayload).digest("base64url");
}

function encode(payload: AdminSessionPayload, secret: string): string {
  const encodedPayload = Buffer.from(JSON.stringify(payload)).toString("base64url");
  return `${encodedPayload}.${sign(encodedPayload, secret)}`;
}

function decode(token: string, secret: string): AdminSessionPayload | null {
  const [encodedPayload, suppliedSignature] = token.split(".", 2);
  if (!encodedPayload || !suppliedSignature) return null;
  if (!safeEqual(suppliedSignature, sign(encodedPayload, secret))) return null;

  try {
    const payload = JSON.parse(Buffer.from(encodedPayload, "base64url").toString("utf8")) as Partial<AdminSessionPayload>;
    if (
      typeof payload.actorLabel !== "string"
      || typeof payload.csrf !== "string"
      || typeof payload.exp !== "number"
      || payload.exp <= Math.floor(Date.now() / 1000)
    ) {
      return null;
    }
    return payload as AdminSessionPayload;
  } catch {
    return null;
  }
}

export function adminAuthConfigured(): boolean {
  return Boolean(process.env.ADMIN_API_KEY?.trim() && sessionSecret());
}

export function verifyAdminCredential(suppliedKey: string): boolean {
  const configured = process.env.ADMIN_API_KEY?.trim();
  return Boolean(configured && suppliedKey && safeEqual(suppliedKey, configured));
}

export function createAdminSession(res: Response, actorLabel: string): AdminSessionPayload {
  const secret = sessionSecret();
  if (!secret) throw new Error("Admin session secret is not configured");

  const payload: AdminSessionPayload = {
    actorLabel: actorLabel.trim().slice(0, 100),
    csrf: randomBytes(24).toString("base64url"),
    exp: Math.floor(Date.now() / 1000) + SESSION_TTL_SECONDS,
  };

  res.cookie(ADMIN_SESSION_COOKIE, encode(payload, secret), {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "strict",
    path: "/api/admin",
    maxAge: SESSION_TTL_SECONDS * 1000,
  });

  return payload;
}

export function clearAdminSession(res: Response): void {
  res.clearCookie(ADMIN_SESSION_COOKIE, {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "strict",
    path: "/api/admin",
  });
}

export function readAdminSession(req: Request): AdminSessionPayload | null {
  const secret = sessionSecret();
  if (!secret) return null;
  const token = typeof req.cookies?.[ADMIN_SESSION_COOKIE] === "string"
    ? req.cookies[ADMIN_SESSION_COOKIE]
    : "";
  return token ? decode(token, secret) : null;
}

export function isValidCsrf(req: Request, session: AdminSessionPayload): boolean {
  const supplied = req.header("x-csrf-token") ?? "";
  return Boolean(supplied && safeEqual(supplied, session.csrf));
}

export type { AdminSessionPayload };
