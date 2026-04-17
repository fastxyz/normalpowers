---
name: writing-plans
description: Use when you have an approved spec for a multi-step initiative, before producing any artifacts or rolling anything out
---

# Writing Plans

## Overview

Write comprehensive execution plans assuming the person doing the work has zero context for this project and questionable taste. Document everything they need to know: which documents to open or create for each task, exact wording where wording matters, who to talk to, what "done" looks like, how to check their work. Give them the whole plan as bite-sized tasks. DRY. YAGNI. Small steps. Frequent checkpoints.

Assume they are a capable knowledge worker, but know almost nothing about your stakeholders, your product, or your organization's norms. Assume they don't know good review practices very well.

**Announce at start:** "I'm using the writing-plans skill to create the execution plan."

**Save plans to:** wherever the user keeps project docs (Notion, a shared drive, a wiki, a local folder). Ask if it isn't obvious from context. A good filename: `YYYY-MM-DD-<initiative-name>-plan.md`.

## Scope Check

If the spec covers multiple independent workstreams, it should have been broken into sub-project specs during brainstorming. If it wasn't, suggest breaking this into separate plans — one per workstream. Each plan should produce a usable, reviewable deliverable on its own.

## Document Structure

Before defining tasks, map out which documents, decks, memos, or artifacts will be created or modified and what each one is responsible for. This is where decomposition decisions get locked in.

- Design units with clear boundaries and well-defined purpose. Each artifact should have one clear responsibility (e.g., "stakeholder memo for the finance partner" is one artifact; "launch FAQ for the sales team" is another — don't merge them).
- You reason best about work you can hold in context at once, and your edits are more reliable when artifacts are focused. Prefer smaller, focused documents over sprawling ones that try to serve every audience.
- Artifacts that change together should live together. Split by audience or decision, not by arbitrary section headings.
- In ongoing projects, follow established conventions. If the team uses long omnibus docs, don't unilaterally restructure — but if a doc you're modifying has grown unwieldy, including a split in the plan is reasonable.

This structure informs the task decomposition. Each task should produce self-contained changes that make sense independently.

## Bite-Sized Task Granularity

**Each step is one action (2–5 minutes):**
- "Draft the opening paragraph of the memo" — step
- "Read it back and check it actually answers the question the exec asked" — step
- "Rewrite the paragraph to tighten the claim" — step
- "Re-read to confirm the edit lands" — step
- "Save and share the draft with the reviewer" — step

## Plan Document Header

**Every plan MUST start with this header:**

```markdown
# [Initiative Name] Execution Plan

> **For the person executing this plan:** Use the `following-your-plan` skill to work through this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** [One sentence describing what this produces]

**Approach:** [2–3 sentences about how we're going about it]

**Key inputs:** [Source material, stakeholders, data, prior decisions]

---
```

## Task Structure

````markdown
### Task N: [Artifact or Activity Name]

**Artifacts:**
- Create: `exact name and location of the new doc/deck/memo`
- Modify: `exact name and location of the existing artifact, section/page if relevant`
- Checkpoint: `who reviews it, or what self-check confirms it`

- [ ] **Step 1: Draft the opening**

> Proposed wording:
> "Recommendation: sunset the legacy onboarding flow by end of Q3. This memo lays out the three-option trade-off we considered and explains why option B is the lowest-risk path."

- [ ] **Step 2: Verify the claim lands**

Read it aloud. Does it answer the question the exec actually asked in the prior meeting?
Expected: yes — or rewrite before moving on.

- [ ] **Step 3: Write the trade-off section**

> Proposed wording:
> "Option A keeps the current flow and invests in analytics. Option B sunsets the flow and redirects engineering capacity to the unified onboarding. Option C runs both in parallel for a quarter. We recommend B because the parallel-run cost in C exceeds the expected learning."

- [ ] **Step 4: Sanity-check against the data**

Open the onboarding metrics dashboard. Confirm the numbers cited in the memo match what the dashboard shows this week.
Expected: numbers match. If not, update the memo.

- [ ] **Step 5: Share for review**

Send the draft to the named reviewer with the single question you most need them to answer.
````

## No Placeholders

Every step must contain the actual content the person needs. These are **plan failures** — never write them:
- "TBD", "TODO", "fill in later", "add details"
- "Add appropriate caveats" / "handle objections" / "address edge cases"
- "Write the rest of the memo" (without the actual proposed wording)
- "Similar to Task N" (repeat the content — the person may be reading tasks out of order)
- Steps that describe what to do without showing how (proposed wording, exact numbers, named stakeholders)
- References to people, artifacts, or decisions not introduced in any task

## Remember
- Exact artifact names always
- Complete wording in every step — if a step produces prose, show the prose
- Exact checks with expected results
- DRY, YAGNI, small steps, frequent checkpoints

## Self-Review

After writing the complete plan, look at the spec with fresh eyes and check the plan against it. This is a checklist you run yourself.

**1. Spec coverage:** Skim each section/requirement in the spec. Can you point to a task that delivers it? List any gaps.

**2. Placeholder scan:** Search your plan for red flags — any of the patterns from the "No Placeholders" section above. Fix them.

**3. Naming consistency:** Do the stakeholder names, artifact names, metric names, and section titles you used in later tasks match what you introduced in earlier tasks? A doc called "Launch Readiness Review" in Task 3 but "Launch Readiness Memo" in Task 7 is a bug.

If you find issues, fix them inline. No need to re-review — just fix and move on. If you find a spec requirement with no task, add the task.

## Red Flags

If you notice yourself thinking any of these while writing the plan, stop and fix the plan before moving on.

| Red flag | What it means | Fix |
|---|---|---|
| "The executor will figure out the wording" | You're offloading the hard part | Write the proposed wording now |
| "They'll know who to ask" | You skipped a stakeholder decision | Name the person in the task |
| "This step is obvious" | Obvious to you, not to them | Spell it out anyway |
| "I'll come back and fill this in" | You won't | Fill it in now or cut the task |
| "This task is a bit big, but splitting feels fussy" | The task is too big | Split it — fussy beats stuck |
| "The reviewer will catch anything I missed" | You're using review as a safety net for your own laziness | Do the work first; review is for second opinions, not first drafts |

## Rationalizations To Watch For

These are the excuses you'll hear yourself make for writing a weak plan. Call them out.

- "The person executing is smart; they'll improvise." They shouldn't have to. Give them the content.
- "This is just a quick email; it doesn't need a real plan." Quick emails with unexamined wording are how stakeholder relationships get damaged. Plan it.
- "Writing the actual wording feels like doing the work twice." The plan IS the work, one step removed. If writing the wording in the plan feels redundant, that means the plan is ready.
- "I don't know the exact numbers yet." Then the first task is "look up the exact numbers." Not a placeholder.
- "The spec is clear enough; the plan can be lighter." If the spec is that clear, writing the plan takes ten minutes. Do it.

## Process Flow

```
   Spec is approved
         │
         ▼
   Scope check: one coherent initiative?
         │
         ├── no ──► decompose; pick one sub-project; restart
         │
         └── yes
             │
             ▼
   Map out the artifacts (create vs. modify)
             │
             ▼
   Draft tasks, each as 2–5 minute steps
             │
             ▼
   Fill in exact wording, names, numbers, checks
             │
             ▼
   Self-review (coverage, placeholders, naming)
             │
             ▼
   Save the plan wherever the user keeps project docs
             │
             ▼
   Hand off to `following-your-plan`
```

<HARD-GATE>
Do NOT start executing the plan, producing final artifacts, or contacting stakeholders until the plan is written, self-reviewed, saved, and the user has seen it. This applies to EVERY initiative regardless of perceived simplicity.
</HARD-GATE>

## Execution Handoff

After saving the plan, tell your human partner the plan is ready and point them at the next skill:

> "Plan complete and saved. Next step: apply the `following-your-plan` skill to work through it task-by-task."

The ONLY next step after `writing-plans` is `following-your-plan`. Do not jump ahead to executing the tasks in this same turn — the plan needs to be a durable artifact your human partner can review, share, and return to.
