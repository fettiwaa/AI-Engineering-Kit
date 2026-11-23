# React Framework Pack

> Extends `core/AGENTS.md` and `framework-packs/typescript.md`. Applies to React projects.

## 1. Verify Before Finishing

- Lint includes `eslint-plugin-react-hooks`; fix every hooks warning, do not suppress it.
- Run component tests (React Testing Library) and the type check.

## 2. Components

- Function components only. Prefer named exports, unless the framework requires a default
  export (e.g. Next.js pages).
- Keep components small; extract when a component handles more than one concern.
- Use semantic HTML (`button`, `label`, `nav`) before ARIA; every interactive element works
  with the keyboard.

## 3. State and Effects

- Derive values during render instead of copying props into state.
- `useEffect` is for synchronizing with external systems only, not for data transformation or
  event handling. Every effect that subscribes must clean up.
- List keys are stable IDs, never array indexes for reorderable lists.
- Follow the Rules of Hooks; custom hooks start with `use`.

## 4. Safety

- Never pass untrusted content to `dangerouslySetInnerHTML`.

## 5. Tests

- Query by role and accessible name (`getByRole`), not by test IDs or class names.

See `core/CODING_STANDARDS.md` §File Organization and `core/ACCESSIBILITY.md` §Principles.
