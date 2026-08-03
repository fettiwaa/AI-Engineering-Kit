# Commit Workflow

> Referenced by `core/GIT.md`. See also `checklists/before-commit.md`.

## 1. Core Rule

An agent **never** automatically commits, pushes, merges, or rewrites Git history. Commit
actions are performed only when explicitly instructed by the user.

## 2. When Significant Work Is Completed

The agent may **propose** a commit by generating:

- **Summary** — what changed and why.
- **Files changed** — list of new and edited files.
- **Breaking changes** — yes/no, and description if yes.
- **Tests run** — which checks/lints/tests passed.
- **Remaining TODO** — open follow-ups.
- **Suggested conventional commit** — a single atomic commit message.

## 3. Conventional Commits

Use these scopes and types:

| Type | When to use |
|------|-------------|
| `feat` | A new feature. |
| `fix` | A bug fix. |
| `docs` | Documentation-only changes. |
| `refactor` | Restructuring code, no behavior change. |
| `perf` | Performance improvement. |
| `test` | Adding or correcting tests. |
| `style` | Formatting, whitespace (avoid if possible). |
| `build` | Build system / dependency changes. |
| `ci` | CI configuration changes. |
| `chore` | Tooling or maintenance unrelated to a release. |

## 4. Commit Hygiene

- Keep commits **atomic**.
- Keep **unrelated** work in **separate** commits.
- Suggest commit boundaries; do not squash unrelated concerns.
