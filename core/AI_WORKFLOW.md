# AI Workflow

## 1. Planning

- Break work into small, incremental steps.
- Write a plan before implementing; record it in an issue or ADR.
- Seek review before large refactors.

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
- Use a structured checklist (see `checklists/`).

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
