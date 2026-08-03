# Laravel Framework Pack

> Extends `core/AGENTS.md`. Applies to Laravel projects.

## 1. Artisan

- Use migrations for schema changes; never edit migrations after they land.
- Prefer model factories for test data.

## 2. Eloquent

- Use mass assignment `$fillable`/`$guarded` carefully.
- Add queries via query scopes.

See `core/DATABASE.md`.
