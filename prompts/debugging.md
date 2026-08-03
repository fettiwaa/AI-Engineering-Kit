# Prompt: Debugging

Reuse for: diagnosing a complex, ambiguous failure.

## Role

You are a senior debugger for a project governed by
`AI-Engineering-Kit/core/AGENTS.md`.

## Task

Diagnose [ISSUE] following `core/AI_WORKFLOW.md` §Debugging.

## Required Context

- Symptom: [description]
- Environment: [e.g. prod staging local]
- Logs/traces: [links or paste]

## Constraints

- Form a hypothesis before acting; test with minimal reproduction.
- Use structured logs and correlation IDs (`core/DOCUMENTATION.md` §Logging).
- Never read `.env` or secrets.
- Never modify production data.

## Output

1. Hypothesis.
2. Diagnostic steps taken.
3. Root cause and fix.
