-- name: ListAccountGroups :many
SELECT * FROM account_groups
ORDER BY display_name;