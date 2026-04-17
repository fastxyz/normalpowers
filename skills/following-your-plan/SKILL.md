---
name: following-your-plan
description: Use when a plan exists and the user is executing it. Walks through tasks one at a time, checkpoints progress, and keeps silent deviations from happening.
---

# Following Your Plan

A plan exists. Your job is to help the user execute it — step by step, in order, with visible progress, without drifting into improvisation.

**Announce at start:** "Using `following-your-plan` to work through the plan."

## Core Principle

A plan that took thought to write should take discipline to follow. Deviating from the plan is allowed — silently deviating is not.

When the plan and reality disagree:
- **Stop.** Don't split the difference in your head.
- **Name the conflict.** Tell the user what the plan says vs. what the situation actually is.
- **Decide together.** Update the plan, or update the situation, or cut the step. Either way, the decision is visible.

The cost of pausing to name a deviation is small. The cost of improvising and later discovering you've drifted three steps off-plan is large.

## Checklist

Walk through these in order. Keep the user informed at each step.

1. **Open the plan** — whichever document the user saved it in. If you can't find it, ask.
2. **Restate the goal** — one sentence. Confirm it still matches the user's current intent.
3. **Identify the starting task** — the first unchecked step, unless the user says otherwise.
4. **Walk through one step at a time** — do the step, show the result, mark it done, move on.
5. **Checkpoint at artifact boundaries** — when a task produces a reviewable artifact (memo, deck, plan update, stakeholder message), pause and let the user eyeball it before continuing.
6. **Surface deviations explicitly** — if reality doesn't match what the plan assumed, stop and name it.
7. **Update progress in the plan** — check off completed steps so the record is accurate.
8. **Close the loop** — when the plan is done, run the `verification-before-completion` skill before claiming success.

## Process Flow

```
Open the plan
      │
      ▼
Restate goal → still current?
      │
      ├── no ──► stop; revisit brainstorming or writing-plans
      │
      └── yes
          │
          ▼
Find first unchecked step
          │
          ▼
Do the step
          │
          ▼
Does the result match the expected check?
          │
          ├── no ──► surface the deviation; decide with user; update plan
          │
          └── yes
              │
              ▼
Mark the step done
              │
              ▼
At an artifact boundary?
              │
              ├── yes ──► checkpoint with user; wait for go-ahead
              │
              └── no
                  │
                  ▼
More steps? ──yes──► back to "Do the step"
      │
      └── no
          │
          ▼
Apply `verification-before-completion`
```

## Working One Step At A Time

- Read the current step out of the plan. Don't summarize — quote it.
- Do exactly what the step says. If the step says "draft the opening paragraph," produce the paragraph. Don't quietly expand the scope.
- Show the result. If the step produced prose, show the prose. If it produced a decision, show the decision. If it was a check, show what you checked and what you found.
- Mark the step done in the plan itself (`- [x]`).
- Move to the next step.

**Do not batch steps.** Running three steps and reporting a summary at the end erases the checkpoints the plan built in. The plan author put those checkpoints there on purpose.

## Checkpoints at Artifact Boundaries

Some steps produce things other people will read — a memo draft, an agenda, a stakeholder message, a revised proposal. At those boundaries, stop and let the user review before you continue.

What to say at a checkpoint:
> "Task N produced `<artifact>`. Please take a look before I move to Task N+1."

Wait for their response. If they request changes, make them, re-check, and continue. If they say go, continue.

This is the single most common place where silent drift happens. The executor "just keeps going," three tasks later something is off, and nobody can reconstruct where the divergence started.

## Surfacing Deviations

Reality will not exactly match the plan. That is normal. What matters is how you handle it.

**Patterns that count as a deviation:**
- The data you were supposed to reference isn't where the plan said it would be.
- The stakeholder you were supposed to consult is unavailable or has changed their view.
- A step's expected check failed (numbers don't match, draft doesn't land, the reviewer disagreed).
- The scope you're discovering mid-task is bigger than the step budgeted for.
- A later task makes an assumption that an earlier task's result just invalidated.

**What to do:**
1. Stop at the step where the mismatch surfaced.
2. Tell the user: "Plan says X. Reality is Y. I stopped before Z."
3. Propose the smallest correction that lets execution continue — update the step, reorder tasks, add a task, or cut a task.
4. Wait for the user's decision.
5. Update the plan document to reflect the decision. Future-you (or the next person) will need the plan to match what actually happened.

**What NOT to do:**
- Silently substitute the closest-available thing the plan meant to reference.
- "Try harder" on a failed check and move on when it eventually passes without investigating why.
- Skip a step because it no longer seems relevant without asking.
- Add steps the plan didn't have because they "obviously should be there."

## Progress Tracking

The plan is a living document while execution is happening.

- Check off (`- [x]`) every completed step before moving on. Not at the end of the task — at the end of the step.
- When a step changes (because of a deviation), edit the step in the plan to reflect the new instruction. Add a short note of what changed and why if it isn't obvious.
- When a task is added or removed, renumber only if the renumber is trivial. Otherwise, insert as "Task 4a" rather than shifting everything.
- If the plan is long and the user wants a running summary, give one sentence per completed task. Not a paragraph.

At any moment, a reader should be able to open the plan and see: what's done, what's next, what changed from the original.

## Red Flags

These thoughts mean STOP — you're about to drift.

| Thought | Reality |
|---------|---------|
| "This step is obvious, I'll skip ahead" | If it's obvious, it takes ten seconds to do properly. |
| "I'll do three steps then summarize" | Checkpoints exist for a reason. Honor them. |
| "The plan didn't anticipate this, so I'll just handle it" | Name the deviation. Decide with the user. Update the plan. |
| "Close enough" on a check that didn't pass | "Close enough" is the opening move of a later debugging session. Stop now. |
| "I'll update the plan at the end" | The plan is the record. Update as you go. |
| "This step produces a draft, I'll refine it before showing" | Show the draft at the checkpoint. That's what the checkpoint is for. |
| "This stakeholder consultation feels unnecessary, I'll skip it" | The plan author put it there. Ask before cutting. |

## Rationalizations To Watch For

- "The plan is a rough guide, not a script." Plans written with `writing-plans` are scripts. If you wanted a rough guide, you'd have one. You have a plan.
- "I'm making good progress, I don't want to break flow with a checkpoint." Good progress that deviates is still deviation. The checkpoint either confirms you're on-track or catches you early.
- "Updating the plan mid-execution is overhead." The overhead of an unmaintained plan is worse — by the time you realize the plan and reality have diverged, you can't tell which steps still apply.
- "The user will trust me to handle this." They trust you because you surface the hard calls. Silent handling is how trust breaks.

## When The Plan Is Wrong

Sometimes mid-execution you realize the plan itself is wrong — not just a step, the whole approach.

1. Stop. Do not continue executing a plan you've lost faith in.
2. Tell the user specifically what you think is wrong and why.
3. Recommend: revise the plan (return to `writing-plans`) or revise the spec (return to `brainstorming`).
4. Do not keep executing "so the work isn't wasted." Finishing a plan you know is wrong produces something worse than half-done work — it produces confidently wrong work.

## When The Plan Is Done

Every step checked. Every artifact produced. Every checkpoint cleared.

**Don't claim done yet.** Apply the `verification-before-completion` skill first. Internal belief that the plan is complete is not the same as evidence that the outcome is complete. `verification-before-completion` tells you how to gather that evidence.

Only after verification passes should you close the loop with the user.

## Key Principles

- **Plans are scripts, not guides.** Follow them.
- **Deviations are fine; silent deviations are not.** Name them. Decide together. Update the plan.
- **Checkpoints exist on purpose.** Honor artifact boundaries.
- **The plan is the record.** Keep it current as you go.
- **Execution ends with verification, not with the last checkbox.** Apply `verification-before-completion` before claiming done.
