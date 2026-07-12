import { timingSafeEqual } from "node:crypto";
import type { NextFunction, Request, Response } from "express";

function safeEqual(left: string, right: string): boolean {
  const leftBuffer = Buffer.from(left);
  const rightBuffer = Buffer.from(right);

  if (leftBuffer.length !== rightBuffer.length) return false;
  return timingSafeEqual(leftBuffer, rightBuffer);
}

export function requireAdmin(req: Request, res: Response, next: NextFunction): void {
  const configuredKey = process.env.ADMIN_API_KEY?.trim();

  if (!configuredKey) {
    res.status(503).json({ error: "Admin API is not configured" });
    return;
  }

  const authorization = req.header("authorization") ?? "";
  const [scheme, suppliedKey] = authorization.split(" ", 2);

  if (scheme !== "Bearer" || !suppliedKey || !safeEqual(suppliedKey, configuredKey)) {
    res.status(401).json({ error: "Unauthorized" });
    return;
  }

  next();
}
