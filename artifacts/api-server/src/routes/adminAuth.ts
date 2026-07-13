import { Router, type IRouter } from "express";
import {
  adminAuthConfigured,
  clearAdminSession,
  createAdminSession,
  verifyAdminCredential,
} from "../lib/adminSession";
import { requireAdmin, requireAdminCsrf } from "../middleware/adminAuth";
import { adminLoginRateLimit } from "../middleware/rateLimit";

const adminAuthRouter: IRouter = Router();

adminAuthRouter.post("/admin/auth/login", adminLoginRateLimit, (req, res) => {
  if (!adminAuthConfigured()) {
    res.status(503).json({ error: "Admin authentication is not configured" });
    return;
  }

  const actorLabel = typeof req.body?.actorLabel === "string"
    ? req.body.actorLabel.trim()
    : "";
  const adminKey = typeof req.body?.adminKey === "string"
    ? req.body.adminKey
    : "";

  if (!actorLabel || actorLabel.length > 100 || !adminKey) {
    res.status(400).json({ error: "Reviewer name and admin password are required" });
    return;
  }

  if (!verifyAdminCredential(adminKey)) {
    res.status(401).json({ error: "Invalid admin credentials" });
    return;
  }

  const session = createAdminSession(res, actorLabel);
  res.json({
    session: {
      actorLabel: session.actorLabel,
      csrfToken: session.csrf,
      expiresAt: new Date(session.exp * 1000).toISOString(),
    },
  });
});

adminAuthRouter.get("/admin/auth/session", requireAdmin, (_req, res) => {
  const session = res.locals.adminSession;
  res.json({
    session: {
      actorLabel: res.locals.adminActor,
      csrfToken: session?.csrf ?? null,
      expiresAt: session ? new Date(session.exp * 1000).toISOString() : null,
      authMode: res.locals.adminAuthMode,
    },
  });
});

adminAuthRouter.post(
  "/admin/auth/logout",
  requireAdmin,
  requireAdminCsrf,
  (_req, res) => {
    clearAdminSession(res);
    res.status(204).end();
  },
);

export default adminAuthRouter;
