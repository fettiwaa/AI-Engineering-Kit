# Gemini CLI Adapter

> How Google Gemini CLI loads the kit. Canonical rules: `core/AGENTS.md`. This adapter adds
> no rules.

## 1. What Gemini CLI Reads

- Global: `~/.gemini/GEMINI.md`.
- Project: `GEMINI.md` files from the working directory up to the project root, plus
  subdirectories. (Note: the project file sits at the root, not inside `.gemini/`.)
- `GEMINI.md` can import other Markdown files with `@./relative/path.md` lines.
- `context.fileName` in `.gemini/settings.json` can rename the context file, e.g.
  `["AGENTS.md", "GEMINI.md"]`.

## 2. Adopt

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project . -Agents gemini -Packs typescript
```

This writes the rules into `AGENTS.md` and a `GEMINI.md` shim containing:

```markdown
@./AGENTS.md
```

Alternatively, skip the shim and set `context.fileName` to include `AGENTS.md`.

## 3. Notes

- Run `/memory show` to see the combined context Gemini loaded.

Reference: <https://geminicli.com/docs/cli/gemini-md/>
