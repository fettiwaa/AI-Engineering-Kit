# Checklist: Code Review (AI Auto-Review)

Follow `core/CODE_REVIEW.md` and `prompts/code-review.md`.

## Duplicate Logic

- [ ] No duplicated behavior that should be shared.

## Dead Code

- [ ] No unused functions, classes, or commented-out blocks.
- [ ] No unreachable branches.

## Unused Imports / Variables

- [ ] No unused imports or variables (enforced by lint).

## Magic Numbers / Strings

- [ ] Extracted into named, documented constants where unclear.

## Large Functions / Components / Files

- [ ] Functions are short and focused.
- [ ] Components are single-purpose.
- [ ] Files are cohesive and not oversized.

## Naming

- [ ] Names are descriptive and domain-aligned.
- [ ] Booleans read as yes/no questions (`isReady`).

## Security

- [ ] No secrets exposed or logged (`core/SECURITY.md`, `core/AI_RESTRICTIONS.md`).
- [ ] Input validated/sanitized; no injection vectors.
- [ ] Auth/authz not weakened.

## Performance

- [ ] No obvious regressions.
- [ ] Only necessary files read; no whole-repo scans.

## Accessibility (if UI in scope)

- [ ] Keyboard navigation works.
- [ ] No color-only indicators.
- [ ] Text alternatives present.

## Tests

- [ ] Behavior is covered.
- [ ] A regression test exists for bug fixes.

## Style & Consistency

- [ ] Matches the active framework pack.
- [ ] Passes lint/type checks.
