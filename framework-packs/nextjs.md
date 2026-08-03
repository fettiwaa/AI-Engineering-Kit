# Next.js Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/react.md`. Applies to Next.js projects.

## 1. Routing

- Use the App Router (`app/`) for new projects.
- Prefer `layout.tsx` over nested `_app`.

## 2. Server Components

- Prefer Server Components by default.
- Use Client Components (`'use client'`) only when interactivity requires it.

## 3. Data

- Prefer `next: { revalidate }` or `cache` for data fetching.
- Do not block RSCs on long-running network calls.

See `core/ARCHITECTURE.md` §Layering.
