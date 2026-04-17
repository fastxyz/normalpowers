---
name: systematic-problem-solving
description: Use when something went wrong — a missed target, a stalled initiative, a broken process, a stakeholder conflict — before proposing fixes
---

# Systematic Problem-Solving

## Overview

Random fixes waste time and create new problems. Quick patches mask underlying causes.

**Core principle:** ALWAYS find root cause before attempting fixes. Symptom fixes are failure.

**Violating the letter of this process is violating the spirit of problem-solving.**

## The Iron Law

```
NO FIXES WITHOUT ROOT CAUSE INVESTIGATION FIRST
```

If you haven't completed Phase 1, you cannot propose fixes.

## When to Use

Use for ANY situation where outcomes deviated from expectations:

- A campaign that underperformed its targets
- A product metric that regressed
- A team whose velocity dropped
- A hiring cycle that failed to close candidates
- A deadline that was missed
- A process that broke down at a handoff
- A stakeholder who lost confidence or became misaligned
- A decision that produced an unexpected outcome

**Use this ESPECIALLY when:**

- Under time pressure (emergencies make guessing tempting)
- "Just one quick fix" seems obvious
- You've already tried multiple fixes
- A previous fix didn't hold
- You don't fully understand what happened

**Don't skip when:**

- The issue seems simple (simple problems have root causes too)
- You're in a hurry (rushing guarantees rework)
- A stakeholder wants it fixed NOW (systematic is faster than thrashing)

## The Four Phases

You MUST complete each phase before proceeding to the next.

### Phase 1: Root Cause Investigation

**BEFORE attempting ANY fix:**

1. **Read the available evidence carefully**
   - Don't skim past what reporters, dashboards, or participants actually said.
   - The signal you need is often in an aside or a footnote.
   - Note specific numbers, dates, names, and sequences.

2. **Reproduce the failure pattern**
   - Can you describe exactly what happened, step by step?
   - Does this pattern show up elsewhere (other campaigns, other teams, other quarters)?
   - If the pattern can't be reconstructed, gather more evidence before guessing.

3. **Check recent changes**
   - What changed in the weeks leading up to the problem?
   - New tooling, new people, new priorities, new market conditions?
   - Check meeting notes, decision logs, calendar changes, budget shifts.

4. **Gather evidence across every handoff in the process**

   **WHEN the work passes through multiple people or stages (brief → draft → review → publish, lead → qualified → demo → close, plan → approval → execution → measurement):**

   **BEFORE proposing fixes, instrument each handoff:**

   ```
   For EACH handoff between people or stages:
     - What inputs arrived?
     - What outputs went out?
     - Did expectations carry across, or get lost?
     - Who signed off, and on what?

   Gather evidence ONCE to show WHERE the chain broke
   THEN analyze to identify the failing handoff
   THEN investigate that specific handoff
   ```

   **Example (multi-stage campaign):**

   ```
   Stage 1 — Brief: What was the stated goal and success metric?
   Stage 2 — Creative: What did the team produce? Did it match the brief?
   Stage 3 — Approval: Who signed off, and what changed between brief and approved creative?
   Stage 4 — Launch: What actually went live? Did targeting, channels, and budget match plan?
   Stage 5 — Measurement: How did performance compare to the original goal?
   ```

   **This reveals:** Which stage failed (brief was clear, creative drifted in approval, launch used wrong targeting).

5. **Trace the chain backward**

   **WHEN the visible failure is far downstream from the original cause:**

   See `root-cause-tracing.md` in this directory for the full backward tracing technique.

   **Quick version:**
   - Where did the first wrong decision or wrong input enter the chain?
   - Who handed that forward, and on what basis?
   - Keep tracing upstream until you reach the original trigger.
   - Fix at the source, not at the symptom.

### Phase 2: Pattern Analysis

**Find the pattern before fixing:**

1. **Find working examples**
   - Locate a similar effort in the same org or field that succeeded.
   - What works that resembles what's broken?

2. **Compare against references**
   - If you're following a playbook or precedent, read it completely.
   - Don't skim — read every step and every assumption.
   - Understand the pattern fully before applying it.

3. **Identify differences**
   - What's different between the working example and the broken one?
   - List every difference, however small.
   - Don't assume "that can't matter."

4. **Understand dependencies**
   - What inputs, approvals, tools, or conditions does this depend on?
   - What assumptions is it making about the environment?

### Phase 3: Hypothesis and Testing

**Scientific method:**

1. **Form a single hypothesis**
   - State it clearly: "I think X is the root cause because Y."
   - Write it down.
   - Be specific, not vague.

2. **Test minimally**
   - Make the SMALLEST possible change to test the hypothesis.
   - One variable at a time.
   - Don't fix multiple things at once.

3. **Verify before continuing**
   - Did it work? Yes → Phase 4.
   - Didn't work? Form a NEW hypothesis.
   - DON'T stack more fixes on top.

4. **When you don't know**
   - Say "I don't understand X."
   - Don't pretend to know.
   - Ask for help.
   - Do more research.

### Phase 4: Implementation

**Fix the root cause, not the symptom:**

1. **Define the success test up front**
   - The simplest possible observation that will tell you the fix worked.
   - Could be a metric, a re-run of the process with a checkpoint, or a confirmation from the person affected.
   - MUST exist before implementing the fix.

2. **Implement a single fix**
   - Address the root cause identified.
   - ONE change at a time.
   - No "while I'm here" improvements.
   - No bundled re-orgs or scope expansion.

3. **Verify the fix**
   - Does the success test pass?
   - Did anything else break as a result?
   - Is the original problem actually resolved?

4. **If the fix doesn't work**
   - STOP.
   - Count: how many fixes have you tried?
   - If < 3: return to Phase 1, re-analyze with new information.
   - **If ≥ 3: STOP and question the underlying structure (step 5).**
   - DON'T attempt fix #4 without a structural discussion.

5. **If 3+ fixes failed: question the structure**

   **Pattern indicating a structural problem:**
   - Each fix reveals a new failure in a different place.
   - Fixes require "massive re-org" or "rewriting the process" to implement.
   - Each fix creates new symptoms elsewhere.

   **STOP and question fundamentals:**
   - Is this approach fundamentally sound?
   - Are we continuing out of inertia?
   - Should we redesign the process rather than keep patching symptoms?

   **Discuss with the decision-maker before attempting more fixes.**

   This is NOT a failed hypothesis — this is a wrong structure.

## Red Flags — STOP and Follow the Process

If you catch yourself thinking:

- "Quick fix for now, investigate later"
- "Just try changing X and see if it works"
- "Let's launch several changes at once and see what sticks"
- "Skip the checkpoint, I'll verify later"
- "It's probably X, let me fix that"
- "I don't fully understand but this might work"
- "The playbook says X but I'll adapt it differently"
- "Here are the main problems: [lists fixes without investigation]"
- Proposing solutions before tracing the chain of events
- **"One more fix attempt" (when you've already tried 2+)**
- **Each fix reveals a new problem in a different place**

**ALL of these mean: STOP. Return to Phase 1.**

**If 3+ fixes failed:** question the structure (see Phase 4.5).

## Signals You're Doing It Wrong

**Watch for these redirections from collaborators:**

- "Is that actually true?" — you assumed without verifying.
- "Will that tell us anything?" — you should have set up a real test.
- "Stop guessing" — you're proposing fixes without understanding.
- "Think this through more carefully" — question fundamentals, not just symptoms.
- "We're stuck?" (frustrated) — your approach isn't working.

**When you see these:** STOP. Return to Phase 1.

## Common Rationalizations

| Excuse | Reality |
|--------|---------|
| "Issue is simple, doesn't need process" | Simple issues have root causes too. The process is fast for simple cases. |
| "Emergency, no time for process" | Systematic problem-solving is FASTER than guess-and-check thrashing. |
| "Just try this first, then investigate" | The first fix sets the pattern. Do it right from the start. |
| "I'll set up a success test after the fix works" | Unverified fixes don't stick. Define the test first. |
| "Multiple fixes at once saves time" | You can't isolate what worked. It also causes new problems. |
| "Reference is too long, I'll adapt the gist" | Partial understanding guarantees new failures. Read it fully. |
| "I see the problem, let me fix it" | Seeing the symptom is not understanding the root cause. |
| "One more fix attempt" (after 2+ failures) | 3+ failures = structural problem. Question the approach, don't patch again. |

## Quick Reference

| Phase | Key Activities | Success Criteria |
|-------|---------------|------------------|
| **1. Root Cause** | Read evidence, reproduce, check changes, instrument handoffs | Understand WHAT and WHY |
| **2. Pattern** | Find working examples, compare | Identify differences |
| **3. Hypothesis** | Form theory, test minimally | Confirmed or new hypothesis |
| **4. Implementation** | Define success test, fix, verify | Problem resolved, nothing else broken |

## When the Process Reveals "No Root Cause"

If systematic investigation shows the problem was genuinely external, timing-dependent, or one-off:

1. You've completed the process.
2. Document what you investigated and ruled out.
3. Put appropriate handling in place (a monitoring check, an early-warning signal, a contingency plan).
4. Make the evidence easy to find if it recurs.

**But:** 95% of "no root cause" cases are incomplete investigation.

## Supporting Techniques

These techniques are part of systematic problem-solving and available in this directory:

- **`root-cause-tracing.md`** — Trace problems backward through the chain of events to find the original trigger.
- **`defense-in-depth.md`** — Add checkpoints at every handoff so a failure can't cascade silently.

**Related skill:**

- **`verification-before-completion`** — Verify the fix actually worked before declaring success.

## Real-World Impact

Compared to ad-hoc fixing:

- Systematic approach: problem resolved in one pass, typically in a single working session.
- Random fixes approach: repeated cycles of re-work, new problems spawned by partial fixes.
- First-time fix rate: dramatically higher.
- New problems introduced: near zero versus common.
