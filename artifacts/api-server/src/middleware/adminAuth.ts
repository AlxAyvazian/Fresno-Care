import type { NextFunction, Request, Response } from "express";
import {
  adminAuthConfigured,
  isValidCsrf,
  readAdminSession,
  verifyAdminCredential,
} from "../lib/adminSession";

export function requireAdmin(req: Request, res: Response, next: NextFunction): void {
  if (!adminAuthConfigured()) {
    res.status(503).json({ error: "Admin authentication is not configured" });
    return;
  }

  const session = readAdminSession(req);
  if (session) {
    res.locals.adminActor = session.actorLabel;
    res.locals.adminAuthMode = "session";
    res.locals.adminSession = session;
    next();
    return;
  }

  const authorization = req.header("authorization") ?? "";
  const [scheme, suppliedKey] = authorization.split(" ", 2);
  if (scheme === "Bearer" && suppliedKey && verifyAdminCredential(suppliedKey)) {
    res.locals.adminActor = req.header("x-admin-actor")?.trim().slice(0, 100) || "API administrator";
    res.locals.adminAuthMode = "bearer";
    next();
    return;
  }

  res.status(401).json({ error: "Unauthorized" });
}

export function requireAdminCsrf(req: Request, res: Response, next: NextFunction): void {
  if (res.locals.adminAuthMode === "bearer") {
    next();
    return;
  }

  const session = res.locals.adminSession ?? readAdminSession(req);
  if (!session || !isValidCsrf(req, session)) {
    res.status(403).json({ error: "Invalid or missing CSRF token" });
    return;
  }

  next();
}
