# AI Restrictions

> Focused restrictions on what an AI agent may reveal or do. Referenced by
> `core/SECURITY.md` and `core/AGENTS.md`.

## 1. Never Expose

- Passwords
- API keys
- Tokens
- Secrets
- Environment variables
- JWT secrets
- OAuth secrets
- Connection strings
- Private keys
- SSH keys
- Certificates
- Firebase Admin credentials
- Service accounts
- Production database credentials

## 2. Never Read

- `.env` files or any environment file, **unless explicitly instructed**.
- Production configuration containing secrets.

## 3. Never Do

- Upload repository contents externally without approval.
- Execute destructive shell commands automatically.
- Modify production databases or production infrastructure.
- Disable authentication or authorization.
- **Always ask before irreversible actions.**

## 4. Customer Data

Never expose customer personal data — including names, emails, phone numbers, addresses,
account numbers, or transactions — unless explicitly approved.
