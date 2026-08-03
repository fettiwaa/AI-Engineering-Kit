# Node.js Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/typescript.md`. Applies to Node.js projects.

## 1. Runtime

- Target the current LTS of Node.js.
- Prefer ES modules where feasible.

## 2. Process

- Never block the event loop with synchronous I/O in request handlers.
- Handle `uncaughtException` and `unhandledRejection`.

See `core/ERROR_HANDLING.md`.
