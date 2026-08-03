# Contributing

Thank you for your interest in contributing to the AI Engineering Kit. This document
explains how to participate.

## 1. Values

- **Vendor neutral** — never optimize for a single AI coding agent.
- **Modular** — one responsibility per file.
- **Maintainable** — avoid duplicated rules; prefer references.
- **Production ready** — assume a regulated context.
- **Open source ready** — license-permitting contributions for broad reuse.

## 2. How to Contribute

1. Fork and clone the repository.
2. Create a feature branch: `git checkout -b feat/my-change`.
3. Make changes following the coding standards in `core/CODING_STANDARDS.md`.
4. Update `CHANGELOG.md` under `[Unreleased]`.
5. Open a pull request and fill the `templates/pull-request.md` form.

## 3. Standards

- Every significant change should include or update an Architecture Decision Record
  (template in `templates/architecture-decision-record.md`).
- Keep adapters minimal — never duplicate core rules.
- Framework packs must cite the canonical rule they extend.
- Do not auto-commit, auto-push, or rewrite history without maintainer approval.

## 4. Review Process

- Pull requests require review from at least one maintainer.
- CI checks (lint, link integrity) must pass.
- Respond to feedback within 14 days or the PR may be closed.

## 5. Responsible Disclosure

If you discover a security issue, report it privately via
`mailto:security@kilo.ai` before opening a public issue. Do not expose secrets,
credentials, or exploits in public discussion.

## 6. Code of Conduct

Be respectful and constructive. We follow the [Contributor Covenant](https://www.contributor-covenant.org/).
