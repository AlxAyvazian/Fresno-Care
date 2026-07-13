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

export async function ensureDatabaseSchema(): Promise<void> {
  await pool.query(createEnumIfMissing("report_status", [
    "submitted",
    "routed",
    "follow-up",
    "resolved",
  ]));

  await pool.query(createEnumIfMissing("report_publication_status", [
    "pending",
    "approved",
    "rejected",
  ]));

  await pool.query(createEnumIfMissing("report_danger", [
    "yes",
    "no",
    "unsure",
  ]));

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
    CREATE INDEX IF NOT EXISTS reports_submission_fingerprint_created_idx
      ON reports (submission_fingerprint, created_at);
  `);

  await pool.query(`
    CREATE INDEX IF NOT EXISTS reports_publication_status_published_idx
      ON reports (publication_status, published_at DESC, created_at DESC);
  `);
}
