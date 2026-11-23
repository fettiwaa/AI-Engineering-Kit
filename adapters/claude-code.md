# Claude Code Adapter

> How Claude Code loads the kit. Canonical rules: `core/AGENTS.md`. This adapter adds no rules.

## 1. What Claude Code Reads

| Scope | File |
|-------|------|
| User (all projects) | `~/.claude/CLAUDE.md` |
| Project (shared, committed) | `CLAUDE.md` at the repo root (also `.claude/CLAUDE.md`) |
| Project (personal, not committed) | `CLAUDE.local.md` |
| Subdirectory | `CLAUDE.md` in a subfolder, loaded when Claude works there |

Claude Code does not read `AGENTS.md` on its own, but `CLAUDE.md` can import any file with an
`@path` line (relative to the importing file; imports may nest a few levels deep).

## 2. Adopt

```powershell
& "$KIT/scripts/adopt-kit.ps1" -Project . -Agents claude -Packs typescript
```

This writes the rules into `AGENTS.md` and a `CLAUDE.md` shim containing:

```markdown
@AGENTS.md
```

Put Claude-specific instructions in `CLAUDE.md` below the managed block.

## 3. Skills

The kit's prompts install as skills (`.claude/skills/<name>/SKILL.md`, `name` + `description`
frontmatter; manual-only ones add `disable-model-invocation: true`):

```powershell
& "$KIT/scripts/install-skills.ps1" -Skills all -Scope user    # or -Scope project
```

Invoke with `/<name>`; auto skills also load when a request matches their description.

## 4. Notes

- `@path` must stand on its own line or be preceded by whitespace; it is not resolved inside
  code spans or code blocks.
- Run `/memory` in a session to see which instruction files were loaded.
- Personal preferences ("never read `.env`") belong in `~/.claude/CLAUDE.md`.

References: <https://docs.anthropic.com/en/docs/claude-code/memory>,
<https://code.claude.com/docs/en/skills>
