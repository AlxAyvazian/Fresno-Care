import fs from 'fs/promises';
import path from 'path';

export const delay = (ms: number) => new Promise<void>((r) => setTimeout(r, ms));

export interface FetchOptions {
  retries?: number;
  baseDelayMs?: number;
  headers?: Record<string, string>;
  method?: string;
  body?: string;
}

export async function fetchWithRetry(url: string, options: FetchOptions = {}): Promise<Response> {
  const retries = options.retries ?? 3;
  const baseDelayMs = options.baseDelayMs ?? 1000;
  const method = options.method ?? 'GET';
  const headers: Record<string, string> = {
    'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36',
    Accept: 'text/html,application/xhtml+xml,application/xml;q=0.9,application/json,*/*;q=0.8',
    'Accept-Language': 'en-US,en;q=0.5',
    ...(options.headers || {}),
  };

  let lastErr: Error | undefined;
  for (let i = 0; i < retries; i++) {
    try {
      const res = await fetch(url, { method, headers, body: options.body });
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      return res;
    } catch (err) {
      lastErr = err as Error;
      const wait = baseDelayMs * (i + 1) + Math.random() * baseDelayMs;
      console.log(`  Retry ${i + 1}/${retries} for ${url} after ${Math.round(wait)}ms`);
      await delay(wait);
    }
  }
  throw lastErr;
}

export async function fetchHtml(url: string, options?: FetchOptions): Promise<string> {
  const res = await fetchWithRetry(url, options);
  return res.text();
}

export async function fetchJson(url: string, options?: FetchOptions): Promise<unknown> {
  const res = await fetchWithRetry(url, {
    ...options,
    headers: {
      ...(options?.headers || {}),
      Accept: 'application/json',
    },
  });
  return res.json();
}

export async function loadCheckpoint<T>(filePath: string, defaultValue: T): Promise<T> {
  try {
    const raw = await fs.readFile(filePath, 'utf-8');
    return JSON.parse(raw) as T;
  } catch {
    return defaultValue;
  }
}

export async function saveCheckpoint<T>(filePath: string, data: T): Promise<void> {
  await fs.writeFile(filePath, JSON.stringify(data, null, 2));
}

export async function backupFileIfExists(filePath: string): Promise<void> {
  try {
    await fs.access(filePath);
    const dir = path.dirname(filePath);
    const base = path.basename(filePath);
    const timestamp = new Date().toISOString().replace(/[:.]/g, '-');
    const backupPath = path.join(dir, `${base}.backup-${timestamp}`);
    await fs.copyFile(filePath, backupPath);
    console.log(`  Backup created: ${backupPath}`);
  } catch {
    // file does not exist, no backup needed
  }
}

export function escapeCsv(val: string): string {
  if (!val) return '';
  if (/[",\n\r]/.test(val)) {
    return `"${val.replace(/"/g, '""')}"`;
  }
  return val;
}

export async function ensureFileHeader(filePath: string, headers: string[]): Promise<void> {
  try {
    await fs.access(filePath);
  } catch {
    await fs.writeFile(filePath, headers.join(',') + '\n');
  }
}

export async function appendCsvRow(filePath: string, headers: string[], row: Record<string, string>): Promise<void> {
  const line = headers.map((h) => escapeCsv(row[h] || '')).join(',');
  await fs.appendFile(filePath, line + '\n');
}

export async function appendJsonl(filePath: string, obj: unknown): Promise<void> {
  await fs.appendFile(filePath, JSON.stringify(obj) + '\n');
}

export interface AuditEntry {
  url: string;
  status: string;
  error?: string;
  source_page_type: string;
  timestamp: string;
}

const AUDIT_HEADERS = ['url', 'status', 'error', 'source_page_type', 'timestamp'];

export async function ensureAuditHeader(filePath: string): Promise<void> {
  await ensureFileHeader(filePath, AUDIT_HEADERS);
}

export async function appendAudit(filePath: string, audit: AuditEntry): Promise<void> {
  await appendCsvRow(filePath, AUDIT_HEADERS, {
    url: audit.url,
    status: audit.status,
    error: audit.error || '',
    source_page_type: audit.source_page_type,
    timestamp: audit.timestamp,
  });
}

export function buildDedupeKey(parts: string[]): string {
  return parts.map((p) => p.toLowerCase().trim().replace(/\s+/g, ' ')).join('|');
}

export async function buildSeenKeysFromCsv(
  filePath: string,
  keyColumns: string[]
): Promise<Set<string>> {
  const seen = new Set<string>();
  try {
    const raw = await fs.readFile(filePath, 'utf-8');
    const lines = raw.trim().split('\n');
    if (lines.length <= 1) return seen;
    const headers = lines[0].split(',').map((h) => h.trim());
    const idx: Record<string, number> = {};
    for (let i = 0; i < headers.length; i++) {
      idx[headers[i]] = i;
    }
    for (let i = 1; i < lines.length; i++) {
      const row = lines[i].split(',');
      if (row.length < keyColumns.length) continue;
      const parts = keyColumns.map((col) => {
        const val = (row[idx[col]] || '').toLowerCase().trim().replace(/\s+/g, ' ');
        return val;
      });
      seen.add(parts.join('|'));
    }
  } catch {
    // file not found or unreadable
  }
  return seen;
}

export class RateLimiter {
  private lastCall = 0;
  constructor(private minIntervalMs: number) {}

  async throttle(): Promise<void> {
    const now = Date.now();
    const elapsed = now - this.lastCall;
    if (elapsed < this.minIntervalMs) {
      await delay(this.minIntervalMs - elapsed + Math.random() * 100);
    }
    this.lastCall = Date.now();
  }
}
