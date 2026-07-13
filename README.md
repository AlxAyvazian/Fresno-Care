# Fresno Care

Fresno Care is an independent civic animal-welfare reporting application for documenting stray-animal concerns, preserving private evidence, notifying configured public agencies, and publishing moderated neighborhood-level information.

Fresno Care is not operated by the City of Fresno and does not make legal findings or guarantee government review or response.

## Architecture

- React/Vite frontend: `artifacts/voicemap-fresno`
- Express API: `artifacts/api-server`
- PostgreSQL/Drizzle data layer: `lib/db`
- Package manager: pnpm 10
- Runtime: Node.js 24

The deployed Render configuration is a single Web Service. The Express API serves both `/api/*` and the built React application from the same origin.

## Implemented reporting flow

- validated private report submission through `POST /api/reports`
- server-generated public report UUIDs
- private evidence upload for JPEG, PNG, WebP, PDF, and MP4
- signature, file-count, per-file size, aggregate size, filename, and duplicate validation
- private evidence storage in PostgreSQL and authenticated download only
- automatic Resend delivery to configured Animal Center, police, council, city, and additional recipients
- evidence attachment to agency email when email-size limits permit
- persistent delivery status, attempts, provider ID, recipient list, and error history
- moderator retry for failed or unconfigured delivery
- read-only approved public report listing and individual report retrieval
- neighborhood-level public location data
- private precise locations and optional reporter contact details
- safe `/share/:publicId` links
- signed HTTP-only moderator sessions with CSRF-protected mutations
- immutable moderation, evidence, and notification events

## Submission sequence

The public submit button performs this sequence:

1. Create the private report and moderation record.
2. Upload each selected evidence file with a short-lived signed token.
3. Finalize the report.
4. Send the report and eligible evidence attachments to configured agency recipients.
5. Record delivery success, failure, or missing configuration for moderator review.

A report remains accepted and available to moderators if the email provider is temporarily unavailable. The submit confirmation shows the real delivery state; it never claims an email was sent unless the provider accepted it.

## Privacy model

- reporter contact information is never included in public API responses
- anonymous reports do not retain contact information
- precise cross-street descriptions remain private
- evidence files are never exposed by public routes
- evidence downloads require an authenticated moderator session
- evidence responses use private, no-store caching and attachment disposition
- public pages receive only neighborhood-level location information
- public users cannot update moderation status
- reporter contact is excluded from agency email unless `REPORT_INCLUDE_REPORTER_CONTACT=true`
- the admin password is exchanged once for a signed HTTP-only cookie and is not stored in browser storage
- admin mutations require a session CSRF token
- bearer-key access remains available for controlled API automation

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

### Single Render Web Service

Required core values:

- `NODE_ENV=production`
- `DATABASE_URL`: PostgreSQL/Neon connection string; prefer `sslmode=verify-full`
- `ADMIN_API_KEY`: initial moderator login credential
- `ADMIN_SESSION_SECRET`: separate random secret for signed moderator sessions
- `EVIDENCE_UPLOAD_SECRET`: separate random secret for report evidence/finalize tokens
- `BASE_PATH=/`

Render supplies `PORT`. Do not set `VITE_API_URL` for the same-origin Render deployment.

### Automatic agency delivery

Required to send email:

- `RESEND_API_KEY`
- `REPORT_FROM_EMAIL`: verified Resend sender
- one or more configured recipients:
  - `REPORT_TO_ANIMAL_CENTER`
  - `REPORT_TO_POLICE`
  - `REPORT_TO_COUNCIL`
  - `REPORT_TO_CITY`
  - `REPORT_NOTIFICATION_RECIPIENTS`

Optional:

- `REPORT_REPLY_TO`
- `REPORT_INCLUDE_REPORTER_CONTACT=false`
- `REPORT_MAX_EMAIL_ATTACHMENT_BYTES=10485760`

Every recipient variable accepts comma-, semicolon-, or newline-separated addresses. Keep current official recipient addresses in Render environment variables rather than hard-coding officeholders in source code.

### Split deployment only

Only set these if deliberately hosting the frontend and API on different origins:

- `CORS_ORIGINS`: comma-separated frontend origins allowed in production
- `VITE_API_URL`: full deployed API origin

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
ADMIN_API_KEY=replace-with-a-long-random-admin-password \
ADMIN_SESSION_SECRET=replace-with-a-different-long-random-secret \
EVIDENCE_UPLOAD_SECRET=replace-with-another-long-random-secret \
CORS_ORIGINS=http://localhost:5173 \
PORT=3000 \
pnpm --filter @workspace/api-server run dev
```

## API routes

### Public intake and approved reports

```text
GET  /api/healthz
POST /api/reports
POST /api/reports/:publicId/evidence
POST /api/reports/:publicId/finalize
GET  /api/reports?limit=100
GET  /api/reports/:publicId
```

The evidence and finalize routes require the short-lived signed token returned by report creation.

### Moderator authentication

```text
POST /api/admin/auth/login
GET  /api/admin/auth/session
POST /api/admin/auth/logout
```

### Protected moderation

```text
GET   /api/admin/reports?limit=100
GET   /api/admin/reports/:publicId/events
GET   /api/admin/reports/:publicId/evidence
GET   /api/admin/evidence/:evidenceId
GET   /api/admin/reports/:publicId/delivery
POST  /api/admin/reports/:publicId/delivery/retry
POST  /api/admin/reports/:publicId/notes
PATCH /api/admin/reports/:publicId/status
PATCH /api/admin/reports/:publicId/publication
```

Cookie-authenticated state-changing requests require `X-CSRF-Token`. Bearer authentication remains supported for controlled API clients.

## Manual Neon setup

1. Create a Neon PostgreSQL project and database.
2. Copy the pooled connection string.
3. Add it to the Render Web Service as `DATABASE_URL`.
4. Do not commit it or place it in frontend variables.

The Render build command runs `pnpm --filter @workspace/db push`, and API startup also verifies missing base tables and enums. Fresh deployments receive report, moderation, evidence, and delivery tables.

## Manual Render deployment

Use one Render Web Service connected to this repository.

- Runtime: Node
- Root directory: repository root
- Build command:

```bash
pnpm install --no-frozen-lockfile && pnpm run build:render-web
```

- Start command:

```bash
pnpm run start:render-web
```

- Health check path: `/api/healthz`

Required Render environment variables:

```text
NODE_ENV=production
DATABASE_URL=<Neon connection string>
ADMIN_API_KEY=<long random admin password>
ADMIN_SESSION_SECRET=<different long random secret>
EVIDENCE_UPLOAD_SECRET=<different long random secret>
BASE_PATH=/
RESEND_API_KEY=<Resend API key>
REPORT_FROM_EMAIL=<verified sender>
REPORT_TO_ANIMAL_CENTER=<current official address>
REPORT_TO_POLICE=<current official address>
REPORT_TO_COUNCIL=<current official addresses>
REPORT_TO_CITY=<current official addresses>
```

Do not create a separate Render Static Site. Do not set `VITE_API_URL` unless deliberately hosting the frontend on a different origin.

## Evidence security boundary

The current implementation performs strict allowlisting, magic-byte validation, filename sanitization, size limits, SHA-256 deduplication, private database storage, authenticated downloads, and attachment-only delivery. It does not claim to provide antivirus or malware sandboxing. Add a dedicated malware-scanning service before accepting untrusted formats beyond the current allowlist or before opening evidence files outside an isolated viewer.

## Remaining production operations

- configure and verify the Resend sender domain
- enter current official agency recipients in Render
- perform a real test submission and verify every recipient received it
- test failed-delivery retry from `/admin`
- establish a recipient-maintenance process when officeholders or agency addresses change
- add external error monitoring and backups appropriate to the chosen Neon/Render plans

## Repository workflow

Use focused branches and pull requests. Do not commit secrets, `.env` files, generated `dist` output, TypeScript build caches, scrape checkpoints, or unrelated application data.
