import { Router } from "express";
import {
  isPersistenceConfigured,
  listSearchSnapshots,
} from "../lib/networkMapPersistence";

const router = Router();

router.get("/search-history", async (req, res) => {
  if (!isPersistenceConfigured()) {
    res.status(503).json({ error: "Persistence is not enabled for this deployment yet." });
    return;
  }

  const limitRaw = Number.parseInt(String(req.query.limit ?? "50"), 10);
  const limit = Number.isFinite(limitRaw) ? limitRaw : 50;

  const rows = await listSearchSnapshots({
    route: typeof req.query.route === "string" ? req.query.route : undefined,
    city: typeof req.query.city === "string" ? req.query.city : undefined,
    state: typeof req.query.state === "string" ? req.query.state : undefined,
    limit,
  });

  if (rows === null) {
    res.status(503).json({ error: "Persistence is not enabled for this deployment yet." });
    return;
  }

  res.json(
    rows.map((row: any) => ({
      ...row,
      createdAt:
        row.createdAt instanceof Date
          ? row.createdAt.toISOString()
          : row.createdAt,
    })),
  );
});

export default router;
