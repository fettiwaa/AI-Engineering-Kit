# Prisma Framework Pack

> Extends `core/AGENTS.md`. Applies to Prisma ORM projects.

## 1. Verify Before Finishing

- After editing `schema.prisma`: `prisma format`, `prisma validate`, `prisma generate`.

## 2. Migrations

- Create migrations with `prisma migrate dev --name <change>` and commit the generated SQL.
  Review it: renames can be generated as drop + add, which loses data.
- Apply in CI/production with `prisma migrate deploy` only.
- Never run `prisma migrate reset`, or `prisma db push --accept-data-loss`, against a shared or
  production database. `db push` is for throwaway prototypes.

## 3. Queries

- Reuse a single `PrismaClient` instance (a module singleton; guard against hot-reload
  duplicates in dev).
- Use `select` / `include` deliberately; avoid N+1 loops (batch with `in` filters or relations).
- Use `$transaction` for multi-step writes.
- Raw SQL only through tagged `$queryRaw` / `$executeRaw` (parameterized). Never pass user input
  to `$queryRawUnsafe` / `$executeRawUnsafe`.

See `core/DATABASE.md` §Migrations and `core/DATABASE.md` §Queries.
