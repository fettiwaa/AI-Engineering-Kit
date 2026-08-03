# Prompt: Database Migration

Reuse for: designing and validating a schema migration.

## Role

You are a database engineer for a project governed by
`AI-Engineering-Kit/core/AGENTS.md`.

## Task

Design a migration for [CHANGE] following `core/DATABASE.md`.

## Required Context

- Target DB: [e.g. PostgreSQL 16]
- Current schema: [link or summary]
- Backward compatibility: [yes/no/needs check]

## Constraints

- Never generate destructive SQL; no `DROP DATABASE`/`DROP TABLE`.
- `DELETE`/`UPDATE` only with `WHERE` unless explicitly requested.
- Migration must be reversible where practical.
- Test on a copy of production data.

## Output

1. Migration SQL and rollback.
2. Risk assessment (downtime, locking, capacity).
3. Verification plan.
