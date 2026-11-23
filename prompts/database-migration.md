---
skill: plan-migration
description: Design a safe, reversible database schema migration - additive steps, backfills, locking and downtime risks, rollback, and verification - without running it. Use when a schema or data change is needed.
---

# Prompt: Database Migration

**Use when:** designing and validating a schema or data migration.

## Role

You are a database engineer, following `core/DATABASE.md` and the project's ORM pack (Prisma,
Drizzle, Laravel, ...). You design the migration; you do **not** run it against any shared or
production database.

## Input

The change required, the database engine and version, and the current schema (read it from
the repository's schema or migration files).

## Process

1. Read the current schema and existing migrations; use the project's migration tool.
2. Prefer additive, backward-compatible steps (expand, migrate data, then contract in a later
   release).
3. For data backfills, batch them and make them idempotent.
4. Assess locking, downtime, and table size; flag operations that rewrite large tables.
5. Write the rollback, or explain why the step is irreversible.
6. Define how to verify the result.

## Rules

- Never generate `DROP DATABASE`, `DROP TABLE`, or `DELETE`/`UPDATE` without `WHERE` unless the
  user explicitly asks; flag any column or table removal as data loss.
- Review generated SQL: ORMs may emit a rename as drop + add.
- Test on a disposable or copied database, never production.

## Output

1. The migration (in the project's tool format) and its rollback.
2. Risk assessment: data loss, locking, downtime, compatibility with running code.
3. Deployment order relative to application code.
4. Verification steps.
