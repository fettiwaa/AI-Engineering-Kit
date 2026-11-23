# Node.js Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/javascript.md` or `framework-packs/typescript.md`.
> Applies to Node.js services, CLIs, and libraries.

## 1. Verify Before Finishing

- Install with `npm ci` (or the lockfile-respecting equivalent); run lint, type check, tests.

## 2. Runtime

- Target the Node LTS pinned by the project (`engines`, `.nvmrc`, or `.node-version`).
- Import built-ins with the `node:` prefix (`node:fs/promises`).
- No synchronous I/O (`fs.*Sync`) on request paths.
- Set timeouts on every outbound call (e.g. `AbortSignal.timeout(ms)`).

## 3. Configuration

- Read and validate environment variables once at startup; exit with a clear message if any
  are missing. Never log their values.

## 4. Reliability

- Handle `SIGTERM`: stop accepting work, finish in-flight requests, close pools, then exit.
- Never leave a promise rejection unhandled; treat `unhandledRejection` as a crash.
- Run containers as a non-root user.

See `core/ERROR_HANDLING.md` and `core/DEPENDENCIES.md` §Management.
