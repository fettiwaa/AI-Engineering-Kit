# TypeScript Framework Pack

> Extends `core/AGENTS.md`. Applies to TypeScript projects.

## 1. Verify Before Finishing

- Type-check with the project's script, or `tsc --noEmit`. Zero new errors.
- Run the project's lint and test scripts; report their actual output.

## 2. Compiler

- Keep `strict: true`. Never loosen `tsconfig.json` to make an error go away.
- Prefer `noUncheckedIndexedAccess` in new projects.
- Module resolution: `bundler` for bundled apps, `nodenext` for Node libraries and services.

## 3. Types

- No `any`. Use `unknown` and narrow, or write the real type.
- No non-null assertions (`!`) or `as` casts to silence the compiler; fix the type flow.
- Validate external data (HTTP bodies, env, JSON files) at the boundary with a schema
  (e.g. zod) and derive the static type from it.
- Use `import type` for type-only imports; use `satisfies` to check literals without widening.
- Prefer union literal types or `as const` objects over `enum` unless the project uses enums.

## 4. Naming

- Types, interfaces, classes: `PascalCase`, no `I` prefix.
- Variables and functions: `camelCase`. Module-level constants: `UPPER_SNAKE_CASE`.

See `core/CODING_STANDARDS.md` §Naming.
