# Roadmap

> Planned capabilities, ordered by priority. Each item links to its tracking issue/ADR when
> available.
>
> See `templates/roadmap-item.md` for the item format.

## Near term (V1.2)

- [ ] Flesh out stack-specific rules in every `framework-packs/*.md` (currently skeletal).
- [ ] Add at least one worked example per major framework (TypeScript, React, Next.js, Node).
- [ ] Add a link-integrity check to `scripts/validate-kit.ps1` and run it in CI.
- [ ] Add `CONTRIBUTING.md` pointer to the activity/decision logs so contributors maintain them.

## Medium term (V1.3)

- [ ] Add `.kilo/agent` profiles for common AI agent roles (architect, reviewer, migrator).
- [ ] Add Kilo commands (`/.kilo/command/`) that wrap reusable prompts as chat-slash commands.
- [ ] Publish the kit as a GitHub template repository.

## Long term

- [ ] Translate canonical docs to support i18n (see `core/DOCUMENTATION.md` §Localization).
- [ ] Add JSON Schema for framework-pack metadata to enable tooling.
