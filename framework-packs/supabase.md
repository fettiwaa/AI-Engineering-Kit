# Supabase Framework Pack

> Extends `core/AGENTS.md`. Applies to Supabase projects.

## 1. Verify Before Finishing

- Develop against the local stack (`supabase start`); test migrations and policies there.
- Regenerate types after schema changes (`supabase gen types typescript`).

## 2. Row Level Security

- Enable RLS on every table in an exposed schema, in the same migration that creates it.
- Write explicit policies per operation using `auth.uid()`; never add a blanket `using (true)`
  policy to user data.
- Test policies as the `anon` and `authenticated` roles, not as the service role.

## 3. Keys

- The anon/publishable key is public and safe only because of RLS.
- The `service_role` / secret key bypasses RLS: server-side only, never in client code,
  never logged, never committed.

## 4. Schema Changes

- Every change is a migration in `supabase/migrations/` (`supabase migration new`). Never edit
  the production schema in the dashboard.
- Never run `supabase db reset` against a remote database.

See `core/DATABASE.md` §Migrations and `core/SECURITY.md`.
