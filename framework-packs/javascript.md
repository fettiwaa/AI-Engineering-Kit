# JavaScript Framework Pack

> Extends `core/AGENTS.md`. Applies to JavaScript projects without TypeScript.

## 1. Verify Before Finishing

- Run the project's lint (ESLint, flat config `eslint.config.js`) and test scripts.

## 2. Language

- Use ES modules unless `package.json` says `"type": "commonjs"`; never mix styles in a file.
- `const` by default, `let` when reassigned, never `var`. Always `===` / `!==`.
- Use `async`/`await`. Every promise is awaited, returned, or explicitly handled; no floating
  promises.
- Never use `eval`, `new Function`, or `with`.

## 3. Type Safety Without TypeScript

- Document public functions with JSDoc types.
- Consider `// @ts-check` (or `checkJs`) to get editor type errors for free.
- Validate external input at boundaries; do not trust shapes of parsed JSON.

## 4. Style

- Prefer small pure functions and named exports.
- No implicit globals; no mutation of function arguments.

See `core/CODING_STANDARDS.md`.
