# Example — Diagnosing a retention drop

This is a transcript of the `systematic-problem-solving` skill applied to a sudden dip in 30-day retention. The assistant is any LLM running with the normalpowers master prompt loaded.

---

**User:** Our 30-day retention dropped from 72% to 64% last month. Product team is panicking and wants to ship a "winback" email campaign. I'm not sure that's the right move. Help me figure out what's actually going on.

**Assistant:** Using `systematic-problem-solving` to diagnose before prescribing a fix.

The shape of the problem: you've been asked to act on a diagnosis you don't believe. A winback campaign treats the cause as "users are drifting away and need a nudge" without evidence that's what happened. Let's work through the four phases: reproduce, hypothesize, test, verify. No recommendation until we get through at least test.

**Phase 1 — Reproduce (pin down what actually happened).**

Before we theorize, I need to understand the shape of the drop. A few questions:

Is the 72% → 64% drop across the whole user base, or a specific cohort (a signup month, a specific plan, a specific acquisition channel)?

**User:** Good question. Let me check… it's the Feb-signup cohort measured at day 30 (so measured in March). Prior cohorts (Jan, Dec, Nov) all hit 70-73% at day 30. Feb dropped to 64%.

**Assistant:** That's a big clue already. The drop is cohort-specific, not a company-wide decline across existing users. We're looking for something that happened to February signups specifically, or something that happened in March that affected their day-30 check.

Two more reproduce questions:

1. Is the drop consistent across acquisition channels, or concentrated in one? (Paid search, organic, referrals, partnerships.)
2. Is the drop consistent across plan tiers (free, pro, team, enterprise)?

**User:** Channel: I'd have to pull it. Plan tier: the drop is almost entirely on the free tier. Pro and team retention held steady.

**Assistant:** Another big clue. Free-tier Feb-signup cohort specifically. Before we hypothesize, please pull the channel breakdown — that's the next discriminating variable.

**User:** Pulled. Free-tier paid-search signups in Feb had 56% retention. Free-tier organic held at 71%. Free-tier referrals held at 74%.

**Assistant:** Now we have a sharp description of what actually happened:

> Free-tier users acquired via paid search in February had a 30-day retention of 56% — well below their historical 68-72%. All other segments held steady.

That's the problem, stated precisely. "Retention dropped 8 points" was the symptom. The real question is: **why did free-tier paid-search signups from February behave differently?**

**Phase 2 — Hypothesize (candidate root causes).**

Top four hypotheses I can think of, ranked by a priori likelihood:

1. **Paid search targeting changed in February.** Marketing bid on new keywords, entered new geos, or a new audience segment started clicking the ads. The users being acquired are different.
2. **Landing page or signup flow changed for paid-search traffic.** A test was running; new users hit a worse variant.
3. **Free-tier product changed on Feb signups' day 1-7 experience.** A feature was gated, a limit was tightened, a bug was shipped.
4. **External event in February made free-tier paid-search signups less committed.** Example: a discount or promotion attracted users who never intended to stay.

Which of these do you already know the answer to? That'll save us a test.

**User:** I know #3 didn't happen — we had a feature freeze in February for the Q1 close. Nothing product-side changed for those users. I don't know about #1 and #2. I suspect #4 because marketing ran a "first month free" push in late January, but it was mostly for pro-tier conversion.

**Assistant:** Good — we can drop #3. #4 is plausible but you'd expect it to show in the discount-claimed segment, not in all free-tier paid-search users.

**Phase 3 — Test.**

The cheapest test is also the most discriminating: **ask marketing what changed in paid search in February.** Two specific questions:

1. Did targeting (keywords, geos, audience) change between January and February?
2. Was there a significant budget change or campaign launch in February?

Second test, parallel: **ask whether an A/B test was running on the paid-search landing page or signup flow in February.**

**User:** Answers back in an hour.

[One hour later]

**User:** Marketing confirms: they launched a new keyword cluster in early February targeting "free AI tools" broad-match. Budget on that cluster ramped from $0 to 30% of paid-search spend over February. Also confirmed: no A/B test on the landing page during that period.

**Assistant:** That's almost certainly it. The "free AI tools" broad-match cluster pulled in users with a different intent profile — people looking for a free utility, not people looking for your product specifically. They signed up to try, didn't find what they were searching for, and churned.

**Phase 4 — Verify.**

Before we declare this the root cause, one check: is the retention drop concentrated in users whose signup referrer matches the "free AI tools" keyword cluster? Marketing should be able to pull this. If those users retained at ~40% and the rest of paid-search held at 70%+, the story holds.

**User:** Pulled. Free-AI-tools cluster users retained at 38% at day 30. Other paid-search keywords held at 72%.

**Assistant:** Verified. The root cause is:

> Paid search expanded into a broad-match keyword cluster ("free AI tools") in February that attracted users with a mismatched intent. Those users retained at 38% at day 30, dragging the free-tier paid-search cohort to 56% and the overall 30-day retention number from 72% to 64%.

Now we can talk about fixes.

**Defense-in-depth on the fix:**

1. **Immediate:** pause the "free AI tools" keyword cluster. Retention will rebound next cohort.
2. **Mid-term:** add a check to the paid-search playbook: any new broad-match cluster launched with >10% of spend gets a 30-day retention check before expanding. One checkpoint.
3. **Long-term:** add retention-by-acquisition-channel to the weekly metrics review so this kind of thing surfaces in week 1, not month 2.
4. **Observability:** keep the retention-by-keyword-cluster report as a standing dashboard, not a one-off pull.

And critically — **the winback campaign is the wrong fix.** It would be targeting the right users (the churned ones) but for the wrong reason (motivating them to return). These users aren't churned customers who lost interest; they're searchers who never had intent in the first place. A winback email sent to them would get you low opens, high unsubscribes, and no real recovery.

Before you act on any of this, apply `verification-before-completion`: confirm with marketing that pausing the cluster is acceptable (they may have contractual commitments with the ad platform), and confirm with the product team that reframing the problem is more useful than the winback campaign they were about to run.

---

**What this demonstrates:**

- The assistant did not immediately take sides on "winback campaign vs. not." It ran the phases.
- Each phase produced a sharper version of the problem statement. "Retention dropped 8 points" became "free-tier paid-search Feb cohort retained at 56% because of a specific keyword cluster."
- Hypotheses were named and tested in the cheapest order. One was eliminated by prior knowledge (feature freeze). One was confirmed by asking a specific question (marketing). One was verified by a specific metric pull (retention-by-keyword-cluster).
- The defense-in-depth fix came with multiple checkpoints, not just the immediate action.
- The assistant surfaced that the user's original instinct (winback campaign is wrong) was correct — but grounded in a real diagnosis, not a gut call.

Without normalpowers, a typical LLM response would either agree with whoever asked ("sure, here's a winback email template") or produce a generic checklist of "reasons retention drops" without anchoring in the specific data.
