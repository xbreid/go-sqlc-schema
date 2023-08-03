-- name: UpsertAccountGroup :exec
INSERT INTO account_groups
(uuid, display_name, country, locality, postal_code, street_address, region, external_id, active, created_at)
VALUES
    ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10)
ON CONFLICT
    (external_id)
DO UPDATE SET
  display_name = excluded.display_name,
  country = excluded.country,
  locality = excluded.locality,
  postal_code = excluded.postal_code,
  street_address = excluded.street_address,
  region = excluded.region,
  active = excluded.active;
