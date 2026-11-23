# References

External documentation the kit draws on. Agent products change quickly: re-check these when
updating prompts, skills, or adapters (technical debt T5).

## Prompting

- Claude prompting best practices:
  <https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices>
- Prompt engineering overview:
  <https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/overview>
- XML tags and prompt structure: <https://platform.claude.com/docs/claude/use-xml-tags>

The prompts in `prompts/` apply general prompt-engineering practice (clear instructions,
explicit context, structured sections, output criteria). They are original templates for a
software-development workflow, not official Anthropic prompts or policy. Check the guide for
the specific model you use; advice measured on one model does not always transfer to another.

## Claude Code

- Overview: <https://docs.anthropic.com/en/docs/claude-code/overview>
- Memory and `CLAUDE.md` imports: <https://docs.anthropic.com/en/docs/claude-code/memory>
- Skills (`SKILL.md` format and frontmatter): <https://code.claude.com/docs/en/skills>

## Instruction Files per Tool

Each adapter in `adapters/` links the vendor page it was verified against. The cross-tool
convention is described at <https://agents.md>.
