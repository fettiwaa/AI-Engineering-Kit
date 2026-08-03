# Database

## 1. Schema Changes

- Never generate destructive SQL without explicit approval.
- Never `DROP DATABASE` or `DROP TABLE`.
- Never `DELETE` or `UPDATE` without a `WHERE` clause unless explicitly requested.
- Never modify production data automatically.
- Prefer additive, backward-compatible migrations.

## 2. Migrations

- Every schema change must be a versioned migration.
- Migrations must be reversible where practical.
- Test migrations on a copy of production data before applying.

## 3. Queries

- Always parameterize queries to prevent injection.
- Avoid `SELECT *` in production code.
- Index columns used in `WHERE`, `JOIN`, and `ORDER BY` clauses.

## 4. Connections

- Use connection pooling.
- Never expose credentials in source code.
- Rotate credentials according to policy.

## 5. Backups

- Never assume backups exist; verify them.
- Test restore procedures regularly.
