# Checklist: Security Review

Follow `core/SECURITY.md` and `prompts/security-audit.md`.

- [ ] No secrets, tokens, or `.env` values read, printed, or committed.
- [ ] Authentication/authorization not weakened or disabled.
- [ ] Input validated and sanitized; no injection vectors.
- [ ] No destructive commands auto-run.
- [ ] Dependencies scanned for known CVEs.
- [ ] No production database or infra modified automatically.
- [ ] No secrets uploaded externally without approval.

## Verdict

- [ ] Pass
- [ ] Needs work
- [ ] Do not merge
