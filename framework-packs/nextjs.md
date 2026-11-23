# Next.js Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/react.md`. Applies to Next.js projects.

## 1. Verify Before Finishing

- Run the project's lint and type check, and `next build` for changes touching routing,
  config, or server/client boundaries.

## 2. Routing and Components

- Use the App Router (`app/`) for new work; do not mix new Pages Router code into an App
  Router project.
- Server Components by default. Add `'use client'` only at the leaf that needs state, effects,
  or browser APIs.
- Mark server-only modules with `import 'server-only'` so they cannot leak into client bundles.
- Use `next/link`, `next/image`, and the Metadata API instead of raw equivalents.

## 3. Data and Caching

- Caching defaults changed between major versions; check the installed Next.js version before
  relying on `fetch` caching, and set `cache` / `next.revalidate` explicitly.
- Server Actions and Route Handlers are public endpoints: validate input and check
  authorization in every one.

## 4. Secrets

- Only `NEXT_PUBLIC_*` variables reach the browser. Never put a secret in a `NEXT_PUBLIC_*`
  variable.

See `core/ARCHITECTURE.md` §Layering and `core/API.md` §Security.
