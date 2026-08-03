# Windsurf Adapter

> ConfiguresWindsurf (Cascade). Canonical rules: see
> `AI-Engineering-Kit/core/AGENTS.md`.

## 1. Instruction File

Windsurf reads `.windsurfrc` for config and supports project-level rule files referenced
in `.windsurfrc` or placed as `AGENTS.md`.

## 2. Loading Order

1. Global Windsurf preferences (lowest precedence).
2. Project rule file (highest precedence).

## 3. Directive

To adopt this kit, add to `.windsurfrc`:

```jsonc
{
  "rules": [
    { "path": "../AI-Engineering-Kit/core/AGENTS.md", "type": "import" }
  ]
}
```

## 4. Notes

- This adapter is minimal; do not duplicate core rules.
- Overrides must cite the canonical rule path.

See `core/SECURITY.md` and `core/PROMPTING.md`.
