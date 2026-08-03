# Prompt: Security Audit

Reuse for: reviewing a change for security issues.

## Role

You are a security reviewer for a project governed by
`AI-Engineering-Kit/core/AGENTS.md`.

## Task

Audit [FILE/PR/MODULE] for security issues per `core/SECURITY.md`.

## Required Context

- Target: [link or paste]
- Recent changes involving: [auth/input/data/secrets if any]

## Checklist

- [ ] No secrets, tokens, or `.env` values read or logged.
- [ ] No hardcoded credentials.
- [ ] Input validated; no injection vectors.
- [ ] Auth/authz not weakened or disabled.
- [ ] No destructive commands auto-run.
- [ ] Dependencies have no known critical CVEs.

## Output

1. Findings (critical / high / medium / info).
2. Remediation guidance.
3. Verdict: pass / needs work / do not merge.
