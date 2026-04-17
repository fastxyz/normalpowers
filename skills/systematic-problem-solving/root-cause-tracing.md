# Root Cause Tracing

## Overview

Problems often surface far downstream from where they actually originated. A campaign underperforms, but the real cause is in the brief written three weeks earlier. A deal stalls at negotiation, but the root cause is a qualification step skipped at discovery. A product launch lands flat, but the miss happened when positioning drifted during executive review.

Your instinct is to fix where the problem showed up — that's treating a symptom.

**Core principle:** Trace backward through the chain of events, decisions, and handoffs until you find the original trigger, then fix at the source.

## When to Use

```
            Problem appears far
           downstream from cause?
                    │
                    ▼
            Can you trace backward
            through the chain?
                    │
        ┌───────────┴───────────┐
       yes                      no (dead end)
        │                       │
        ▼                       ▼
  Trace to the original    Fix at the symptom,
  trigger, fix there       document the gap
        │
        ▼
  BETTER: also add
  defense-in-depth
```

**Use when:**

- The visible failure is far from where the problem actually started.
- The chain of events is long and spans multiple people or stages.
- It's unclear where the wrong decision or wrong input first entered the system.
- You need to identify which specific step, meeting, or choice triggered the cascade.

## The Tracing Process

### 1. Observe the symptom

```
The Q3 product-led-growth campaign missed its signup target by 60%.
```

### 2. Find the immediate cause

**What directly produced the miss?**

```
Paid channels drove 40% fewer qualified signups than forecast,
and the organic funnel converted at half the expected rate.
```

### 3. Ask: what fed into that?

```
Paid underperformance
  ← audience targeting shifted from "SMB ops leads" to "any ops role"
  ← change made during media-plan review
  ← because the brief said "broaden the top of funnel"
  ← because leadership asked for "more volume" in the kickoff
```

### 4. Keep tracing upstream

**What values, assumptions, or instructions were passed forward?**

- The original growth plan assumed SMB ops leads converted at 8%.
- Generic ops roles historically convert at 2%.
- Nobody re-modeled the forecast when the audience broadened.
- The signup target was left at the original number.

### 5. Find the original trigger

**Where did the mismatch first enter the chain?**

```
Kickoff meeting — leadership asked for "more volume" without
specifying whether the existing target assumed the existing audience.
Growth lead broadened the audience. Nobody re-ran the math.
The stale target became the scoreboard for a different campaign.
```

## Capturing the Chain on Paper

When you can't reconstruct the chain from memory, instrument it explicitly:

```
For each stage, write down:
  - Inputs that arrived (brief, data, approval)
  - Decisions made at this stage
  - Outputs handed off
  - Who signed off, and on what
  - What assumptions were carried (and whether they still held)
```

**Critical:** write it down in one place where every stage is visible side by side. Fragments across Slack threads, email, and meeting notes hide the exact point where the chain broke.

**What you're looking for:**

- The stage where an input quietly changed meaning.
- The stage where an assumption stopped being true but wasn't flagged.
- The stage where a handoff lost context that the next owner needed.

## Finding Which Step Introduced the Problem

If something went wrong and you don't know which step in the process caused it:

1. List every step in the process in order.
2. Walk the chain one step at a time: at this step, was the input still correct? Was the output still correct?
3. Stop at the first step where the output diverged from what later stages assumed.

That's your polluting step. The fix belongs there, not further downstream.

## Real Example: Campaign Miss

**Symptom:** Q3 PLG campaign missed signup target by 60%.

**Trace chain:**

1. Paid channels underperformed.
2. Audience broadened during media-plan review.
3. Brief said "broaden top of funnel."
4. Kickoff said "more volume."
5. Target was never re-modeled when audience changed.

**Root cause:** The target was set against the old audience assumption and never updated when the audience shifted. The campaign was measured against a number that no longer matched its design.

**Fix at the source:** Require forecast re-modeling whenever audience definition changes in the media-plan review stage.

**Also added defense-in-depth:**

- Layer 1: Kickoff template requires audience definition and associated conversion assumption to be named together.
- Layer 2: Media-plan review checklist blocks sign-off if audience changed without target update.
- Layer 3: Launch readiness gate flags when the live target doesn't match the current forecast.
- Layer 4: Post-launch retros explicitly compare plan-time assumptions to launch-time reality.

## Key Principle

```
        Found the immediate
        cause of the problem
                │
                ▼
        Can you trace one
        level further upstream?
                │
        ┌───────┴───────┐
       yes              no
        │               │
        ▼               ▼
   Trace backward   NEVER fix only
        │          the symptom —
        ▼          document the gap
   Is this the
   source?
        │
   ┌────┴────┐
   no       yes
   │         │
   └─► loop  ▼
         Fix at the source
                │
                ▼
        Add checks at each
        handoff (defense-in-depth)
                │
                ▼
        Problem becomes
        structurally impossible
```

**NEVER fix only where the problem showed up.** Trace back to find the original trigger.

## Tracing Tips

- **In meetings and retros:** ask "what were we assuming at the previous stage?" at every level.
- **Before a blame conversation:** reconstruct the chain first — problems that look like individual failures are usually handoff failures.
- **Include context:** what was the brief, what was approved, what was said verbally versus written down, what changed between stages.
- **Capture the chain:** write every stage out in order so you can see the whole sequence at once.

## Real-World Impact

A trace through five stages (kickoff → brief → media plan → launch → measurement) usually takes an hour and surfaces a single upstream cause that, once fixed, prevents an entire class of repeat problems. Patching only the downstream symptom ships the same failure the next quarter in a different disguise.
