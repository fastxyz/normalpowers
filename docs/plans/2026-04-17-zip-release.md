# zip-release Implementation Plan

> **For the person executing this plan:** Use the `following-your-plan` skill to work through this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Ship a `normalpowers-vX.Y.Z.zip` on every GitHub Release so users can drag the extracted folder into Claude.ai Projects knowledge in one operation.

**Approach:** A `scripts/build-release.sh` produces the zip locally (locally testable). A thin GitHub Actions workflow triggers on `release: published` and attaches the zip to the release automatically.

**Files to create or modify:**
- Create: `scripts/build-release.sh`
- Create: `.github/workflows/release.yml`
- Modify: `README.md` (add Download tip to Claude.ai Projects section, step 3)

---

### Task 1: Write scripts/build-release.sh

**Files:**
- Create: `scripts/build-release.sh`

- [ ] **Step 1: Create the file with this exact content**

```bash
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
```

- [ ] **Step 2: Make it executable**

```bash
chmod +x scripts/build-release.sh
```

- [ ] **Step 3: Run it and verify the output**

```bash
./scripts/build-release.sh
```

Expected output (exact version will differ):
```
Building normalpowers-v0.1.0.zip...

Contents of dist/normalpowers-v0.1.0.zip:
  Length      Date    Time    Name
---------  ---------- -----   ----
     ...   ...         ...   INDEX.md
     ...   ...         ...   skills/brainstorming/SKILL.md
     ...   ...         ...   skills/following-your-plan/SKILL.md
     ...   ...         ...   skills/receiving-feedback/SKILL.md
     ...   ...         ...   skills/systematic-problem-solving/SKILL.md
     ...   ...         ...   skills/systematic-problem-solving/defense-in-depth.md
     ...   ...         ...   skills/systematic-problem-solving/root-cause-tracing.md
     ...   ...         ...   skills/using-normalpowers/SKILL.md
     ...   ...         ...   skills/verification-before-completion/SKILL.md
     ...   ...         ...   skills/writing-plans/SKILL.md
     ...   ...         ...   skills/writing-skills/SKILL.md
     ...   ...         ...   skills/writing-skills/anthropic-best-practices.md
     ...   ...         ...   skills/writing-skills/persuasion-principles.md
---------                     -------
     ...                     13 files

Done: dist/normalpowers-v0.1.0.zip
```

Confirm: 13 files, no `graphviz-conventions.dot`, no `normalpowers.md`.
If `graphviz-conventions.dot` appears or the count is wrong, fix the rsync exclude before continuing.

- [ ] **Step 4: Commit**

```bash
git add scripts/build-release.sh
git -c user.name='Ovidiu' -c user.email='ovidiu@fast.xyz' commit -m "feat: add build-release.sh to produce knowledge zip"
```

---

### Task 2: Write .github/workflows/release.yml

**Files:**
- Create: `.github/workflows/release.yml`

- [ ] **Step 1: Create the file with this exact content**

```yaml
name: Release

on:
  release:
    types: [published]

jobs:
  attach-zip:
    runs-on: ubuntu-latest
    permissions:
      contents: write
    steps:
      - uses: actions/checkout@v4

      - name: Build release zip
        run: |
          chmod +x scripts/build-release.sh
          ./scripts/build-release.sh

      - name: Upload zip to release
        run: gh release upload "${{ github.event.release.tag_name }}" dist/normalpowers-v*.zip --clobber
        env:
          GH_TOKEN: ${{ github.token }}
```

- [ ] **Step 2: Verify the workflow file is valid YAML**

```bash
python3 -c "import yaml; yaml.safe_load(open('.github/workflows/release.yml'))" && echo "valid"
```

Expected: `valid`. If it errors, fix the indentation before continuing.

- [ ] **Step 3: Commit**

```bash
git add .github/workflows/release.yml
git -c user.name='Ovidiu' -c user.email='ovidiu@fast.xyz' commit -m "feat: add release workflow to attach zip on publish"
```

---

### Task 3: Update README.md

**Files:**
- Modify: `README.md`

The Claude.ai Projects install section currently reads (step 3):
> `(Optional, improves behavior) Attach the individual skills/*/SKILL.md files to the project as project knowledge.`

Replace step 3 with a faster download path, keeping the manual option as a fallback.

- [ ] **Step 1: Replace step 3 in the Claude.ai Projects section**

Find this exact text in `README.md`:
```
3. (Optional, improves behavior) Attach the individual `skills/*/SKILL.md` files to the project as project knowledge. Claude will pull them in when the master prompt references them.
```

Replace with:
```
3. (Optional, improves behavior) Download the latest [`normalpowers-vX.Y.Z.zip`](https://github.com/fastxyz/normalpowers/releases/latest) from Releases, extract it, and drag the extracted folder into the project's knowledge section. Or upload the individual `skills/*/SKILL.md` files from GitHub if you prefer.
```

- [ ] **Step 2: Verify the change looks right**

```bash
grep -A2 "Optional, improves" README.md
```

Expected: the new text with the Releases link, no leftover old text.

- [ ] **Step 3: Commit**

```bash
git add README.md
git -c user.name='Ovidiu' -c user.email='ovidiu@fast.xyz' commit -m "docs: add zip download path to Claude Projects install"
```

---

### Task 4: Push and verify

- [ ] **Step 1: Push all three commits**

```bash
git push origin main
```

- [ ] **Step 2: Confirm the workflow file is visible on GitHub**

Open `https://github.com/fastxyz/normalpowers/actions` — the "Release" workflow should appear in the list (may show as "No runs yet" until the first release).

- [ ] **Step 3: Add dist/ to .gitignore**

```bash
echo "dist/" >> .gitignore
git add .gitignore
git -c user.name='Ovidiu' -c user.email='ovidiu@fast.xyz' commit -m "chore: ignore dist/ build output"
git push origin main
```

Expected: `dist/` no longer appears in `git status` after running the build script.
