# Example: Adopting the Kit in a Next.js App (Claude Code + Copilot)

A Next.js App Router project using Supabase and Tailwind. Developers use Claude Code locally
and Copilot in pull requests.

## Command

```powershell
cd my-app
& "$KIT/scripts/adopt-kit.ps1" -Agents claude,copilot -Packs typescript,react,nextjs,tailwind,supabase
```

Output:

```
AI Engineering Kit v1.3.0 -> C:\src\my-app
Packs:  typescript, react, nextjs, tailwind, supabase
Agents: claude, copilot

sync    .ai-kit/ (core, checklists, prompts, templates, 5 pack(s))
create  AGENTS.md
create  CLAUDE.md
create  .github/copilot-instructions.md

Done. Review the changes, then commit AGENTS.md, .ai-kit/, and any shims.
```

## Resulting Files

`CLAUDE.md`:

```markdown
<!-- ai-kit:start | managed by AI Engineering Kit -->
@AGENTS.md
<!-- ai-kit:end -->

<!-- Claude-specific instructions go here. -->
```

`AGENTS.md` (abridged):

```markdown
<!-- ai-kit:start v1.3.0 | managed by AI Engineering Kit: ... -->
## Engineering Rules (AI Engineering Kit v1.3.0)

### 1. Non-Negotiables
- Do not read `.env` or other secret-bearing files unless explicitly told to. ...

## Framework Packs

### Next.js
#### 4. Secrets
- Only `NEXT_PUBLIC_*` variables reach the browser. ...

### Supabase
#### 2. Row Level Security
- Enable RLS on every table in an exposed schema, in the same migration that creates it. ...
<!-- ai-kit:end -->

## Project-Specific Instructions

- Verify with `pnpm lint && pnpm typecheck && pnpm test`; run `pnpm build` for routing changes.
- Supabase clients: browser client in `lib/supabase/client.ts`, server client in
  `lib/supabase/server.ts`. Never import the server client from a Client Component.
```

## Checking It Loaded

In Claude Code, run `/memory` and confirm `CLAUDE.md` and `AGENTS.md` are listed, then ask:
"What must you never do with Supabase keys in this project?" The answer should come from the
Supabase pack.
