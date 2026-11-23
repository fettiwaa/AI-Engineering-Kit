# Angular Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/typescript.md`. Applies to Angular projects.

## 1. Verify Before Finishing

- Run `ng build`, `ng test`, and `ng lint` (or the project's equivalent scripts).

## 2. Components

- Standalone components for new code; generate with the Angular CLI to match conventions.
- Prefer `ChangeDetectionStrategy.OnPush` and signals for component state.
- Use built-in control flow (`@if`, `@for` with `track`) in new templates.
- Inject dependencies with `inject()` or constructor injection, following the project.

## 3. RxJS

- Every subscription ends: use the `async` pipe or `takeUntilDestroyed()`; no manual
  subscriptions left open.
- Do not nest `subscribe` calls; compose with operators.

## 4. Safety and Structure

- Never call `bypassSecurityTrust*` on untrusted content; never touch the DOM directly.
- Use typed reactive forms. Lazy-load feature routes.

See `core/CODING_STANDARDS.md` and `core/ARCHITECTURE.md` §Module Boundaries.
