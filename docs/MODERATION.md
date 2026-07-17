# Fresno Care moderation lifecycle

## Core rule

A submitted report, precise location, reporter contact, and evidence files are private by default.

Creating a report generates a stable reference UUID, but that UUID does not make the report public. Public listing and public share endpoints return a report only when its `publicationStatus` is `approved`.

## Intake and agency routing

A successful submit action performs these stages:

1. create the private report and `report_submitted` event
2. return a one-hour signed evidence upload/finalize token
3. upload validated evidence files to private PostgreSQL storage
4. finalize the report and attempt email delivery to configured agency recipients
5. record the real delivery result in `report_deliveries` and the moderation timeline

Successful agency delivery normally moves case status from `submitted` to `routed`. Delivery failure does not delete or reject the report; moderators can inspect the error and retry.

## Publication states

### `pending`

- assigned automatically to every new report
- visible through protected moderation endpoints only
- not returned by public report endpoints
- precise location, reporter contact, evidence, delivery history, and moderation history remain private

### `approved`

- must be selected by an authenticated moderator
- sets `publishedAt`
- permits the sanitized report to appear in the public dashboard and share route
- public location is reduced to the neighborhood value
- reporter contact, precise location, evidence files, delivery history, and moderation history remain private

### `rejected`

- selected when a report should not be published
- clears `publishedAt`
- removes the report from public listing and share endpoints
- preserves the private report, evidence, and audit history

## Case status versus publication status

These are separate decisions.

Case status describes operational handling:

- `submitted`
- `routed`
- `follow-up`
- `resolved`

Publication status controls public visibility:

- `pending`
- `approved`
- `rejected`

Changing a case to `routed` or `resolved` does not publish it. A moderator must separately approve publication.

## Evidence boundary

The intake route accepts up to five evidence files per report with:

- JPEG, PNG, WebP, PDF, and MP4 allowlisting
- MIME and magic-byte agreement
- 20 MB per-file limit
- 30 MB aggregate report limit
- sanitized filenames
- SHA-256 duplicate detection
- private `bytea` storage linked to the report

Evidence is not available through any public route. Moderators receive metadata through the protected report evidence endpoint and download content through a separate authenticated attachment endpoint with `Cache-Control: no-store, private`.

Email attachment limits may be lower than private storage limits. Files that cannot fit in an agency email remain available to moderators.

The current validation is not represented as antivirus or malware sandboxing. Keep evidence downloads attachment-only and add a dedicated scanning service before expanding the accepted-format allowlist.

## Agency delivery

Delivery uses server-side Resend credentials and recipient environment variables. Browser clients never receive provider credentials or recipient configuration.

Delivery states:

- `pending`
- `sent`
- `failed`
- `not_configured`

Each record stores:

- recipients
- subject
- provider
- provider message ID when sent
- attempt count
- last attempt timestamp
- last error

The API never reports `sent` unless the provider accepts the message and returns a message ID. Already-sent delivery is idempotent and is not duplicated by a retry request.

Reporter contact is excluded from the agency email by default. Set `REPORT_INCLUDE_REPORTER_CONTACT=true` only after deciding that disclosure is appropriate and clearly communicating it to reporters.

## Audit history

Each new report starts with a `report_submitted` event created in the same database transaction as the report.

The application also appends events for:

- case status changes
- publication decisions
- reviewer notes
- evidence uploads
- agency notification success
- agency notification failure or missing configuration

Each event records timestamp, event type, server-derived actor label, optional note, previous/new values where applicable, and private metadata.

The API exposes no update or delete route for moderation events. They are append-only at the application layer. Direct database administrators retain database-level power, so production database access must remain tightly controlled and logged.

## Moderator authentication

The moderation browser flow is session-based:

1. reviewer submits name and `ADMIN_API_KEY` once to `/api/admin/auth/login`
2. the API verifies the key using constant-time comparison
3. the API returns a CSRF token and sets a signed HTTP-only, Secure, SameSite=Strict cookie
4. browser requests use the cookie automatically
5. state-changing requests also provide `X-CSRF-Token`
6. the session expires after eight hours or is cleared by logout

The raw admin key is not stored in `localStorage` or `sessionStorage` and is not sent with each moderation request. Login attempts are rate-limited. The reviewer label is signed into the server session and used as the actor for audit events, so mutation bodies cannot spoof a different actor.

Bearer-key authentication remains available for controlled API automation. Cookie sessions are the expected browser path.

This is materially stronger than a browser-stored shared key, but it is still a single administrative credential rather than full named user accounts. For a larger organization, add an identity provider, per-user account lifecycle, roles, revocation, and MFA.

## Protected endpoints

Authentication:

```text
POST /api/admin/auth/login
GET  /api/admin/auth/session
POST /api/admin/auth/logout
```

Review and evidence:

```text
GET   /api/admin/reports
GET   /api/admin/reports/:publicId/events
GET   /api/admin/reports/:publicId/evidence
GET   /api/admin/evidence/:evidenceId
GET   /api/admin/reports/:publicId/delivery
POST  /api/admin/reports/:publicId/delivery/retry
POST  /api/admin/reports/:publicId/notes
PATCH /api/admin/reports/:publicId/status
PATCH /api/admin/reports/:publicId/publication
```

The admin credential and session-signing secrets must be configured only on the API service. They must never be placed in `VITE_*` variables or committed to the repository.

## Public-data boundary

Approved public responses may contain:

- public UUID
- observation date and optional time
- animal type and count
- neighborhood
- concern categories
- factual description
- evidence notes entered as text
- agency-contact history entered as text
- operational case status

Public responses must not contain:

- database primary key
- reporter contact information
- precise address or cross-street description
- evidence files or evidence metadata
- delivery recipients, provider IDs, or delivery errors
- moderator credentials or CSRF tokens
- reviewer labels or notes
- moderation event history
- private review metadata

## Database deployment

This lifecycle requires report, moderation, evidence, and delivery tables and enums. The Render build command runs:

```bash
pnpm --filter @workspace/db push
```

API startup also runs an idempotent base-schema verification so a missing-table deployment fails less silently. Reports created before a table/event feature is deployed do not receive synthetic history unless a deliberate backfill is performed.
