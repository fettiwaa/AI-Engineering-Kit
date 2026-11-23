# Svelte Framework Pack

> Extends `core/AGENTS.md`. Applies to Svelte / SvelteKit projects.

## 1. Verify Before Finishing

- Run `svelte-check`, the project lint, and tests (Vitest / Playwright).

## 2. Components

- Check the Svelte version first. In Svelte 5 use runes (`$state`, `$derived`, `$effect`,
  `$props`); do not mix them with legacy `let`/`$:` reactivity in the same component.
- Use `$derived` for computed values; `$effect` only for side effects that need cleanup.
- Keyed `{#each}` blocks for lists that change. Never use `{@html}` with untrusted content.

## 3. SvelteKit

- Load secrets and privileged data only in server files (`+page.server.ts`,
  `+layout.server.ts`, `+server.ts`).
- Import secrets from `$env/static/private` or `$env/dynamic/private`, never from the
  public modules.
- Form actions and endpoints validate input and check authorization.

See `core/CODING_STANDARDS.md` and `core/API.md` §Security.
