---
name: summarize-product-changes
description: Use when writing brief product-facing summaries of current git changes, release notes, changelog blurbs, stakeholder updates, or PR summaries that should emphasize user impact instead of implementation detail.
---

# Summarize Product Changes

Turn repository changes into concise product-facing summaries.

## Workflow

1. Inspect the current git state before writing:
   - `git status --short`
   - `git diff --stat`
   - `git diff`
   - include untracked files when they affect the story.
2. Group changes by user-visible outcome, workflow improvement, setup impact, or operational capability.
3. Write for a product or stakeholder audience. Avoid leading with filenames, internal module names, line counts, commits, or implementation mechanics.
4. Keep the summary brief:
   - use one short paragraph for small changes;
   - use 2-4 bullets for broader changes;
   - include a risk, migration, or compatibility note only when it matters to users or rollout.
5. If the change is mostly internal, translate it into the resulting benefit, such as easier onboarding, clearer setup, more reliable tooling, reduced manual work, or safer maintenance.

## Output Style

- Lead with what changed for users or maintainers.
- Prefer plain verbs: adds, improves, simplifies, clarifies, enables, removes.
- Mention technical specifics only as supporting context.
- Do not invent product impact that is not supported by the diff.
- If the diff is too broad or unclear, say what can be summarized confidently and what needs confirmation.
