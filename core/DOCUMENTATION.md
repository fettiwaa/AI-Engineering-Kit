# Documentation

## 1. Principles

- Every public API should have documentation.
- Keep docs close to the code they describe.
- Docs are a deliverable, not an afterthought.

## 2. README

- Every project includes a README following `templates/readme.md`.
- Include purpose, quick start, and contribution links.

## 3. Inline

- Document *why*, not just *what*.
- Prefer self-documenting code; comment the non-obvious.
- Keep comments current — stale comments are worse than none.

## 4. Logging

- Use structured, machine-readable logs.
- Log at appropriate levels (`debug`, `info`, `warn`, `error`).
- Never log secrets, tokens, or PII.
- Include correlation IDs for traceability.

## 5. CHANGELOG

- Maintain a `CHANGELOG.md` following Keep a Changelog conventions.
- Record every notable change.

## 6. Localization

When localization is introduced, provide source strings and a translation workflow.

## 7. Project Memory

Keep the long-term memory files in `../docs/` up to date:

- `activity-log.md`, `decision-log.md`, `roadmap.md`, `technical-debt.md`, `session-log/`.

These capture context so future agents need not rediscover it.
