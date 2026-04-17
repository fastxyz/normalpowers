---
name: brainstorming
description: Use before any creative work — drafting documents, planning initiatives, making decisions, designing processes, building proposals. Explores intent, requirements, and design through one-at-a-time questions before anyone starts producing.
---

# Brainstorming Ideas Into Designs

Help turn fuzzy ideas into fully formed designs through natural collaborative dialogue.

Start by understanding the current context, then ask questions one at a time to sharpen the idea. Once you understand what's being built, present the design and get explicit approval.

<HARD-GATE>
Do NOT start drafting, producing, executing, or otherwise acting on the idea until you have presented a design and the user has approved it. This applies to EVERY project regardless of perceived simplicity.
</HARD-GATE>

## Anti-Pattern: "This Is Too Simple To Need A Design"

Every project goes through this process. A one-pager, a two-slide deck, a quick email, a recurring 1:1 agenda — all of them. "Simple" projects are where unexamined assumptions cause the most wasted work. The design can be short (a few sentences for truly simple projects), but you MUST present it and get approval.

## Checklist

Walk through these in order. Keep the user informed at each step.

1. **Understand context** — what's already been decided, who the audience is, what constraints exist (deadline, budget, stakeholders).
2. **Assess scope** — if the request is actually multiple independent projects stacked together, flag it now and help the user decompose before going deeper.
3. **Ask clarifying questions** — one at a time, focused on purpose, constraints, success criteria.
4. **Propose 2–3 approaches** — with trade-offs and your recommended choice.
5. **Present the design in sections** — get explicit approval on each section before moving on.
6. **Write the design down** — produce a clean spec document the user can copy somewhere durable (Notion, Google Doc, wiki, etc.).
7. **Self-review the spec** — placeholders, contradictions, ambiguity, scope creep. Fix inline.
8. **User reviews the written spec** — ask them to read it before transitioning.
9. **Transition to execution** — apply the `writing-plans` skill to turn the approved design into an executable plan.

## Process Flow

```
Understand context
      │
      ▼
Is the scope one coherent project?
      │
      ├── no ──► help user decompose; pick one sub-project; restart
      │
      └── yes
          │
          ▼
Ask clarifying questions, one at a time
          │
          ▼
Propose 2–3 approaches with a recommendation
          │
          ▼
Present design in sections
          │
          ▼
User approves each section?
          │
          ├── no ──► revise, re-present
          │
          └── yes
              │
              ▼
Write the spec document
              │
              ▼
Self-review the spec (fix inline)
              │
              ▼
User reviews the written spec
              │
              ├── changes requested ──► revise, re-review
              │
              └── approved ──► apply `writing-plans` skill
```

**The terminal state is applying `writing-plans`.** Do NOT jump to producing artifacts, executing tasks, or invoking any other skill. The ONLY next step after brainstorming is `writing-plans`.

## The Process

**Understanding the idea:**

- Gather context first: what's already been decided, who the stakeholders are, what the deadline is, what constraints exist.
- Before detailed questioning, assess scope. If the request describes multiple independent deliverables (e.g., "build a go-to-market plan with pricing, messaging, launch ops, and press strategy"), flag this immediately. Don't spend questions refining details of a project that needs decomposition first.
- If the project is too large for a single spec, help the user decompose: what are the independent pieces, how do they relate, what order should they be tackled? Then brainstorm the first piece through the normal design flow. Each piece gets its own spec → plan → execution cycle.
- For appropriately-scoped projects, ask questions one at a time to refine.
- Prefer multiple-choice questions when possible; open-ended is fine otherwise.
- **Only one question per message** — if a topic needs more exploration, break it into multiple questions.
- Focus on understanding: purpose, constraints, success criteria, audience.

**Exploring approaches:**

- Propose 2–3 different approaches with trade-offs.
- Present options conversationally with your recommendation and reasoning.
- Lead with your recommended option and explain why.

**Presenting the design:**

- Once you believe you understand what's being built, present the design.
- Scale each section to its complexity: a few sentences if straightforward, up to 200–300 words if nuanced.
- Ask after each section whether it looks right so far.
- Cover the relevant facets depending on the work type — for a document: audience, structure, key claims, evidence, call to action. For a decision: options, criteria, recommended choice, reversibility. For an initiative: goal, scope, milestones, owners, risks.
- Be ready to go back and clarify if something doesn't make sense.

**Design for clarity and coherence:**

- Break the work into smaller units that each have one clear purpose and can stand alone. For a document: one section per idea. For an initiative: one milestone per outcome.
- For each unit, you should be able to answer: what is it for, how is it used, what does it depend on?
- If a section can't be understood without reading its neighbors, the boundaries need work.
- Large, tangled units are harder to execute and harder to review. When a section grows sprawling, that's usually a signal it's doing too much.

**Working in existing contexts:**

- If the user is extending something that already exists (a running project, an ongoing document, an established process), understand it before proposing changes. Follow the conventions already in place.
- Where existing work has problems that affect the new work (a stale assumption, an unclear responsibility), include targeted fixes in the design — the way a careful contributor improves something they're working in.
- Don't propose unrelated revisions. Stay focused on what serves the current goal.

## After the Design

**Documentation:**

- Write the validated design as a clean spec document. The user can save it wherever they keep project docs — Notion, a shared drive, a wiki, etc. Produce it as a single markdown block they can copy.
- A good title: `YYYY-MM-DD — <topic> — design`.

**Spec Self-Review:**

After writing the spec, look at it with fresh eyes:

1. **Placeholder scan** — any "TBD", "TODO", vague phrasing? Make it concrete or cut it.
2. **Internal consistency** — do any sections contradict each other? Does the approach match the goals?
3. **Scope check** — is this focused enough for a single plan, or does it need decomposition?
4. **Ambiguity check** — could any requirement be interpreted two different ways? Pick one and make it explicit.

Fix issues inline. No need to re-review — just fix and move on.

**User Review Gate:**

After the self-review, ask the user to read the written spec before proceeding:

> "Spec written. Please read it and let me know if you want to change anything before we move to the plan."

Wait for their response. If they request changes, make them and re-run the self-review. Only proceed once they approve.

**Transition:**

- Apply the `writing-plans` skill to turn the approved design into an executable plan.
- Do NOT start executing. `writing-plans` is the next step.

## Key Principles

- **One question at a time** — don't overwhelm.
- **Multiple-choice when possible** — easier to answer than open-ended.
- **YAGNI ruthlessly** — cut features/sections/steps that nobody actually needs.
- **Explore alternatives** — always propose 2–3 approaches before settling.
- **Incremental validation** — present the design, get approval, then move on.
- **Be flexible** — if a later answer contradicts an earlier assumption, go back and revise.
