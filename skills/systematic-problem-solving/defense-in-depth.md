# Defense-in-Depth Checkpoints

## Overview

When you fix a problem caused by bad inputs or a missed handoff, adding a single checkpoint feels sufficient. But that one check can be bypassed when a different team runs the process, when the workflow is updated, or when someone routes around the step to save time.

**Core principle:** Add checks at EVERY handoff the work passes through. Make the failure structurally impossible.

## Why Multiple Layers

Single checkpoint: "We fixed the problem."
Multiple layers: "We made the problem impossible."

Different layers catch different cases:

- Entry checks catch the most common bad inputs.
- Mid-process checks catch errors that slip past entry.
- Context-specific guards catch failures that only appear in particular situations.
- Observability — written records and retros — helps when every other layer fails.

## The Four Layers

### Layer 1: Entry-Point Check

**Purpose:** Reject obviously incomplete or wrong inputs at the start.

Example — starting a new campaign:

- The brief must state the audience, the goal metric, the target number, and the assumed conversion rate.
- If any of those four are missing or say "TBD", the brief isn't accepted into the pipeline.
- If the audience named doesn't match the audience used in the forecast, the brief is rejected back for alignment.

### Layer 2: Mid-Process Check

**Purpose:** Re-verify that inputs still make sense as the work moves forward.

Example — media-plan review:

- Before creative is approved, confirm the audience in the plan still matches the audience in the brief.
- Confirm the target number still reflects the forecast for that audience.
- If either has drifted, block approval until the forecast is re-modeled or the target is updated.

### Layer 3: Context-Specific Guard

**Purpose:** Prevent failures that only appear in particular contexts.

Example — launch readiness:

- For paid-media launches, block go-live if the live targeting doesn't match the approved plan.
- For high-risk launches (above a budget threshold, or in a regulated market), require an additional named sign-off.
- For anything touching a shared external system (PR, partnerships, compliance), require explicit confirmation from that function.

### Layer 4: Documentation and Retro

**Purpose:** Capture context so problems that slip through can be diagnosed.

Example — post-launch:

- The brief, the approved plan, and the launched version are all stored together.
- Retros explicitly compare plan-time assumptions to launch-time reality and log deltas.
- When something goes wrong, the chain is reconstructable without interviewing six people.

## Applying the Pattern

When you find a problem:

1. **Trace the chain of events** — where did the bad input originate, and where was it used?
2. **Map every handoff** — list each point where the work changed hands or changed form.
3. **Add a check at each layer** — entry, mid-process, context-specific, documentation.
4. **Test each layer** — try to bypass layer 1 and confirm layer 2 catches it. Try to bypass layer 2 and confirm layer 3 catches it.

## Example from Practice

Problem: a campaign launched with a target that no longer matched its audience, and missed by 60%.

**Chain of events:**

1. Kickoff asked for "more volume."
2. Brief broadened audience but kept the original target.
3. Media plan used the broader audience.
4. Launch went live with a target built for a different audience.
5. Performance was measured against the wrong number.

**Four layers added:**

- Layer 1: Briefs require audience, goal metric, target, and conversion assumption together, or they aren't accepted.
- Layer 2: Media-plan review blocks approval if audience changed without a target update.
- Layer 3: Launch readiness gate flags any mismatch between approved plan and live configuration.
- Layer 4: Retros explicitly compare plan-time assumptions to launch-time reality and log deltas.

**Result:** The specific failure mode became structurally difficult to reproduce. Subsequent campaigns caught audience-target drift at Layer 1 or Layer 2, long before launch.

## Key Insight

All four layers were necessary. Over time, each layer caught something the others missed:

- Different team members bypassed entry checks under time pressure.
- New campaign types introduced edge cases that weren't covered by the mid-process check.
- Context-specific launches (new markets, regulated verticals) needed extra guards.
- Documentation was what let the team diagnose the cases that still slipped through.

**Don't stop at one checkpoint.** Add checks at every handoff. Make the failure structurally impossible, not just currently blocked.
