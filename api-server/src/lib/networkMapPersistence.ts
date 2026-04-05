import { logger } from "./logger";

type SearchSnapshotInput = {
  route: string;
  city: string;
  state?: string | null;
  serviceType?: string | null;
  resultCount: number;
  requestParams: Record<string, unknown>;
  responsePayload: unknown;
};

type SearchSnapshotFilters = {
  route?: string;
  city?: string;
  state?: string;
  limit?: number;
};

type PersistenceModule = {
  db: any;
  networkMapSearchesTable: any;
};

let persistenceModulePromise: Promise<PersistenceModule | null> | null = null;

async function getPersistenceModule(): Promise<PersistenceModule | null> {
  if (!process.env.DATABASE_URL) {
    return null;
  }

  if (!persistenceModulePromise) {
    persistenceModulePromise = (async () => {
      try {
        const mod = await import("@workspace/db");
        if (!("db" in mod) || !("networkMapSearchesTable" in mod)) {
          logger.warn("Database module loaded but Network Map search schema is unavailable");
          return null;
        }

        return {
          db: mod.db,
          networkMapSearchesTable: mod.networkMapSearchesTable,
        };
      } catch (err) {
        logger.warn({ err }, "Persistence disabled because the database module could not be loaded");
        return null;
      }
    })();
  }

  return persistenceModulePromise;
}

function normalize(value?: string | null): string {
  return (value ?? "").trim().toLowerCase();
}

export function isPersistenceConfigured(): boolean {
  return Boolean(process.env.DATABASE_URL);
}

export async function saveSearchSnapshot(input: SearchSnapshotInput): Promise<boolean> {
  const persistence = await getPersistenceModule();
  if (!persistence) {
    return false;
  }

  try {
    await persistence.db.insert(persistence.networkMapSearchesTable).values({
      route: input.route,
      city: input.city,
      state: input.state ?? null,
      serviceType: input.serviceType ?? null,
      resultCount: input.resultCount,
      requestParams: input.requestParams,
      responsePayload: input.responsePayload,
    });
    return true;
  } catch (err) {
    logger.warn({ err, route: input.route }, "Failed to persist Network Map search snapshot");
    return false;
  }
}

export async function listSearchSnapshots(filters: SearchSnapshotFilters = {}): Promise<any[] | null> {
  const persistence = await getPersistenceModule();
  if (!persistence) {
    return null;
  }

  try {
    const requestedLimit = Math.min(Math.max(filters.limit ?? 50, 1), 200);
    const fetchLimit = Math.max(requestedLimit * 4, 100);
    const { desc } = await import("drizzle-orm");

    const rows = await persistence.db
      .select()
      .from(persistence.networkMapSearchesTable)
      .orderBy(desc(persistence.networkMapSearchesTable.createdAt))
      .limit(fetchLimit);

    return rows
      .filter((row: any) => {
        if (filters.route && normalize(row.route) !== normalize(filters.route)) {
          return false;
        }
        if (filters.city && normalize(row.city) !== normalize(filters.city)) {
          return false;
        }
        if (filters.state && normalize(row.state) !== normalize(filters.state)) {
          return false;
        }
        return true;
      })
      .slice(0, requestedLimit);
  } catch (err) {
    logger.warn({ err }, "Failed to read Network Map search history");
    return [];
  }
}
