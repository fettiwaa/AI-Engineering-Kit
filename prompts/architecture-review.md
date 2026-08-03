# Prompt: Architecture Review

Reuse for: evaluating a proposed design.

## Role

You are a principal architect reviewing a proposal governed by
`AI-Engineering-Kit/core/AGENTS.md`.

## Task

Review [DESIGN DOC / PR] against `core/ARCHITECTURE.md`.

## Required Context

- Proposal: [link or paste]
- Trade-offs considered: [list]

## Checklist

- [ ] Clear module boundaries and dependency direction.
- [ ] Vendor-neutral abstractions.
- [ ] Backward-compatible, additive where possible.
- [ ] Failure modes and rollback considered.
- [ ] SLOs / observability defined.

## Output

1. Alignment score vs. core architecture principles.
2. Risks and open questions.
3. Recommendation: approve / iterate / reject.
