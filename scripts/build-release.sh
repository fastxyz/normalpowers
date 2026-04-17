#!/usr/bin/env bash
set -euo pipefail

VERSION=$(node -e "console.log(require('./package.json').version)")
DIST_DIR="dist"
STAGING_DIR="$(mktemp -d)"
ZIP_NAME="normalpowers-v${VERSION}.zip"

echo "Building ${ZIP_NAME}..."

# Clean prior build
mkdir -p "${DIST_DIR}"
rm -f "${DIST_DIR}/normalpowers-v"*.zip

# Copy skills/, excluding graphviz-conventions.dot
rsync -a --exclude="graphviz-conventions.dot" skills/ "${STAGING_DIR}/skills/"

# Write INDEX.md — LLM-facing instructions uploaded alongside the skills
cat > "${STAGING_DIR}/INDEX.md" << 'INDEXEOF'
# normalpowers — knowledge bundle index

You have the normalpowers skill bundle loaded as knowledge. Here is how to navigate it.

## Master prompt

Your operating instructions are in the custom instructions field — not in this knowledge bundle.
If you don't see a master prompt, ask the user to paste `normalpowers.md` into custom instructions.

## Skills

Eight skills live in `skills/<name>/SKILL.md`. When your master prompt says "read skill X"
or a skill references another, retrieve the file from this knowledge base.

| Skill | Path | Use when |
|---|---|---|
| `using-normalpowers` | `skills/using-normalpowers/SKILL.md` | Entry point — every conversation |
| `brainstorming` | `skills/brainstorming/SKILL.md` | Figuring out what to build, write, decide, or plan |
| `writing-plans` | `skills/writing-plans/SKILL.md` | Turning an approved spec into executable steps |
| `following-your-plan` | `skills/following-your-plan/SKILL.md` | Executing a plan task-by-task |
| `systematic-problem-solving` | `skills/systematic-problem-solving/SKILL.md` | Diagnosing something broken or underperforming |
| `verification-before-completion` | `skills/verification-before-completion/SKILL.md` | Verifying work before claiming done |
| `receiving-feedback` | `skills/receiving-feedback/SKILL.md` | Evaluating and responding to critique |
| `writing-skills` | `skills/writing-skills/SKILL.md` | Authoring new skills for your domain |

## Supporting reference docs

Some skills have supporting reference documents in their folder. Retrieve these when the
parent skill instructs you to.

- `skills/systematic-problem-solving/root-cause-tracing.md` — referenced by `systematic-problem-solving`
- `skills/systematic-problem-solving/defense-in-depth.md` — referenced by `systematic-problem-solving`
- `skills/writing-skills/anthropic-best-practices.md` — referenced by `writing-skills`
- `skills/writing-skills/persuasion-principles.md` — referenced by `writing-skills`
INDEXEOF

# Zip the staging directory
cd "${STAGING_DIR}"
zip -r "${OLDPWD}/${DIST_DIR}/${ZIP_NAME}" .
cd "${OLDPWD}"

# Clean up staging
rm -rf "${STAGING_DIR}"

# Print manifest so maintainer can verify before releasing
echo ""
echo "Contents of ${DIST_DIR}/${ZIP_NAME}:"
unzip -l "${DIST_DIR}/${ZIP_NAME}"
echo ""
echo "Done: ${DIST_DIR}/${ZIP_NAME}"
