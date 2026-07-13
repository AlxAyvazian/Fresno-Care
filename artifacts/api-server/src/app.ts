import fs from "node:fs";
import path from "node:path";
import express, {
  type ErrorRequestHandler,
  type Express,
} from "express";
import cors from "cors";
import pinoHttp from "pino-http";
import router from "./routes";
import { logger } from "./lib/logger";

const app: Express = express();
const allowedOrigins = (process.env.CORS_ORIGINS ?? "")
  .split(",")
  .map((origin) => origin.trim())
  .filter(Boolean);

function resolveFrontendDistDir(): string | null {
  const configured = process.env.FRONTEND_DIST_DIR?.trim();
  const candidates = [
    configured,
    path.resolve(process.cwd(), "../voicemap-fresno/dist/public"),
    path.resolve(process.cwd(), "artifacts/voicemap-fresno/dist/public"),
  ].filter((candidate): candidate is string => Boolean(candidate));

  return candidates.find((candidate) => fs.existsSync(path.join(candidate, "index.html"))) ?? null;
}

if (process.env.NODE_ENV === "production") {
  // Render and similar platforms place the app behind one trusted proxy hop.
  app.set("trust proxy", 1);
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
app.use((req, res, next) => {
  res.setHeader("X-Request-Id", String(req.id));
  res.setHeader("X-Content-Type-Options", "nosniff");
  next();
});
app.use(
  cors({
    origin(origin, callback) {
      if (!origin || process.env.NODE_ENV !== "production" || allowedOrigins.length === 0) {
        callback(null, true);
        return;
      }

      callback(null, allowedOrigins.includes(origin));
    },
  }),
);
app.use(express.json({ limit: "256kb" }));
app.use(express.urlencoded({ extended: true, limit: "256kb" }));

app.use("/api", router);

const frontendDistDir = resolveFrontendDistDir();

if (frontendDistDir) {
  logger.info({ frontendDistDir }, "Serving frontend from API web service");

  app.use(
    express.static(frontendDistDir, {
      index: false,
      maxAge: "1h",
      setHeaders(res, filePath) {
        if (path.basename(filePath) === "index.html") {
          res.setHeader("Cache-Control", "no-store");
        }
      },
    }),
  );

  app.get(/^(?!\/api(?:\/|$)).*/, (req, res, next) => {
    if (!req.accepts("html")) {
      next();
      return;
    }

    res.setHeader("Cache-Control", "no-store");
    res.sendFile(path.join(frontendDistDir, "index.html"));
  });
} else {
  logger.warn("Frontend build output not found; API-only mode is active");
}

const errorHandler: ErrorRequestHandler = (error, req, res, _next) => {
  logger.error({ err: error, requestId: req.id }, "Unhandled API error");
  res.status(500).json({
    error: "Internal server error",
    requestId: String(req.id),
  });
};

app.use(errorHandler);

export default app;
