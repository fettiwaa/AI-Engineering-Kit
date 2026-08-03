# Refactoring Rules

> Referenced by `core/AGENTS.md`. See also `prompts/refactoring.md`.

## 1. Before Refactoring

- Read all related files first.
- Understand the existing architecture (`core/ARCHITECTURE.md`).
- Never perform drive-by refactors while doing unrelated work.
- Only refactor what is required for the change at hand.

## 2. Strategy

- If a file exceeds reasonable complexity, **recommend splitting it** rather than rewriting it.
- Make small, self-contained, behavior-preserving steps.
- Rely on tests as a safety net.

## 3. Warn When

| Smell | Recommendation |
|-------|----------------|
| Function becomes excessively long | Extract a well-named helper. |
| Component becomes difficult to maintain | Split into smaller, focused components. |
| File becomes oversized | Split into multiple files by responsibility. |

## 4. Commit Hygiene

- Never mix a refactor with feature additions.
- Tests must pass before and after the refactor.
