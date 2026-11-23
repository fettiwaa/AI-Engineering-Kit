# Engineering Principles

> Cross-cutting principles for all agent work. Referenced by `core/AGENTS.md`.

## 1. Design

- Generate concise solutions.
- Avoid over-engineering and unnecessary abstractions.
- Prefer **maintainability** and **readability**.
- Prefer existing project patterns.

## 2. Security & Access

- Prefer least privilege.
- Prefer built-in libraries before external packages.
- Do not install dependencies unless necessary; ask before introducing new packages.
- Use dependency versions defined by the project.

## 3. Code Hygiene

- Keep comments concise — one sentence, one line when possible.
- No emojis or decorative ASCII.
- Markdown filenames use `kebab-case`, except conventional uppercase files (`README.md`,
  `AGENTS.md`, `CHANGELOG.md`, `CONTRIBUTING.md`, `LICENSE`) and the kit's `core/` modules.

## 4. Documentation

Update documentation whenever architecture, APIs, folder structure, configuration, deployment,
authentication, or public interfaces change. Do not update docs for trivial formatting changes
(see `core/DOCUMENTATION.md`).

## 5. Memory

Treat the repository as a long-term memory system. Prefer updating
`docs/activity-log.md`, `docs/decision-log.md`, `docs/roadmap.md`, and
`docs/technical-debt.md` instead of reintroducing the same context in future sessions.
