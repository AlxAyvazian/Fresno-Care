# Fresno Care

Fresno Care is a civic animal-welfare reporting application for documenting stray-animal concerns, organizing evidence, generating responsible outreach, and eventually publishing moderated neighborhood-level information.

## Current state

The repository currently contains a polished frontend prototype and an early API/database scaffold.

- The frontend is located in `artifacts/voicemap-fresno`.
- The Express API is located in `artifacts/api-server`.
- Shared PostgreSQL/Drizzle infrastructure is located in `lib/db`.
- The current report workflow still uses browser storage while the server-backed reporting and moderation system is being built.

Do not represent locally stored demo records as verified or citywide incident data.

## Requirements

- Node.js 24
- pnpm 10

## Install

```bash
pnpm install --no-frozen-lockfile
```

## Validate the workspace

```bash
pnpm run typecheck
pnpm run build
```

## Run the frontend

```bash
PORT=5173 BASE_PATH=/ pnpm --filter @workspace/voicemap-fresno run dev
```

`PORT` and `BASE_PATH` are optional. They default to `5173` and `/`.

## Run the API

The API requires a PostgreSQL connection string:

```bash
DATABASE_URL=postgresql://... PORT=3000 pnpm --filter @workspace/api-server run dev
```

The API currently exposes only the health endpoint:

```text
GET /api/healthz
```

## Privacy rules

- Reporter contact information must never be included in public share links.
- Anonymous reports must not retain reporter contact information.
- Precise locations, original evidence, and reporter identity must remain private unless a future moderation policy explicitly permits publication.
- Public report data must be generated through an explicit server-side public-data model rather than by exposing the private report object.

## Near-term roadmap

1. Stabilize repository structure and automated validation.
2. Replace browser-only report submission with the Fresno Care API and Neon/PostgreSQL.
3. Add private tracking tokens and sanitized public report IDs.
4. Add moderation and administrative review.
5. Add evidence uploads and privacy-safe neighborhood mapping.
6. Deploy the frontend and API with production environment configuration.

## Repository workflow

Development should use focused branches and pull requests rather than direct bulk uploads to `main`.
