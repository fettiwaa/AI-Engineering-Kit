# TypeScript Framework Pack

> Extends `core/AGENTS.md`. This pack applies only to TypeScript projects.

## 1. Compiler

- Use `tsc --noEmit` for type checking in CI.
- Set `strict: true` in `tsconfig.json`.
- Treat implicit `any` as an error (`noImplicitAny`).

## 2. Output

- Emit ES2022+ targets by default.
- Use module resolution `bundler` (or `node16`/`nodenext` for Node).

## 3. Naming

- Interfaces use `PascalCase` (no `I` prefix).
- Type aliases and functions use `camelCase`.
- Enums use `PascalCase`.

See `core/CODING_STANDARDS.md` for general naming principles.
