# Example — Full flow across multiple skills

A flagship demo. One real piece of knowledge work, taken from "I have a fuzzy problem" to "I have a plan I'm confident in." Multiple skills chain together.

Scenario: a product lead needs to write a memo to the CEO recommending whether to kill an underperforming feature.

The assistant is any LLM running with the normalpowers master prompt loaded. Transcript is compressed for length — the actual conversation would have had more exchanges.

---

## Act 1 — brainstorming

**User:** I need to write a memo recommending whether to kill our "smart notifications" feature. Adoption has been disappointing and leadership is asking questions.

**Assistant:** Using `brainstorming` to sharpen the memo before any drafting.

First question: who is the primary reader, and what decision will they make based on this memo?

**User:** CEO. She'll either approve killing it at the next exec meeting or tell us to give it another quarter.

**Assistant:** One reader, one binary decision. That's a clean target.

Do you already know what you recommend — kill it, keep it, give it another quarter — or is this memo an honest exploration?

**User:** I think we should kill it. Adoption is 6% of DAU after three quarters; we targeted 30%. Engineering time spent maintaining it could go to two other projects the team has been blocked on.

**Assistant:** Good — you have a position. That changes the memo's shape. It's not a neutral analysis; it's a recommendation with evidence.

What has the CEO already said or signaled about this feature? Specifically: has she ever been publicly enthusiastic about it in a way that a "kill it" recommendation would contradict?

**User:** She was the one who greenlit it. She's referenced it positively in one all-hands. Not a huge public commitment, but she has some skin in this.

**Assistant:** That matters. The memo can't just be "the numbers say kill it." It has to acknowledge her original thesis, explain why the data didn't support it, and make the kill recommendation without implying she was wrong to greenlight it in the first place. Good greenlighting and good sunsetting are both part of running a product.

One more: what's the counter-argument to killing it? A skeptical CEO will push back with the strongest version. What's yours?

**User:** "Three quarters isn't enough; smart notifications is a compounding feature, give it another year." I don't buy it — the adoption curve has been flat for two quarters, not climbing. But I should address it.

**Assistant:** Right. Let me propose the memo's shape in three sections.

**Section 1 — Frame**

One-sentence recommendation up top. Then one paragraph: the original thesis, what we've seen in three quarters, why the evidence is sufficient to decide.

**Section 2 — Evidence**

Three data points, not ten. The ones that actually carry the argument: flat adoption curve (6% DAU across Q2–Q4, not climbing), engineering cost (estimated 1.2 FTE sustained), and the opportunity cost (two blocked projects, both with higher expected adoption based on user research).

**Section 3 — Counter-argument and response**

Name the "it's compounding, give it more time" argument. Address it specifically: a compounding feature should show an upward curve, even if slow. Ours is flat. That's the evidence discriminator.

Plus a one-line closing asking for her decision at the exec meeting.

How does that shape feel?

**User:** Good. One change — the opportunity-cost section should name the two projects specifically. "Unified search" and "team workspaces." She's seen both in roadmap reviews.

**Assistant:** Named — updated.

[The assistant produces the validated design as a clean spec for the user to save.]

Spec written. Please read it and let me know if you want to change anything before we move to the plan.

**User:** Approved.

## Act 2 — writing-plans

**Assistant:** Using `writing-plans` to turn this into a step-by-step plan.

The memo is short — a three-section executive memo is maybe 400-500 words. The plan needs to be bite-sized steps because the hard work is in the wording, not the structure.

[Plan produced. Sample tasks, abbreviated:]

- **Task 1: Draft the one-sentence recommendation.**
  > Proposed wording: "Recommend sunsetting smart notifications by end of Q2 and redirecting engineering capacity to unified search and team workspaces."
  > Check: does it contain the verb "recommend," the action ("sunset"), the timeline ("end of Q2"), and the redirect ("unified search and team workspaces")? Yes.

- **Task 2: Draft the framing paragraph.**
  > Proposed wording: "Smart notifications launched in [date] with a three-quarter learning budget and a target of 30% DAU adoption. After three quarters, adoption has stabilized at 6% DAU with no upward trend. This memo lays out the evidence, addresses the 'give it more time' counter-argument, and asks for a decision at the April 30 exec meeting."
  > Check: does it acknowledge the original thesis without undermining it? Yes — "launched with a three-quarter learning budget" frames it as a bet with a defined window, not a mistake.

- **Task 3: Pull the adoption curve data.**
  > Source: product analytics dashboard, "Smart Notifications — DAU adoption" view.
  > Pull three numbers: Q2 average DAU%, Q3 average DAU%, Q4 average DAU%.
  > Expected: all three within a point or two of 6%. If there's a genuine upward curve, stop and reconsider the recommendation.

[...additional tasks for the evidence paragraph, counter-argument, closing, and review pass.]

Plan saved as `2026-04-XX — Smart Notifications Sunset Memo — plan.md`.

## Act 3 — following-your-plan

**User:** Let's work through it.

**Assistant:** Using `following-your-plan` to execute task-by-task.

Task 1 — Draft the one-sentence recommendation. Produced:

> "Recommend sunsetting smart notifications by end of Q2 and redirecting engineering capacity to unified search and team workspaces."

Check: verb present, action named, timeline specific, redirect specific. Passes.

Task 2 — Draft the framing paragraph. Produced:

> [as written in the plan]

Check: acknowledges original thesis ("launched with a three-quarter learning budget") without undermining it. Passes.

Task 3 — Pull the adoption curve data. I don't have access to your analytics dashboard. Please pull the three DAU% numbers for Q2, Q3, Q4 and share them.

**User:** Q2: 5.8%, Q3: 6.1%, Q4: 6.2%.

**Assistant:** Good — flat, within the range I assumed. Writing the evidence paragraph now.

[...several more tasks. At Task 7, the counter-argument section, a checkpoint:]

Task 7 produced the counter-argument section:

> "A reasonable objection is that three quarters is insufficient — that smart notifications is a compounding feature that will accelerate with a larger notification corpus and deeper personalization. The discriminator is the shape of the adoption curve, not its absolute level. A compounding feature should show acceleration even from a low base. Our curve is flat: 5.8%, 6.1%, 6.2% across three consecutive quarters. That pattern rules out the compounding hypothesis at this adoption level."

Please take a look before I move to Task 8 (closing paragraph).

**User:** Good but tighten. "That pattern rules out" is too absolute — what if there's a delayed-compounding dynamic? Soften.

**Assistant:** Updated to:

> "...That pattern is inconsistent with compounding at this adoption level. A delayed-compounding dynamic is possible but not what we'd expect to see here, and committing another quarter of engineering capacity on that hope has real opportunity cost."

Continuing to Task 8.

[...Task 8, 9, 10 complete the draft. Plan is done.]

## Act 4 — verification-before-completion

**Assistant:** Plan complete — every task checked. Before claiming the memo is done, applying `verification-before-completion`.

The memo exists. But "memo exists" is not evidence that the memo succeeds. Success = CEO reads it, understands the recommendation, engages with the evidence, and makes a decision.

I can't produce that evidence directly, but I can set up for it. Three checks:

1. **Reader restatement.** Before sending to the CEO, send to one peer (an engineering director, ideally) who doesn't know the memo's context. Ask them to restate the recommendation and the core evidence in their own words. If they restate it correctly, the memo lands. If they miss or distort the counter-argument, the memo needs another pass.

2. **Scope check.** Does the memo recommend one thing (sunset) with a clear next step (decision at April 30 exec meeting), or did it quietly grow into "sunset AND here are five other product bets"? Re-read: it's scoped. One decision requested.

3. **Freshness check.** The adoption numbers were pulled today. Confirm on the morning of the exec meeting that they haven't moved — if Q1 2026 is showing unexpected movement, the memo needs a postscript.

Don't claim done on this work until at least check 1 produces a correct restatement. If it does, you have evidence the memo is ready. If not, you have a specific signal about what to fix.

**User:** Peer restated it. She got the recommendation and the curve-shape argument. She missed that the opportunity-cost projects are specifically unified search and team workspaces — said "and two other projects." I'll tighten that callout and re-test.

**Assistant:** Good — that's exactly the use of verification. The memo looked done but wasn't. You have a specific fix: make the project names more prominent, probably in a bolded line or a callout, not buried in a sentence.

Iterate on that one fix, re-test with the peer, and then you have real evidence the memo is ready for the CEO.

---

**What this demonstrates:**

The assistant chained four skills on one piece of work:

1. `brainstorming` produced a shaped memo design with clear sections and an approved position.
2. `writing-plans` broke it into bite-sized steps with exact wording and checks.
3. `following-your-plan` executed step-by-step with checkpoints and a named deviation when the user wanted to soften a phrase.
4. `verification-before-completion` caught that "memo is written" ≠ "memo is ready," and produced a specific, actionable next test.

At no point did the assistant just "write a memo." The discipline of checking which skill applies before acting, and transitioning cleanly between skills, is what produces work the user can ship.
