-- name: RankedSearch :many
SELECT *,
       ts_rank(search, websearch_to_tsquery('simple', ?)) rank
FROM account_groups
WHERE search @@ websearch_to_tsquery('simple', ?)
ORDER BY rank DESC
    LIMIT 25;

-- name: Search :many
SELECT *
FROM account_groups
WHERE search @@ websearch_to_tsquery('simple', ?)
LIMIT 25;