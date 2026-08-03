# Drizzle Framework Pack

> Extends `core/AGENTS.md`. Applies to Drizzle ORM projects.

## 1. Schema

- Define schema in TypeScript; generate migrations with `drizzle-kit`.
- Commit generated SQL migration files.

## 2. Safe Queries

- Use parameterized queries (`sql` tag or prepared statements).
- Never use Drizzle's `run` with string interpolation.

See `core/DATABASE.md` and `core/SECURITY.md`.
