# Example — Brainstorming a product launch

This is a transcript of the `brainstorming` skill applied to planning a product launch. The assistant is any LLM running with the normalpowers master prompt loaded.

---

**User:** I want to plan a launch for our new onboarding flow next month.

**Assistant:** Using `brainstorming` to sharpen this launch plan.

Before I suggest anything, a few questions — one at a time.

Who is the primary audience for the new onboarding flow: existing customers migrating to it, new signups from this point forward, or a specific segment (free-tier, enterprise, a particular vertical)?

**User:** New signups from the launch date onward. Existing customers stay on the old flow for now.

**Assistant:** Got it. What does "success" look like one month after launch? Pick whichever you can actually measure:

1. Activation rate (% of signups completing the flow) above a threshold
2. Time-to-first-value faster than the old flow by some margin
3. Qualitative: named customer quotes, CS tickets about onboarding drop to near-zero
4. All of the above, with one as the primary

**User:** Option 1 is the primary. Target is 65% activation, up from today's 48%.

**Assistant:** That's a specific, checkable target. Good.

Two more context questions:

Is the onboarding flow itself fully built and tested, or is part of the "launch" actually finishing the product? The launch plan looks very different depending on the answer.

**User:** Fully built. We've been running it with a 10% holdout for two weeks and the activation is at 63% in that sample. Launch means turning the flag on for 100% of new signups.

**Assistant:** Excellent — this is a switch, not a build. That sharpens the plan a lot.

Last context question: who needs to know this is happening? I'll assume engineering and CS at minimum. Does sales need a heads-up? Marketing? Leadership? Anyone outside the company (partners, press, customers themselves)?

**User:** Internal only. Sales needs to know because they sometimes demo the onboarding in the sales process. CS needs the new documentation. Marketing and leadership just want a FYI. No external communication.

**Assistant:** Good — clear scope. Before I present the design, let me check the shape: this is one coherent project (flip the flag, prep the two internal teams that need to act on it, measure activation). One plan, not multiple. Agree?

**User:** Agree.

**Assistant:** Here's the design, section by section. I'll pause after each for you to approve or revise.

**Section 1 — Goal**

Flip the new onboarding flow to 100% of new signups on [date]. Primary success criterion: 30-day post-launch activation rate at 65% or higher (up from 48% on the old flow). Fallback: if activation drops below 55%, revert the flag and investigate.

Does the goal section look right?

**User:** Yes but add: we also commit to not reverting based on a single bad day. Need at least 3 consecutive days below 55% before triggering a revert.

**Assistant:** Noted — that's a sensible guard against daily noise. Updated.

**Section 2 — Audience and stakeholder actions**

- **Sales** — needs an internal message from me 3 days before launch. Content: the new flow is live, here's what demos should now show, here's the one-sentence summary to use in discovery calls.
- **CS** — needs updated help docs 3 days before launch. Deliverable: one short article ("What's new in onboarding") plus edits to the three existing articles that reference the old screens.
- **Marketing and leadership** — FYI Slack post on launch day. One paragraph: what changed, why, the 48% → target 65% framing.

Approve?

**User:** Approve. One addition: CS should also get a 15-minute walkthrough of the new flow live, not just docs.

**Assistant:** Added — 15-min CS walkthrough 2 days before launch.

**Section 3 — Measurement**

- Baseline: 48% activation (old flow, last 30 days).
- Success threshold: 65% activation in the 30 days post-launch.
- Revert threshold: 3 consecutive days below 55%.
- Dashboard: [existing activation dashboard, filtered to post-launch cohort].
- Owner of the number: me. Daily check for first two weeks, weekly after that.

Approve?

**User:** Approve.

**Assistant:** Great. I'll write the validated design as a spec you can save.

---

[The assistant produces a clean single-markdown-block spec titled `2026-05-XX — Onboarding Flow Launch — design.md` with the three sections above, plus a short "Risks and open questions" appendix: how to handle customers who signed up the day of the flip, whether to cap signups during the switch, etc.]

---

**Assistant:** Spec written. Please read it and let me know if you want to change anything before we move to the plan.

**User:** Looks good. One thing — add to open questions: do we need to tell the customers who signed up in the 10% holdout? They're already on the new flow.

**Assistant:** Added. Re-read: the spec is internally consistent, no placeholders, scope is focused. Ready when you are.

**User:** Approved.

**Assistant:** Next step: applying the `writing-plans` skill to turn this into a step-by-step executable plan. Ready to continue?

---

**What this demonstrates:**

- The assistant did not produce a launch plan in its first response.
- Clarifying questions were asked **one at a time**. Each question had a purpose: scoping audience, defining success, identifying stakeholders, checking whether the project is coherent.
- The design was presented in small sections with explicit approval gates. A user correction landed before the section moved on.
- The terminal move was a clean spec the user can save, followed by an explicit handoff to the next skill (`writing-plans`).

Without normalpowers, a typical LLM response to *"help me plan a launch"* is a bullet-point template covering pre-launch, launch day, and post-launch activities. That template is not wrong — it's just useless without the specifics the questioning flow surfaces.
