# NestJS Framework Pack

> Extends `core/AGENTS.md`, `framework-packs/nodejs.md`, and `framework-packs/typescript.md`.
> Applies to NestJS projects.

## 1. Verify Before Finishing

- Run `npm run build`, lint, and unit tests; add e2e tests for new endpoints.

## 2. Structure

- One module per feature. Controllers handle HTTP only; logic lives in providers (services).
- Constructor injection everywhere. Treat `forwardRef` as a sign of a circular dependency to
  remove, not a fix.
- Generate with the Nest CLI to match project layout.

## 3. Validation and Errors

- Every input is a DTO with `class-validator` rules; keep a global
  `ValidationPipe({ whitelist: true, forbidNonWhitelisted: true, transform: true })`.
- Throw Nest HTTP exceptions or map domain errors in an exception filter; never leak internals.

## 4. Security and Config

- Protect routes with guards; default-deny and opt routes out explicitly.
- Read configuration through `ConfigModule` / `ConfigService` with schema validation.

## 5. Tests

- Unit-test providers with `Test.createTestingModule` and mocked dependencies.

See `core/ARCHITECTURE.md` §Layering.
