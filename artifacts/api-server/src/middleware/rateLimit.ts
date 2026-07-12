import type { RequestHandler } from "express";

type Bucket = {
  count: number;
  resetAt: number;
};

type RateLimitOptions = {
  windowMs: number;
  maxRequests: number;
};

const buckets = new Map<string, Bucket>();

function positiveInteger(value: string | undefined, fallback: number): number {
  const parsed = Number.parseInt(value ?? "", 10);
  return Number.isFinite(parsed) && parsed > 0 ? parsed : fallback;
}

export const intakeRateLimitOptions: RateLimitOptions = {
  windowMs: positiveInteger(process.env.INTAKE_RATE_LIMIT_WINDOW_MS, 15 * 60 * 1000),
  maxRequests: positiveInteger(process.env.INTAKE_RATE_LIMIT_MAX, 8),
};

function clientKey(ip: string | undefined): string {
  return ip?.trim() || "unknown";
}

export const intakeRateLimit: RequestHandler = (req, res, next) => {
  const now = Date.now();
  const key = clientKey(req.ip);
  const current = buckets.get(key);
  const bucket = !current || current.resetAt <= now
    ? { count: 0, resetAt: now + intakeRateLimitOptions.windowMs }
    : current;

  bucket.count += 1;
  buckets.set(key, bucket);

  const remaining = Math.max(intakeRateLimitOptions.maxRequests - bucket.count, 0);
  const retryAfterSeconds = Math.max(Math.ceil((bucket.resetAt - now) / 1000), 1);

  res.setHeader("RateLimit-Limit", String(intakeRateLimitOptions.maxRequests));
  res.setHeader("RateLimit-Remaining", String(remaining));
  res.setHeader("RateLimit-Reset", String(Math.ceil(bucket.resetAt / 1000)));

  if (bucket.count > intakeRateLimitOptions.maxRequests) {
    res.setHeader("Retry-After", String(retryAfterSeconds));
    res.status(429).json({
      error: "Too many report submissions. Please try again later.",
      retryAfterSeconds,
    });
    return;
  }

  next();
};

const cleanup = setInterval(() => {
  const now = Date.now();
  for (const [key, bucket] of buckets) {
    if (bucket.resetAt <= now) buckets.delete(key);
  }
}, 5 * 60 * 1000);

cleanup.unref();
