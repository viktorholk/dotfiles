---
name: skill-authoring
description: Use when creating, editing, validating, or tightening SKILL.md Agent Skills for Codex, Claude, or other LLM agents.
---

# Skill Authoring

Use this skill to create small, reliable Agent Skills that trigger for the right work and stay easy to maintain.

## Principles

- Give each skill one clear job. Split unrelated workflows into separate skills.
- Keep the routing description specific enough to trigger on true matches and avoid near misses.
- Put only the instructions needed to start in `SKILL.md`; move long examples, policy notes, and domain references into `references/`.
- Prefer deterministic helper scripts in `scripts/` for validation, generation, or repeatable checks.
- Avoid tool-specific assumptions unless the skill is intentionally for one agent.
- Treat scripts, assets, and references as part of the skill surface. Audit them before reuse.

## Required Shape

Each skill directory should contain:

- `SKILL.md` with YAML frontmatter.
- `name` matching the directory name.
- `description` explaining when the skill should be used.
- Optional `scripts/`, `references/`, and `assets/` directories.

Names should be lowercase, hyphenated, and under 64 characters.

## Authoring Workflow

1. Name the repeatable workflow in one sentence.
2. Write a routing description that starts with "Use when" and lists the actual trigger conditions.
3. Add only the steps an agent needs to execute the workflow.
4. Move detailed background material into `references/`.
5. Add scripts only when they are deterministic and easier to run than re-explain.
6. Test one explicit prompt, one implicit prompt, and one negative-control prompt.
7. Tighten the description before adding more instruction text.

## Review Checklist

- The skill has one job.
- The folder name and frontmatter `name` match.
- The description is concrete and not a general productivity catch-all.
- The instructions are short enough for progressive disclosure.
- Any referenced files exist and are directly relevant.
- Scripts are deterministic, documented, and safe to inspect.
- The skill does not instruct the agent to ignore higher-priority user, system, or safety instructions.
