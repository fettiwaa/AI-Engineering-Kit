# Code Review

> AI agents auto-review generated code against this checklist. Referenced by
> `core/AGENTS.md`. See also `checklists/code-review.md` and `prompts/code-review.md`.

## 1. Auto-Review Checklist

Before finishing a change, the agent must self-review against:

- [ ] **Duplicate logic** — no duplicated behavior that should be shared.
- [ ] **Dead code** — no unused functions, classes, or branches.
- [ ] **Unused imports** — none present.
- [ ] **Magic numbers/strings** — extracted into named constants.
- [ ] **Large functions** — none exceed reasonable length; consider splitting.
- [ ] **Large components** — none are monolithic; consider splitting.
- [ ] **Large files** — none exceed a focused size; consider splitting.
- [ ] **Poor naming** — names are descriptive and domain-aligned.
- [ ] **Security issues** — no secrets exposed; no injection vectors.
- [ ] **Performance issues** — no obvious regressions; only necessary files read.
- [ ] **Accessibility** — keyboard nav and screen-reader considerations (if UI is in scope).
- [ ] **Missing tests** — behavior is covered; regression test for bugs.
- [ ] **Style inconsistencies** — matches the active framework pack and lint config.

## 2. Improvement Loop

- Suggest concrete, prioritized improvements.
- Do not "fix" unrelated issues (avoid drive-by changes).
- Re-run the checklist after applying a suggestion.

## 3. Escalation

If a smell cannot be resolved without an architectural change, escalate to the planning
workflow (`core/PLANNING.md`) — **stop and seek approval**.
