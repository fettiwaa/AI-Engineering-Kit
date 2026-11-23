# Contributing

Thank you for your interest in contributing to the AI Engineering Kit.

## 1. Values

- **Vendor neutral**: never optimize for a single AI coding agent.
- **Modular**: one responsibility per file.
- **No duplication**: define a rule once and reference it.
- **Production ready**: assume a regulated context.
- **Verifiable**: prefer rules an agent can check (a command, a pattern) over aspirations.

## 2. How to Contribute

1. Fork and clone the repository.
2. Create a feature branch: `git checkout -b feat/my-change`.
3. Make your change (see the standards below).
4. Run `./scripts/validate-kit.ps1` and fix every reported problem.
5. Update `CHANGELOG.md` under `[Unreleased]`, and `docs/activity-log.md` for significant work.
6. Open a pull request using `templates/pull-request.md`.

## 3. Standards

- **Core modules** (`core/`): each new module must be linked from `core/AGENTS.md`. If it adds
  an always-on rule, add a one-line summary to `core/ESSENTIALS.md` (6 KB budget).
- **Framework packs**: start with `> Extends core/AGENTS.md` (plus any parent pack), include a
  "Verify Before Finishing" section, and keep each rule concrete and checkable. Packs are
  inlined into projects, so keep them under about 2 KB.
- **Adapters**: document how the tool actually loads instruction files, with a link to its
  official docs. Adapters add no rules.
- New modules, packs, or adapters, and any change to the distribution model, need a
  decision-log entry (`templates/decision-log-entry.md`) or an ADR.
- Do not auto-commit, auto-push, or rewrite history without maintainer approval.

## 4. Review Process

- Pull requests require review from at least one maintainer.
- CI (`.github/workflows/validate.yml`) must pass: the validator on Linux and Windows, plus an
  adoption smoke test.

## 5. Responsible Disclosure

Report security issues privately through GitHub's private vulnerability reporting (the
repository's **Security** tab), not in a public issue. Do not post secrets, credentials, or
exploit details publicly.

## 6. Code of Conduct

Be respectful and constructive. We follow the [Contributor Covenant](https://www.contributor-covenant.org/).
