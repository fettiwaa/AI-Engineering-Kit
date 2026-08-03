# Express Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/nodejs.md`. Applies to Express projects.

## 1. Structure

- Split routes, middleware, and controllers into focused modules.
- Use `express-async-handler` (or equivalent) to propagate async errors.

## 2. Middleware

- Register a structured error handler last.
- Validate request input with a schema library (e.g. Zod, Joi).

See `core/API.md` and `core/ERROR_HANDLING.md`.
