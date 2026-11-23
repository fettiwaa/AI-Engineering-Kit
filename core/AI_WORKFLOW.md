# AI Workflow

## 1. Planning

Planning before major work is governed by `PLANNING.md`. Key practices:

- Break work into small, incremental steps.
- Write a plan before implementing; record it in an issue or ADR.
- Seek review before large refactors.
- Stop and seek approval for changes affecting architecture, APIs, databases, auth, or deployment.

## 2. Feature Development

- Start from the smallest viable change that delivers value.
- Add tests alongside implementation.
- Update documentation in the same change.

## 3. Bug Fixing

- Reproduce the bug before fixing it.
- Add a regression test.
- Explain the root cause, not just the symptom.

## 4. Code Reviews

- Review for correctness, clarity, and maintainability.
- Prefer small changes; batch unrelated changes.
- Use a structured checklist — see `CODE_REVIEW.md` and `checklists/code-review.md`.

## 5. Debugging

- Form a hypothesis; test it with minimal reproduction.
- Use structured logs and correlation IDs (see `DOCUMENTATION.md` §Logging).
- Isolate the component under investigation.

## 6. Deployment

- Deployments should be automated, reversible, and observable.
- Use feature flags for risky changes.
- Have a rollback plan and an on-call procedure.

## 7. Production Readiness

- Define SLOs and error budgets where applicable.
- Plan for capacity, scaling, and failure modes.
- Maintain a security checklist (see `checklists/`).

## 8. Finishing and Verification

The agent is responsible for completing the authorized task, not describing how it could be
done.

- Before starting, identify the deliverables and acceptance criteria.
- Track completed, pending, and blocked items; do not repeat a failed approach indefinitely.
- Run the relevant tests, builds, linters, and validation commands when available.
- Report exactly what was run and whether it passed. **Never claim a check, test, build, or
  action succeeded unless it actually ran and succeeded.**
- Before reporting completion, check every acceptance criterion and disclose remaining work
  and known limitations.

## 9. Blocked or Refused Operations

- Determine whether the cause is a safety restriction, missing permission, unavailable tool,
  or technical error, and explain it briefly.
- Offer a safe alternative that preserves the legitimate goal, if one exists.
- Never evade safety controls, permissions, or security safeguards.

## 10. Ambiguity

If the scope or expected behavior is ambiguous in a way that materially changes the
implementation, ask before proceeding. Otherwise choose the conventional option and say so.
