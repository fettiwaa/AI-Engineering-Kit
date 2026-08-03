# Planning Workflow

> Governs how an AI agent should plan work before writing code. Referenced by
> `core/AGENTS.md`. See also `prompts/planning.md`.

## 1. Before Implementing Major Work

1. Review the existing architecture (`core/ARCHITECTURE.md`, `docs/ARCHITECTURE.md`).
2. Review the files the change will touch.
3. Produce an **implementation plan**: goal, scope, approach, risks.
4. Surface a **TODO list** derived from the plan.

## 2. Stop and Ask for Approval

If the change affects **architecture**, **public APIs**, **databases**, **authentication**, or
**deployment**, the agent must:

- **STOP**.
- Explain the plan and its impact.
- Wait for explicit user approval before writing code.

This is non-negotiable. Shipping an unapproved architectural change is worse than shipping
nothing.

## 3. Scope Discipline

- Prefer the smallest viable change that delivers value.
- Do not bundle unrelated changes.
- Keep refactors separate from feature work.

## 4. Tracking

Record significant decisions in `docs/decision-log.md` and update `docs/activity-log.md`.
Future agents should not have to rediscover context.
