# Git Policy

## 1. Core Invariants (Never Auto-Execute)

Never automatically run:

- `git push`
- `git push --force`
- `git reset --hard`
- `git clean -fd`
- `git rebase`
- `git commit`

unless explicitly instructed by the user.

## 2. Commits

- Write commits only when explicitly asked.
- Follow the structured commit workflow in `COMMIT_WORKFLOW.md` (conventional commits,
  atomic changes, suggested commit boundaries).
- Stage only intended files; never stage secrets or build outputs.

## 3. Branch Hygiene

- Never delete a branch without explicit permission.
- Never merge into a protected branch without a review flow.
- Prefer feature branches for all work.

## 4. History

- Never rewrite shared history (`--amend`, `--force`) without explicit approval.
- Never rebase shared branches.

## 5. Verification

- Review `git status` and `git diff` before any commit decision.
- Ensure `.gitignore` excludes build outputs, dependencies, and environment files.

See also: `../.github/` for any CI configuration, `core/SECURITY.md` §Secret Scanning,
and `core/COMMIT_WORKFLOW.md` for the commit-authoring workflow.
