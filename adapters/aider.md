# Aider Adapter

> How Aider loads the kit. Canonical rules: `core/AGENTS.md`. This adapter adds no rules.

## 1. What Aider Reads

Aider has no instruction file it loads by convention. It loads conventions files as read-only
context through:

- `aider --read AGENTS.md` (one session), or `/read AGENTS.md` in chat, or
- a `read:` entry in `.aider.conf.yml` (every session; the reliable option).

`.aider.conf.yml` is looked up in the home directory, the git root, and the working directory.

## 2. Adopt

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project . -Agents aider -Packs typescript
```

This writes the rules into `AGENTS.md` and adds to `.aider.conf.yml`:

```yaml
read:
  - AGENTS.md
```

If `.aider.conf.yml` already has a `read:` key, the script leaves it alone and asks you to add
`AGENTS.md` to that list manually.

## 3. Notes

- Files loaded with `read` are cached when prompt caching is on, so a large `AGENTS.md` costs
  little after the first request.

Reference: <https://aider.chat/docs/usage/conventions.html>
