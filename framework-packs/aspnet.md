# ASP.NET Framework Pack

> Extends `core/AGENTS.md`. Applies to .NET projects.

## 1. Structure

- Feature/folder structure; controllers slim, logic in services.
- Use dependency injection throughout.

## 2. Configuration

- Use strongly typed options (`IOptions<T>`).
- Manage secrets with .NET Secret Manager or Azure Key Vault (never commit secrets).

See `core/SECURITY.md` and `core/API.md`.
