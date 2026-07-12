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

## Protected endpoints

All moderation endpoints require:

```text
Authorization: Bearer <ADMIN_API_KEY>
```

Available endpoints:

```text
GET   /api/admin/reports
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
- private review metadata

## Current authentication limitation

`ADMIN_API_KEY` is appropriate only for a small, trusted review group during the initial deployment. Before broad organizational use, replace the shared key with named administrator accounts, role-based permissions, revocation, and immutable audit events.
