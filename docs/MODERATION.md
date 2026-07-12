# Fresno Care moderation lifecycle

## Core rule

A submitted report is private by default.

Creating a report generates a stable reference UUID, but that UUID does not make the report public. Public listing and public share endpoints return a report only when its `publicationStatus` is `approved`.

## Publication states

### `pending`

- assigned automatically to every new report
- visible through protected moderation endpoints only
- not returned by `GET /api/reports`
- not returned by `GET /api/reports/:publicId`
- precise location and optional reporter contact remain private

### `approved`

- must be selected by an authorized moderator
- sets `publishedAt`
- permits the sanitized report to appear in the public dashboard
- permits `/share/:publicId` to load
- public location is reduced to the neighborhood value
- reporter contact and precise location remain private

### `rejected`

- selected when a report should not be published
- clears `publishedAt`
- removes the report from public listing and share endpoints
- preserves the private report for authorized review and audit work

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

## Audit history

Each new report starts with a `report_submitted` event created in the same database transaction as the report.

The application appends a moderation event whenever a reviewer:

- changes case status
- changes publication status
- adds a standalone reviewer note

Each event records:

- timestamp
- event type
- reviewer label
- optional rationale or note
- previous and new values when applicable
- the report public UUID in private event metadata

Report changes and their matching audit events are committed in one database transaction. If either operation fails, neither is committed.

The API exposes no update or delete route for moderation events. They are append-only at the application layer. Direct database administrators still retain database-level power, so production database access must remain tightly controlled and logged.

## Reviewer identity limitation

The current reviewer label is entered by the reviewer and used with a shared `ADMIN_API_KEY`. It improves accountability within a small trusted group, but it is not verified individual identity.

Before wider organizational use, replace the shared key with named accounts, individual authentication, role-based permissions, session revocation, and server-derived actor identity.

## Protected endpoints

All moderation endpoints require:

```text
Authorization: Bearer <ADMIN_API_KEY>
```

Available endpoints:

```text
GET   /api/admin/reports
GET   /api/admin/reports/:publicId/events
POST  /api/admin/reports/:publicId/notes
PATCH /api/admin/reports/:publicId/status
PATCH /api/admin/reports/:publicId/publication
```

The admin key must be configured only on the API service. It must never be placed in `VITE_*` variables or committed to the repository.

## Public-data boundary

Approved public responses may contain:

- public UUID
- observation date and optional time
- animal type and count
- neighborhood
- concern categories
- factual description
- evidence notes
- agency-contact history
- operational case status

Public responses must not contain:

- database primary key
- reporter contact information
- precise address or cross-street description
- moderator credential
- reviewer labels or notes
- moderation event history
- private review metadata

## Database deployment

This lifecycle requires the `moderation_events` table and `moderation_event_type` enum. After setting the production `DATABASE_URL`, update the Neon schema with:

```bash
pnpm --filter @workspace/db push
```

New reports receive an initial submission event automatically. Reports created before this schema is deployed will not have a synthetic historical submission event unless a deliberate, reviewed backfill is performed.
