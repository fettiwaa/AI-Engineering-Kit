# Laravel Framework Pack

> Extends `core/AGENTS.md`. Applies to Laravel projects.

## 1. Verify Before Finishing

- `php artisan test`, and the project's formatter (`./vendor/bin/pint --test`) and static
  analysis (e.g. Larastan) if configured.

## 2. Data

- Every schema change is a migration (`php artisan make:migration`). Never run
  `migrate:fresh`, `migrate:reset`, or `db:wipe` outside a disposable local database.
- Protect models from mass assignment with `$fillable` (or explicit `$guarded`).
- Eager load relations (`with()`) to avoid N+1; enable `Model::preventLazyLoading()` outside
  production.
- Raw queries use bindings (`DB::select('... where id = ?', [$id])`), never interpolation.

## 3. Requests and Auth

- Validate with Form Request classes; authorize with policies or gates, not inline checks.

## 4. Config and Output

- Call `env()` only inside `config/` files; elsewhere use `config()` (config caching breaks
  direct `env()` calls).
- Blade `{{ }}` escapes output; use `{!! !!}` only for trusted, sanitized HTML.
- Move slow work to queued jobs.

See `core/DATABASE.md` and `core/SECURITY.md`.
