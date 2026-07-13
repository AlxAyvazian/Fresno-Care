import { pool } from "./index";

const createEnumIfMissing = (name: string, values: readonly string[]) => `
DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = '${name}') THEN
    CREATE TYPE ${name} AS ENUM (${values.map((value) => `'${value}'`).join(", ")});
  END IF;
END
$$;
`;

async function ensureEnum(name: string, values: readonly string[]): Promise<void> {
  await pool.query(createEnumIfMissing(name, values));
  for (const value of values) {
    await pool.query(`ALTER TYPE ${name} ADD VALUE IF NOT EXISTS '${value}';`);
  }
}

export async function ensureDatabaseSchema(): Promise<void> {
  await pool.query(`CREATE EXTENSION IF NOT EXISTS pgcrypto;`);

  await ensureEnum("report_status", [
    "submitted",
    "routed",
    "follow-up",
    "resolved",
  ]);

  await ensureEnum("report_publication_status", [
    "pending",
    "approved",
    "rejected",
  ]);

  await ensureEnum("report_danger", ["yes", "no", "unsure"]);
  await ensureEnum("moderation_event_type", [
    "report_submitted",
    "case_status_changed",
    "publication_status_changed",
    "note_added",
    "evidence_uploaded",
    "notification_sent",
    "notification_failed",
  ]);
  await ensureEnum("evidence_validation_status", ["accepted", "rejected"]);
  await ensureEnum("report_delivery_status", [
    "pending",
    "sent",
    "failed",
    "not_configured",
  ]);

  await pool.query(`
    CREATE TABLE IF NOT EXISTS reports (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      public_id uuid NOT NULL UNIQUE DEFAULT gen_random_uuid(),
      created_at timestamp with time zone NOT NULL DEFAULT now(),
      updated_at timestamp with time zone NOT NULL DEFAULT now(),
      published_at timestamp with time zone,
      animal_type text NOT NULL,
      animal_count integer NOT NULL,
      location_description text NOT NULL,
      neighborhood text NOT NULL,
      incident_date text NOT NULL,
      incident_time text NOT NULL DEFAULT '',
      immediate_danger report_danger NOT NULL DEFAULT 'unsure',
      concern_types jsonb NOT NULL DEFAULT '[]'::jsonb,
      description text NOT NULL,
      evidence_notes text NOT NULL DEFAULT '',
      agencies_contacted text NOT NULL DEFAULT '',
      agency_response text NOT NULL DEFAULT '',
      anonymous boolean NOT NULL DEFAULT true,
      reporter_contact text,
      submission_fingerprint text,
      status report_status NOT NULL DEFAULT 'submitted',
      publication_status report_publication_status NOT NULL DEFAULT 'pending'
    );
  `);

  await pool.query(`
    CREATE TABLE IF NOT EXISTS moderation_events (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      report_id uuid NOT NULL REFERENCES reports(id) ON DELETE CASCADE,
      created_at timestamp with time zone NOT NULL DEFAULT now(),
      event_type moderation_event_type NOT NULL,
      actor_label text NOT NULL,
      note text,
      previous_value text,
      new_value text,
      metadata jsonb NOT NULL DEFAULT '{}'::jsonb
    );
  `);

  await pool.query(`
    CREATE TABLE IF NOT EXISTS report_evidence (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      report_id uuid NOT NULL REFERENCES reports(id) ON DELETE CASCADE,
      created_at timestamp with time zone NOT NULL DEFAULT now(),
      original_name text NOT NULL,
      mime_type text NOT NULL,
      size_bytes integer NOT NULL,
      sha256 text NOT NULL,
      validation_status evidence_validation_status NOT NULL DEFAULT 'accepted',
      content bytea NOT NULL
    );
  `);

  await pool.query(`
    CREATE TABLE IF NOT EXISTS report_deliveries (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      report_id uuid NOT NULL REFERENCES reports(id) ON DELETE CASCADE,
      created_at timestamp with time zone NOT NULL DEFAULT now(),
      updated_at timestamp with time zone NOT NULL DEFAULT now(),
      status report_delivery_status NOT NULL DEFAULT 'pending',
      recipients jsonb NOT NULL DEFAULT '[]'::jsonb,
      subject text NOT NULL,
      provider text NOT NULL DEFAULT 'resend',
      provider_message_id text,
      attempts integer NOT NULL DEFAULT 0,
      last_attempt_at timestamp with time zone,
      last_error text
    );
  `);

  await pool.query(`
    CREATE INDEX IF NOT EXISTS reports_submission_fingerprint_created_idx
      ON reports (submission_fingerprint, created_at);
  `);
  await pool.query(`
    CREATE INDEX IF NOT EXISTS reports_publication_status_published_idx
      ON reports (publication_status, published_at DESC, created_at DESC);
  `);
  await pool.query(`
    CREATE INDEX IF NOT EXISTS moderation_events_report_created_idx
      ON moderation_events (report_id, created_at);
  `);
  await pool.query(`
    CREATE INDEX IF NOT EXISTS report_evidence_report_created_idx
      ON report_evidence (report_id, created_at);
  `);
  await pool.query(`
    CREATE INDEX IF NOT EXISTS report_evidence_report_sha_idx
      ON report_evidence (report_id, sha256);
  `);
  await pool.query(`
    CREATE INDEX IF NOT EXISTS report_deliveries_report_created_idx
      ON report_deliveries (report_id, created_at);
  `);
  await pool.query(`
    CREATE INDEX IF NOT EXISTS report_deliveries_status_updated_idx
      ON report_deliveries (status, updated_at);
  `);
}
