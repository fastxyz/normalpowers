# 2026-04-17 — multi-format release — design

## Goal

Every GitHub Release ships three installable artifacts — `.zip` (Claude.ai Projects knowledge), `.plugin` (Claude Code one-click install), `.skill` (skill-compatible platforms) — plus a plugin manifest in the repo that enables `/plugin install normalpowers@fastxyz`.

## Approach

Option B: a purpose-built `skills/normalpowers.skill.md` as the `.skill` archive's entry point (flat paths, no install prose), plus `.claude-plugin/` manifest in the repo for GitHub-based plugin installs. `scripts/build-release.sh` extended to produce all three artifacts. All three attached to GitHub Releases automatically via the existing Actions workflow.

## Section 1 — Repo additions

### `.claude-plugin/` (new directory)

Enables `/plugin install normalpowers@fastxyz` from Claude Code.

```
.claude-plugin/
├── plugin.json          ← name, description, version, author, license
├── hooks/
│   ├── hooks.json       ← maps SessionStart → session-start script
│   ├── run-hook.cmd     ← cross-platform polyglot wrapper (ported from superpowers)
│   └── session-start    ← bash: reads normalpowers.md, injects as additionalContext
```

The session-start hook injects the full contents of `normalpowers.md` at session start — identical to what users paste manually. No Skill tool usage, no subagents, no CC-specific features in the skills themselves.

### `skills/normalpowers.skill.md` (new file)

The `.skill` archive's entry point. Contains:
- The skill-check rule and decision graph
- Red Flags table
- Skill catalog with triggers and what-you-do summaries
- References to sibling files by flat name (e.g. `brainstorming.md`, not `skills/brainstorming/SKILL.md`)
- No install instructions, no "paste into custom instructions" prose — this file is already loaded as a skill

## Section 2 — Three release artifacts

### `normalpowers-vX.Y.Z.zip` (existing, unchanged)

Knowledge folder for Claude.ai Projects drag-and-drop:
```
INDEX.md
skills/
  using-normalpowers/SKILL.md
  brainstorming/SKILL.md
  writing-plans/SKILL.md
  following-your-plan/SKILL.md
  systematic-problem-solving/SKILL.md + root-cause-tracing.md + defense-in-depth.md
  verification-before-completion/SKILL.md
  receiving-feedback/SKILL.md
  writing-skills/SKILL.md + anthropic-best-practices.md + persuasion-principles.md
```

### `normalpowers-vX.Y.Z.plugin`

Claude Code local install (zip archive with `.plugin` extension):
```
plugin.json
hooks/hooks.json
hooks/run-hook.cmd
hooks/session-start
skills/                  ← full skills/ directory (same as zip, minus INDEX.md)
```

### `normalpowers-vX.Y.Z.skill`

Single-skill archive — flat, exactly one `SKILL.md`:
```
SKILL.md                          ← from skills/normalpowers.skill.md
using-normalpowers.md             ← from skills/using-normalpowers/SKILL.md
brainstorming.md                  ← from skills/brainstorming/SKILL.md
writing-plans.md
following-your-plan.md
systematic-problem-solving.md
verification-before-completion.md
receiving-feedback.md
writing-skills.md
root-cause-tracing.md
defense-in-depth.md
anthropic-best-practices.md
persuasion-principles.md
```

## Section 3 — Extended build-release.sh

Existing `build_zip()` logic extracted into a function. Two new functions added:

```
build_zip()    — existing logic, unchanged
build_plugin() — stages .claude-plugin/ contents + skills/ (no INDEX.md), zips as .plugin
build_skill()  — stages normalpowers.skill.md as SKILL.md + all skill/support files
                  flattened (directory names stripped), zips as .skill
```

All three run in sequence. Final manifest lists all three output files.

`.github/workflows/release.yml` upload step:
```bash
gh release upload "$TAG_NAME" \
  dist/normalpowers-v*.zip \
  dist/normalpowers-v*.plugin \
  dist/normalpowers-v*.skill \
  --clobber
```

## Section 4 — Docs updates

### `README.md`

New subsection added above "Claude.ai — Projects":

```markdown
### Claude Code — one-click install

/plugin install normalpowers@fastxyz

Or download normalpowers-vX.Y.Z.plugin from Releases for a local offline install.
For skill-compatible platforms, download normalpowers-vX.Y.Z.skill.
```

### `docs/comparison-to-superpowers.md`

Add to the "Structural differences" section:

> normalpowers now ships a `.claude-plugin/` manifest for Claude Code one-click install (`/plugin install normalpowers@fastxyz`), while keeping portable markdown as the primary install path for all other platforms. The plugin's session-start hook injects `normalpowers.md` — no Skill tool, no subagents.

### `CLAUDE.md`

Add `.claude-plugin/` to the "What's In Here" file tree with description: "plugin manifest for `/plugin install normalpowers@fastxyz` and `.plugin` release artifact."

## Files to create or modify

| Action | Path |
|---|---|
| Create | `.claude-plugin/plugin.json` |
| Create | `.claude-plugin/hooks/hooks.json` |
| Create | `.claude-plugin/hooks/run-hook.cmd` |
| Create | `.claude-plugin/hooks/session-start` |
| Create | `skills/normalpowers.skill.md` |
| Modify | `scripts/build-release.sh` |
| Modify | `.github/workflows/release.yml` |
| Modify | `README.md` |
| Modify | `docs/comparison-to-superpowers.md` |
| Modify | `CLAUDE.md` |
