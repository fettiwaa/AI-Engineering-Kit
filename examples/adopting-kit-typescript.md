# Example: Adopting the Kit in a New TypeScript Project

This example demonstrates wiring a new TypeScript project to the AI Engineering Kit via
the Kilo adapter and the TypeScript framework pack.

## Structure

```
my-project/
├── AGENTS.md          # Project adapter (Kilo)
├── README.md          # Follows templates/readme.md
├── package.json
├── tsconfig.json
└── src/
```

## AGENTS.md

```markdown
# AGENTS.md

@import ../AI-Engineering-Kit/core/AGENTS.md
@import ../AI-Engineering-Kit/framework-packs/typescript.md

# Project-specific
- Lint with ESLint flat config.
- Run `tsc --noEmit` before every commit.
```

## How the layers resolve

1. **Global** (`kilo/AGENTS.md`) — personal preferences like "ask before installing deps".
2. **Project** (`AGENTS.md`) — imports the canonical core + TypeScript pack.
3. This project overrides only what is unique (lint command).
