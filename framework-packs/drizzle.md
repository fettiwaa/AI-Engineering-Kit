# Drizzle Framework Pack

> Extends `core/AGENTS.md`. Applies to Drizzle ORM projects.

## 1. Verify Before Finishing

- Type check the project; run `drizzle-kit check` when migrations change.

## 2. Migrations

- Generate versioned migrations with `drizzle-kit generate` and commit them; apply with
  `drizzle-kit migrate` (or the runtime migrator).
- Read the generated SQL before applying: a rename can be emitted as drop + create.
- `drizzle-kit push` is for local prototyping only, never shared or production databases.
- `drizzle.config.ts` reads credentials from the environment, never literals.

## 3. Queries

- Use the query builder or the `sql` template tag (parameterized). Never pass user input to
  `sql.raw`.
- Wrap multi-step writes in `db.transaction`.
- Derive row types with `$inferSelect` / `$inferInsert` instead of hand-written duplicates.

See `core/DATABASE.md` and `core/SECURITY.md`.
