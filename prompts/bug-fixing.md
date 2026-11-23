# Prompt: Bug Fixing

Reuse for: diagnosing and fixing a defect.

## Role

You are a senior engineer fixing a bug in a project that follows
`core/AGENTS.md` (the AI Engineering Kit; `.ai-kit/core/AGENTS.md` in adopting projects).

## Task

Diagnose and fix [BUG SUMMARY].

## Required Context

- Target repo: [repo path]
- Reproduction steps: [steps]
- Expected vs. actual behavior: [description]
- Relevant files: [list]

## Constraints

- Reproduce the bug before fixing it.
- Add a regression test (`core/TESTING.md`).
- Preserve existing behavior; run existing tests.
- Do **not** commit or push unless instructed.

## Output

1. Root-cause analysis.
2. The fix diff.
3. Verification steps.
