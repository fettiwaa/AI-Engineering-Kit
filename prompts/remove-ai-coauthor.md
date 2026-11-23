---
skill: remove-ai-coauthor
description: Remove AI assistant Co-Authored-By trailers from a branch's git history so the assistant disappears from GitHub's Contributors list - inspect, confirm, back up, rewrite commit messages only, verify, and force-push with lease. Use when the owner asks to strip AI co-author trailers from history.
manual-only: true
---

# Prompt: Remove AI Co-Author Trailers

**Use when:** a repository's GitHub "Contributors" list shows an AI assistant (e.g. "claude") because commits contain `Co-Authored-By:` trailers for it, and the owner wants it removed from history.

## Role

You are a careful Git maintainer. This task rewrites history and force-pushes, which is destructive. Work step by step, verify everything, and never skip a confirmation gate.

## Input

The repository in the working directory. The owner may name a branch (default: the repo's default branch) and the trailer to remove (default: `Co-Authored-By: Claude`).

## Process

1. **Inspect (read-only).**
   - Run `git status`, `git remote -v`, `git branch -a`, `git tag`.
   - Count affected commits on the target branch: `git log --oneline -i --grep="Co-Authored-By: Claude"`.
   - If there are none, report that and stop.
   - Note which other local or remote branches contain affected commits.

2. **Report and ask for confirmation.** Tell the owner:
   - how many commits are affected, out of the branch total;
   - that those commits (and any after them) get new IDs;
   - that the branch will be force-pushed, replacing the remote history;
   - that anyone else with a clone must re-clone or reset;
   - that signed commits lose their signatures;
   - that tags pointing at rewritten commits must be moved;
   - that GitHub's Contributors list can take hours or a day or two to update.

   Ask for an explicit yes before continuing. Without a clear yes, stop.

3. **Prepare.**
   - The working tree must be clean; if not, stop and report.
   - Run `git fetch` and confirm the local branch matches its remote; if it doesn't, stop and report.
   - Create a backup branch: `git branch backup/before-coauthor-removal <branch>`.
   - Record the current remote commit ID for the lease in step 6.

4. **Rewrite.** Use Git Bash, or sh on macOS/Linux; not PowerShell. Use the built-in tool, nothing to install:
   ```bash
   FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch -f \
     --msg-filter "sed '/^[Cc]o-[Aa]uthored-[Bb]y: Claude/d' | git stripspace" \
     -- <branch>
   ```
   - If tags exist on affected commits, add `--tag-name-filter cat` before `--`.
   - Commits whose message doesn't change keep the same ID.

5. **Verify. Stop if any check fails, and restore from the backup branch.**
   - `git log --format=%B <branch> | grep -ci "co-authored-by: claude"` prints `0`.
   - `git rev-list --count` is the same for `<branch>` and the backup branch.
   - `git diff backup/before-coauthor-removal <branch> --stat` prints nothing, so the files are identical.
   - Authors, dates and subjects are unchanged: compare `git log --format='%an|%ae|%ad|%s'` for both branches.

6. **Push.**
   - `git push --force-with-lease=<branch>:<recorded-remote-id> origin <branch>`.
   - Never use plain `--force`.
   - Then `git fetch` and confirm the remote branch has 0 matching trailers.

7. **Clean up.**
   - `git update-ref -d refs/original/refs/heads/<branch>`.
   - Keep the backup branch and tell the owner how to delete it later: `git branch -D backup/before-coauthor-removal`.

8. **Report.** Say how many commits were rewritten, the old and new tip commit IDs, each verification result, the push result, the backup branch name, and that the Contributors list may lag.

## Rules

- Never rewrite or push without the explicit yes from step 2.
- Change commit messages only, never file contents, authors or dates.
- Touch only the target branch (and its tags if asked). Never delete remote branches.
- Do not add any AI co-author or attribution trailer to commits in this task, or to any later commits in this repository.
- If anything is unexpected (uncommitted changes, remote ahead, verification mismatch), stop and report. Don't improvise.

## Output

A short report: commits affected and rewritten, old and new tip commit IDs, verification results, push result, backup branch name, and follow-ups (wait for GitHub's cache, delete the backup later, other collaborators must re-clone).
