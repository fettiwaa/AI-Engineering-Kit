# Security

## 1. Core Invariants (Never Violate)

- Never read `.env` files unless explicitly instructed.
- Never expose secrets, tokens, keys, or environment variables.
- Never reveal JWT secrets, OAuth secrets, or service accounts.
- Never reveal SSH keys or credentials.
- Never commit secrets to the repository.
- Never upload repository contents externally without approval.
- Never modify production databases or production infrastructure.
- Never disable authentication.
- Never disable authorization.
- Never perform destructive shell commands automatically.
- Always request confirmation before irreversible actions.

## 2. Secret Scanning

- Treat any string matching common secret patterns (e.g. `AKIA*`, `ghp_*`, private key headers)
  as potentially sensitive.
- If you suspect a secret is present, flag it and stop; do not propagate it.

## 3. Safe Defaults

- Assume read-only access unless write access is explicitly granted.
- Default to least privilege.
- Prefer sandboxed or local operations over remote mutations.
- Confirm before writing to shared environments.

## 4. Dependency Supply Chain

- Prefer pinned, well-maintained dependencies.
- Avoid dependencies with known CVEs without an approved mitigation.
- Review transitive dependencies when feasible.

## 5. Reporting

If a secret or vulnerability is suspected, report it through the project's
[Responsible Disclosure](../CONTRIBUTING.md) process rather than exposing details in chat.

## 6. AI Restrictions

AI agents must additionally follow `AI_RESTRICTIONS.md`, which enumerates what may never be
revealed (passwords, API keys, tokens, connection strings, private/SSH keys, service accounts,
customer personal data, etc.).
