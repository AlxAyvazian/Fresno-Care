# Provider Inventory Tables

The `/api/map-inventory` endpoint queries provider inventory tables in the Neon
Postgres database. If these tables do not exist, the endpoint fails open and
returns an empty result set with a warning instead of a 500 error.

## Tables required

| Table | Schema file |
|-------|-------------|
| `providers` | `lib/db/src/schema/providers.ts` |
| `provider_locations` | `lib/db/src/schema/providers.ts` |
| `provider_contacts` | `lib/db/src/schema/providers.ts` |
| `provider_services` | `lib/db/src/schema/providers.ts` |
| `provider_sources` | `lib/db/src/schema/providers.ts` |
| `provider_evidence` | `lib/db/src/schema/providers.ts` |
| `geocode_cache` | `lib/db/src/schema/providers.ts` |

## How to initialize tables in Neon

### Prerequisites

- `DATABASE_URL` environment variable set to your Neon connection string
- `drizzle-kit` installed (included in `@workspace/db` devDependencies)

### Option 1: drizzle-kit push (recommended)

```bash
# From the repo root
cd lib/db
DATABASE_URL="postgresql://user:pass@host/db?sslmode=require" pnpm push
```

This reads `drizzle.config.ts` and creates/updates all tables defined in the
schema to match the current Drizzle schema definitions.

### Option 2: drizzle-kit push --force

Use `--force` only if you need to drop and recreate tables (destructive):

```bash
cd lib/db
DATABASE_URL="postgresql://user:pass@host/db?sslmode=require" pnpm push-force
```

### Verifying

After running the push, verify the tables exist:

```sql
SELECT table_name FROM information_schema.tables
WHERE table_schema = 'public'
AND table_name LIKE 'provider_%';
```

The `/api/map-inventory` endpoint should return `200` with `providers: []`
(empty but no warning) once tables exist but contain no data.
