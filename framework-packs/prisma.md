# Prisma Framework Pack

> Extends `core/AGENTS.md`. Applies to Prisma projects.

## 1. Schema

- Version the Prisma schema (`schema.prisma`).
- Generate and commit client types.

## 2. Migrations

- Use `prisma migrate dev` locally; `prisma migrate deploy` in CI.
- Never run `prisma db push` on production.

See `core/DATABASE.md`.
