-- name: RankedSearch :many
SELECT uuid, display_name, country, locality, postal_code, street_address, region, external_id, active, created_at,
       ts_rank(search, websearch_to_tsquery('simple', $1)) rank
FROM account_groups
WHERE search @@ websearch_to_tsquery('simple', $1)
ORDER BY rank DESC
    LIMIT 25;

-- name: Search :many
SELECT uuid, display_name, country, locality, postal_code, street_address, region, external_id, active, created_at
FROM account_groups
WHERE search @@ websearch_to_tsquery('simple', $1)
    LIMIT 25;