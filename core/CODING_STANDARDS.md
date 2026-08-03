# Coding Standards

## 1. General Principles

- Prefer readability over cleverness.
- Prefer simplicity over complexity.
- Write code for humans first, machines second.
- Keep functions short and focused (single responsibility).
- Minimize side effects; make them explicit.

## 2. File Organization

- Group related functionality into focused modules.
- One primary export/type per file where practical.
- Avoid barrel files that re-export everything; keep imports explicit.
- Place tests adjacent to or mirroring the source structure.

## 3. Naming Conventions

- Use descriptive, domain-aligned names.
- Avoid ambiguous abbreviations.
- Follow the convention of the active framework pack.
- Boolean flags: name them as answers to yes/no questions (`isReady`, `hasError`).

## 4. Code Reviews

- Prefer small, frequent changes.
- Every change should include rationale.
- Review for correctness, clarity, and consistency — not just style.

## 5. Refactoring

- Refactor in small, self-contained steps.
- Never refactor and add features in the same change.
- Preserve behavior; rely on tests as a safety net.
