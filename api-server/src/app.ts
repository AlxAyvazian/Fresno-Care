import express, { type Express } from "express";
import cors from "cors";
import pinoHttp from "pino-http";
import path from "node:path";
import { fileURLToPath } from "node:url";
import router from "./routes";
import { logger } from "./lib/logger";
import { saveSearchSnapshot } from "./lib/networkMapPersistence";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const app: Express = express();
const SNAPSHOT_ROUTES = new Set([
  "/api/price-finder",
  "/api/price-hunt",
  "/api/occ-hunt",
]);

function getResultCount(body: unknown): number {
  if (!body || typeof body !== "object") {
    return 0;
  }

  const candidate = body as Record<string, unknown>;
  if (typeof candidate.clinicCount === "number") {
    return candidate.clinicCount;
  }
  if (Array.isArray(candidate.clinics)) {
    return candidate.clinics.length;
  }
  if (Array.isArray(candidate.results)) {
    return candidate.results.length;
  }
  if (Array.isArray(candidate.partners)) {
    return candidate.partners.length;
  }
  return 0;
}

app.use(
  pinoHttp({
    logger,
    serializers: {
      req(req) {
        return {
          id: req.id,
          method: req.method,
          url: req.url?.split("?")[0],
        };
      },
      res(res) {
        return {
          statusCode: res.statusCode,
        };
      },
    },
  }),
);
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use((req, res, next) => {
  if (req.method !== "GET" || !SNAPSHOT_ROUTES.has(req.path)) {
    next();
    return;
  }

  const originalJson = res.json.bind(res);
  res.json = ((body: unknown) => {
    if (res.statusCode < 400) {
      const query = req.query as Record<string, unknown>;
      const route = req.path.replace(/^\/api\//, "");
      const city = typeof query.city === "string" ? query.city : "";
      const state = typeof query.state === "string" ? query.state : null;
      const serviceType =
        typeof query.serviceType === "string" ? query.serviceType : null;

      void saveSearchSnapshot({
        route,
        city,
        state,
        serviceType,
        resultCount: getResultCount(body),
        requestParams: {
          city,
          state,
          serviceType,
          ...query,
        },
        responsePayload: body,
      });
    }

    return originalJson(body);
  }) as typeof res.json;

  next();
});

app.use("/api", router);

// Serve frontend static files in production
const frontendDist = path.resolve(__dirname, "../../occu-med-map/dist/public");
app.use(express.static(frontendDist));
app.get("/{*path}", (_req, res) => {
  res.sendFile(path.join(frontendDist, "index.html"));
});

export default app;
