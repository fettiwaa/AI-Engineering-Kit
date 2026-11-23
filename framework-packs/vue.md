# Vue Framework Pack

> Extends `core/AGENTS.md`. Applies to Vue 3 projects.

## 1. Verify Before Finishing

- Run `vue-tsc --noEmit` (TypeScript projects), the project lint (`eslint-plugin-vue`), and
  tests (Vitest + Vue Test Utils).

## 2. Components

- Composition API with `<script setup>` for new components; follow the project if it uses the
  Options API.
- Type props and emits with `defineProps` / `defineEmits`.
- Multi-word `PascalCase` component names.
- Props down, events up: never mutate a prop; emit an event or use `v-model`.

## 3. Reactivity and Templates

- Use `computed` for derived state, `watch` only for side effects.
- Every `v-for` has a stable `:key`. Never put `v-if` and `v-for` on the same element.
- Never use `v-html` with untrusted content.

## 4. State

- Use the project's store (Pinia for new projects); keep component-local state local.

See `core/CODING_STANDARDS.md`.
