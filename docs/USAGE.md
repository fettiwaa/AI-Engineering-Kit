# Usage Guide

How to adopt the AI Engineering Kit in any project, with copy-paste commands for each
supported AI coding agent. Canonical rules live in `core/AGENTS.md`; each adapter below is
**minimal** and only points back to it.

> Windows commands run in **PowerShell**; Unix commands run in **bash/zsh**.
> `$KIT` is the absolute path to this kit repo (adjust as needed).

## 1. Prerequisites

Set the kit path (one-time, per shell):

```powershell
# Windows PowerShell
$KIT = '<path-to>\AI-Engineering-Kit'
```

```bash
# macOS / Linux
KIT="/path/to/AI-Engineering-Kit"
```

Verify the kit is consistent:

```powershell
# Windows
powershell -ExecutionPolicy Bypass -File $KIT\scripts\validate-kit.ps1
```

```bash
# macOS / Linux  (requires pwsh; otherwise run the validator from within the kit)
pwsh -File "$KIT/scripts/validate-kit.ps1"
```

## 2. Personal global profile (applies to every Kilo session)

Already created at:

```text
%USERPROFILE%\.config\kilo\AGENTS.md      # Windows
~/.config/kilo/AGENTS.md                  # macOS / Linux
```

Project-level instructions **always override** these personal preferences. Keep this file for
preferences only (e.g. "never read .env", "ask before installing dependencies").

## 3. Adopt the kit in a project

Pick the adapter for your agent and place its instruction file at the location the agent
expects. Each snippet below assumes you want the **core rules + a TypeScript pack**; swap the
pack path/name as needed.

### Kilo Code

Create `AGENTS.md` at the project root:

```powershell
"@import [$KIT\core\AGENTS.md]($KIT/core/AGENTS.md)
@import [$KIT\framework-packs\typescript.md]($KIT/framework-packs/typescript.md)" > AGENTS.md
```

```bash
cat > AGENTS.md <<EOF
@import [$KIT/core/AGENTS.md]($KIT/core/AGENTS.md)
@import [$KIT/framework-packs/typescript.md]($KIT/framework-packs/typescript.md)
EOF
```

### Claude Code

Create `CLAUDE.md` at the project root:

```powershell
"# Claude Code Instructions

Reference the canonical rule set:
- Core: $KIT/core/AGENTS.md
- Pack: $KIT/framework-packs/typescript.md" > CLAUDE.md
```

```bash
cat > CLAUDE.md <<EOF
# Claude Code Instructions

Reference the canonical rule set:
- Core: $KIT/core/AGENTS.md
- Pack: $KIT/framework-packs/typescript.md
EOF
```

### Cursor

Create `.cursorrules` at the project root:

```powershell
"@import [$KIT\core\AGENTS.md]($KIT/core/AGENTS.md)
@import [$KIT\framework-packs\typescript.md]($KIT/framework-packs/typescript.md)" > .cursorrules
```

### OpenAI Codex

Create `codex.md` at the project root:

```powershell
"@import [$KIT\core\AGENTS.md]($KIT/core/AGENTS.md)
@import [$KIT\framework-packs\typescript.md]($KIT/framework-packs/typescript.md)" > codex.md
```

### GitHub Copilot

Create `.github/Copilot-instructions.md`:

```powershell
New-Item -ItemType Directory -Path .github -Force > $null
"# Copilot Instructions

Canonical rule set: $KIT/core/AGENTS.md
Frameworks: $KIT/framework-packs/typescript.md" > .github\Copilot-instructions.md
```

```bash
mkdir -p .github
cat > .github/Copilot-instructions.md <<EOF
# Copilot Instructions

Canonical rule set: $KIT/core/AGENTS.md
Frameworks: $KIT/framework-packs/typescript.md
EOF
```

### Gemini CLI

Create `.gemini/GEMINI.md`:

```powershell
New-Item -ItemType Directory -Path .gemini -Force > $null
"@import [$KIT\core\AGENTS.md]($KIT/core/AGENTS.md)
@import [$KIT\framework-packs\typescript.md]($KIT/framework-packs/typescript.md)" > .gemini\GEMINI.md
```

```bash
mkdir -p .gemini
cat > .gemini/GEMINI.md <<EOF
@import [$KIT/core/AGENTS.md]($KIT/core/AGENTS.md)
@import [$KIT/framework-packs/typescript.md]($KIT/framework-packs/typescript.md)
EOF
```

### Aider

Create `.aider.md` at the project root:

```bash
cat > .aider.md <<EOF
@import [$KIT/core/AGENTS.md]($KIT/core/AGENTS.md)
@import [$KIT/framework-packs/typescript.md]($KIT/framework-packs/typescript.md)
EOF
```

### Windsurf

Create `.windsurfrc` with a rules import:

```powershell
'{"rules":[{"path":"'$KIT/core/AGENTS.md'","type":"import"},{"path":"'$KIT/framework-packs/typescript.md'","type":"import"}]}' > .windsurfrc
```

```bash
cat > .windsurfrc <<EOF
{
  "rules": [
    { "path": "$KIT/core/AGENTS.md", "type": "import" },
    { "path": "$KIT/framework-packs/typescript.md", "type": "import" }
  ]
}
EOF
```

## 4. Add more framework packs

To extend the adopted rules, append additional imports for each pack you need, e.g.:

```powershell
"
@import [$KIT\framework-packs\react.md]($KIT/framework-packs/react.md)
@import [$KIT\framework-packs\nextjs.md]($KIT/framework-packs/nextjs.md)" >> AGENTS.md
```

## 5. Re-validate after changes

Any time you edit imports, re-run the validator:

```powershell
powershell -ExecutionPolicy Bypass -File $KIT\scripts\validate-kit.ps1
```

## 6. Update the project memory files

After a session, append an entry to `docs/activity-log.md` (use
`templates/activity-log-entry.md`) so future agents inherit context.
