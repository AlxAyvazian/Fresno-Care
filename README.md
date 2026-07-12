# Fresno Care

Fresno Care is an independent civic animal-welfare reporting application for documenting stray-animal concerns, organizing evidence, generating responsible outreach, and publishing moderated neighborhood-level information.

Fresno Care is not operated by the City of Fresno and does not make legal findings or guarantee government review or response.

## Architecture

- React/Vite frontend: `artifacts/voicemap-fresno`
- Express API: `artifacts/api-server`
- PostgreSQL/Drizzle data layer: `lib/db`
- Package manager: pnpm 10
- Runtime: Node.js 24

The primary reporting flow is API-first. When the API is unavailable, the frontend preserves a device-only browser copy and tells the user that the report is not public.

## Implemented reporting flow

- validated report submission through `POST /api/reports`
- server-generated public report UUIDs
- read-only public report listing and individual report retrieval
- neighborhood-level public location data
- private precise locations and optional reporter contact details
- safe `/share/:publicId` links
- API-backed public dashboard with an explicit device-only fallback
- protected moderation queue and status updates
- legacy encoded share-link sanitization for backward compatibility

## Privacy model

- reporter contact information is never included in public API responses
- anonymous reports do not retain contact information
- reports without usable contact details are normalized as anonymous
- precise cross-street descriptions remain private
- public pages receive only neighborhood-level location information
- public users cannot update moderation status
- moderation endpoints require the server-configured `ADMIN_API_KEY`

## Install

```bash
pnpm install --frozen-lockfile
```

When intentionally regenerating or repairing the lockfile, use:

```bash
pnpm install --no-frozen-lockfile
```

## Validate the workspace

```bash
pnpm run typecheck
pnpm run build
```

CI runs both checks for pull requests and pushes to `main`.

## Environment variables

Copy `.env.example` for local configuration. Never commit real secrets.

### API

- `PORT`: listening port; required by the API process
- `DATABASE_URL`: PostgreSQL/Neon connection string
- `ADMIN_API_KEY`: long random secret used by protected moderation endpoints
- `CORS_ORIGINS`: comma-separated frontend origins allowed in production
- `NODE_ENV`: use `production` in deployment

### Frontend

- `VITE_API_URL`: full deployed API origin, such as `https://fresno-care-api.onrender.com`
- `BASE_PATH`: normally `/`
- `PORT`: optional local Vite port; defaults to `5173`

## Local development

### Frontend

```bash
PORT=5173 BASE_PATH=/ VITE_API_URL=http://localhost:3000 \
  pnpm --filter @workspace/voicemap-fresno run dev
```

### Database schema

After setting `DATABASE_URL`:

```bash
pnpm --filter @workspace/db push
```

### API

```bash
DATABASE_URL=postgresql://... \
ADMIN_API_KEY=replace-with-a-long-random-secret \
CORS_ORIGINS=http://localhost:5173 \
PORT=3000 \
pnpm --filter @workspace/api-server run dev
```

## API routes

### Public

```text
GET  /api/healthz
POST /api/reports
GET  /api/reports?limit=100
GET  /api/reports/:publicId
```

### Protected moderation

The following routes require `Authorization: Bearer <ADMIN_API_KEY>`:

```text
GET   /api/admin/reports?limit=100
PATCH /api/admin/reports/:publicId/status
```

The moderation frontend is available at `/admin`. The credential is stored only in browser session storage and is removed when the moderator signs out or closes the session.

## Manual Neon setup

1. Create a Neon PostgreSQL project and database.
2. Copy the pooled connection string.
3. Set it locally as `DATABASE_URL` and run `pnpm --filter @workspace/db push`.
4. Add the same connection string to the Render API service as a secret environment variable.
5. Do not commit the connection string or place it in frontend variables.

## Manual Render deployment

No Render Blueprint is required.

### API web service

Create a normal Render Web Service connected to this repository.

- Runtime: Node
- Root directory: repository root
- Build command:

```bash
corepack enable && pnpm install --frozen-lockfile && pnpm --filter @workspace/api-server build
```

- Start command:

```bash
pnpm --filter @workspace/api-server start
```

- Health check path: `/api/healthz`
- Environment variables:
  - `NODE_ENV=production`
  - `DATABASE_URL=<Neon connection string>`
  - `ADMIN_API_KEY=<long random secret>`
  - `CORS_ORIGINS=<deployed frontend origin>`
  - Render supplies `PORT`

### Frontend static site

Create a normal Render Static Site connected to this repository.

- Root directory: repository root
- Build command:

```bash
corepack enable && pnpm install --frozen-lockfile && pnpm --filter @workspace/voicemap-fresno build
```

- Publish directory:

```text
artifacts/voicemap-fresno/dist/public
```

- Environment variables:
  - `VITE_API_URL=<deployed API origin>`
  - `BASE_PATH=/`

Add a rewrite from `/*` to `/index.html` with status `200` so direct navigation to `/share/:publicId`, `/dashboard`, and `/admin` works.

## Remaining work

- evidence-file storage with strict type, size, and malware controls
- stronger multi-user administrator authentication before broader organizational use
- moderation notes and audit history
- deployment smoke tests against the actual Neon and Render services
- removal of remaining historical generated bundles from Git tracking

## Repository workflow

Use focused branches and pull requests. Do not commit secrets, `.env` files, generated `dist` output, TypeScript build caches, scrape checkpoints, or unrelated application data.
