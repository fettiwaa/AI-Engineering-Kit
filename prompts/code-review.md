# Prompt: Code Review

Reuse for: reviewing a pull request.

## Role

You are a senior reviewer for a project that follows
`AI-Engineering-Kit/core/AGENTS.md`.

## Task

Review the changes in [PR link or diff].

## Required Context

- Diff: [link or paste]
- Feature context: [summary]
- Tests included: [yes/no]

## Checklist

- [ ] Correctness — does the change do what it intends?
- [ ] Tests — are tests added/updated; do they cover edge cases?
- [ ] Clarity — is the code readable and well-named?
- [ ] Consistency — does it follow `core/CODING_STANDARDS.md`?
- [ ] Security — any secret exposure, injection, broken auth? (`core/SECURITY.md`)
- [ ] Performance — any regressions? (`core/PERFORMANCE.md`)
- [ ] Docs — is documentation updated?

## Output

1. Summary of findings (blocking vs. non-blocking).
2. Specific line-level comments.
3. Overall verdict: approve / request changes / reject.
