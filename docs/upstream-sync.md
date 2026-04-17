# Upstream sync

normalpowers is a fork of [obra/superpowers](https://github.com/obra/superpowers). We intend to stay close to it.

## The commitment

We do not hard-diverge from upstream. Directory names for four skills are preserved on purpose:

- `skills/brainstorming/`
- `skills/writing-plans/`
- `skills/verification-before-completion/`
- `skills/writing-skills/`

These paths match upstream exactly. That makes `git cherry-pick` of upstream commits that touch those files tractable — a patch against `skills/brainstorming/SKILL.md` upstream applies to the same file here, and conflicts (when they happen) are about content, not structure.

## The trade-off

For the four skills we renamed — `using-normalpowers`, `following-your-plan`, `systematic-problem-solving`, `receiving-feedback` — upstream improvements cannot be cherry-picked cleanly. The path names don't match, so git won't find the target file. These have to be manually ported: read the upstream diff, figure out what it's improving, apply the equivalent change to our renamed version.

This is slower but unavoidable. The rename was worth it (the new names describe the scope better for knowledge workers) and the manual port is the cost.

## Setup

Add the upstream remote once:

```
git remote add upstream https://github.com/obra/superpowers.git
git fetch upstream
```

Verify:

```
git remote -v
# origin    git@github.com:fastxyz/normalpowers.git ...
# upstream  https://github.com/obra/superpowers.git ...
```

## Monthly routine

Run this on or near the first of each month:

```
git fetch upstream
git log upstream/main --not main --oneline
```

Review the list of upstream commits we don't have. For each one, decide:

- **Cherry-pick** if it touches only unchanged skills (`brainstorming`, `writing-plans`, `verification-before-completion`, `writing-skills`) and the change is content we want.
- **Manual port** if it touches one of the four renamed skills. Read the upstream diff, apply the equivalent edit to our renamed file.
- **Skip** if it touches dropped skills or plugin machinery (see below).

Batch the cherry-picks into one PR. Batch the manual ports into a separate PR so each is easier to review.

## What NOT to do

**Do not run a full `git merge upstream/main`.** We have deleted entire skill directories and all plugin machinery. A merge will produce catastrophic conflicts — most of them in files we don't want back. Cherry-pick only.

**Do not cherry-pick commits that touch dropped skills or plugin code.** These paths are permanently severed. Specifically, skip any commit that only touches:

- `skills/test-driven-development/`
- `skills/executing-plans/` (replaced by `skills/following-your-plan/`)
- `skills/using-git-worktrees/`
- `skills/subagent-driven-development/`
- `skills/requesting-code-review/`
- `skills/dispatching-parallel-agents/`
- `skills/finishing-a-development-branch/`
- any plugin manifest, hook definition, or Skill-tool wiring

If a single upstream commit touches both a kept skill and a dropped skill, cherry-pick with `--no-commit`, drop the dropped-skill hunks, then commit.

## Worked example

Suppose upstream lands a commit that adds a new Red Flag row to `skills/brainstorming/SKILL.md`:

```
git fetch upstream
git log upstream/main --not main --oneline -- skills/brainstorming/
# abc1234 brainstorming: add "I already know the answer" red flag

git cherry-pick abc1234
```

Because the path is identical, this usually applies cleanly. If there's a conflict — say the same commit also changed a software-specific example that we'd already re-exampled for knowledge work — resolve by keeping the new Red Flag row and preserving our knowledge-work examples. Commit.

If the commit is against `skills/executing-plans/`, skip it. If the commit is against `skills/systematic-debugging/`, manually port it to `skills/systematic-problem-solving/`.

## When upstream diverges structurally

If Jesse restructures a skill we kept — moves content to sub-files, changes frontmatter, adds a new section shape — take it seriously. The restructure is probably the point of the commit. Port the structure faithfully before worrying about content edits. Our goal is structural parity for the four shared paths.

If the restructure makes cherry-picking impossible (for example, upstream splits `brainstorming/SKILL.md` into multiple files), stop and open an issue. That's a design decision for the repo, not something to resolve mid-sync.
