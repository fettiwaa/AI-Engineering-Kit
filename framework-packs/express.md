# Express Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/nodejs.md`. Applies to Express projects.

## 1. Verify Before Finishing

- Cover new routes with HTTP-level tests (e.g. supertest), including the error paths.

## 2. Structure

- One router per resource; handlers parse the request, call a service, and shape the
  response. No business logic or queries in handlers.
- One centralized error middleware (four arguments), registered last.
- Express 5 forwards rejected promises to the error middleware; Express 4 does not, so wrap
  async handlers there. Check the installed version.

## 3. Input and Security

- Validate `params`, `query`, and `body` with a schema at the edge of every route.
- Set a body size limit (`express.json({ limit })`).
- Use `helmet`, rate limiting on public routes, and an explicit CORS allowlist (never `*` with
  credentials). Disable `x-powered-by`.
- Never return raw error objects or stack traces to clients.

See `core/API.md` §Errors and `core/ERROR_HANDLING.md` §Propagation.
