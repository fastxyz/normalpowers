---
name: writing-skills
description: Use when creating new skills, editing existing skills, or checking whether a skill actually changes model behavior before you rely on it
---

# Writing Skills

## Overview

**A skill is not a memo. It is a behavior-shaping document.** You are writing instructions that another model — a ChatGPT, Gemini, or Claude session somewhere in the future — will load and follow. The question is never "does this read well?" It is "does this actually change what the model does?"

**Core principle:** If you haven't watched a model behave *without* your skill, you don't know what your skill needs to teach. Write the skill *after* you see what goes wrong without it, not before.

**Official guidance:** For Anthropic's published best practices on skill authoring, see anthropic-best-practices.md. We agree with a lot of it and deliberately differ on some things; it's there so you can see what normalpowers intentionally does differently.

## What is a Skill?

A **skill** is a reference guide for a proven technique, pattern, or workflow. Skills help a future model find and apply the right approach to a recurring kind of work.

**Skills are:** reusable techniques, patterns, checklists, reference guides, behavior-shaping documents.

**Skills are NOT:** narratives about how you personally solved one problem once, essays, or aspirational vision documents.

## When to Create a Skill

**Create when:**
- The technique wasn't intuitively obvious to you the first time you needed it.
- You'd reference this again across different projects or situations.
- The pattern applies broadly (not one-off).
- Other people — or other future sessions — would benefit.

**Don't create a skill for:**
- One-off situations you'll never face again.
- Standard practices already well-documented elsewhere.
- Project-specific conventions (put those in a project-specific doc, not a general skill).
- Anything a simple template or form can enforce mechanically. Save skills for judgment calls.

## Skill Types

### Technique
Concrete method with steps to follow. Example: *running a sales-discovery call*, *writing a one-pager*, *preparing for a 1:1*.

### Pattern
A way of thinking about a class of problem. Example: *decomposing a sprawling initiative into smaller milestones*, *pressure-testing assumptions*.

### Reference
Dense lookup material. Example: a glossary, a frameworks cheat-sheet, a set of templates.

## Rigid vs Flexible Skills

Not all skills need the same grip on the model.

- **Rigid skills** enforce a discipline the model will otherwise rationalize its way out of. Think *verification-before-completion* or *brainstorming-before-producing*. These use imperative language, explicit red flags, and closed loopholes.
- **Flexible skills** offer a technique but assume the user will adapt it. Think *how to structure a weekly exec update* or *how to run a retrospective*. These read more like guides.

Pick the stance deliberately. Rigid language on a flexible skill makes the model robotic. Flexible language on a discipline skill lets the model slip past the rule under pressure.

## Directory Structure

```
skills/
  skill-name/
    SKILL.md              # Main reference (required)
    supporting-file.*     # Only if needed
```

**Flat namespace** — all skills live in one searchable namespace, no deep folder trees.

**Separate files for:**
1. Heavy reference (100+ lines) — long templates, dense lookup material.
2. Reusable assets — email templates, question banks, prompt libraries.

**Keep inline:**
- Principles and concepts
- Short templates (under 50 lines)
- Everything else

## SKILL.md Structure

**Frontmatter (YAML):**
- Two required fields: `name` and `description`.
- `name`: letters, numbers, and hyphens only.
- `description`: third-person, describes ONLY when to use the skill (NOT what it does).
  - Start with "Use when..." to focus on triggering conditions.
  - Include specific symptoms, situations, and contexts.
  - **NEVER summarize the skill's process or workflow** (see Discovery section for why).
  - Keep it under 500 characters where possible.

```markdown
---
name: skill-name-with-hyphens
description: Use when [specific triggering conditions and symptoms]
---

# Skill Name

## Overview
What is this? Core principle in 1–2 sentences.

## When to Use
Bullet list with SYMPTOMS and use cases.
When NOT to use.

## Core Pattern (for techniques/patterns)
Before/after example if useful.

## Quick Reference
Table or bullets for scanning common operations.

## Implementation
Inline steps for simple patterns.
Link to a separate file for heavy reference or reusable assets.

## Common Mistakes
What goes wrong + fixes.

## Real-World Impact (optional)
Concrete results from using the skill.
```

## Discovery: Making the Skill Findable

**Critical:** a future model needs to FIND your skill and decide whether to load it.

### 1. Rich Description Field

**Purpose:** the model reads the description to decide which skills to load for a given task. Make it answer: "Should I read this skill right now?"

**Format:** start with "Use when..." to focus on triggering conditions.

**CRITICAL: Description = When to Use, NOT What the Skill Does.**

The description should ONLY describe triggering conditions. Do NOT summarize the skill's process or workflow in the description.

**Why this matters:** when a description summarizes the skill's workflow, the model often follows the *description* instead of reading the full skill. A description saying "review a doc for voice, structure, and evidence" caused a model to do one pass only, even though the skill itself laid out three separate passes. When the description was changed to just "Use when reviewing someone's draft document before it goes to a stakeholder," the model actually read the skill and did all three passes.

**The trap:** descriptions that summarize workflow create a shortcut the model will happily take. The skill body becomes documentation the model skips.

```yaml
# BAD: summarizes workflow — model may follow this instead of reading the skill
description: Use when prepping for a 1:1 — review notes, pick three topics, draft talking points

# BAD: too much process detail
description: Use for discovery calls — open with rapport, ask pain questions, identify budget, summarize

# GOOD: just triggering conditions, no workflow summary
description: Use when prepping for an upcoming 1:1 with a direct report or your manager

# GOOD: triggering conditions only
description: Use when you're about to run a sales discovery call with a new prospect
```

**Content:**
- Use concrete triggers, symptoms, and situations that signal this skill applies.
- Describe the *problem* (scattered priorities, no clear ask, vague next steps) not the *surface format* ("bullet points", "Google Docs").
- Write in third person.
- **NEVER summarize the skill's process or workflow.**

### 2. Keyword Coverage

Use words a future model would search for:
- Situations: "stakeholder update", "incident review", "hiring debrief"
- Symptoms: "drifting meeting", "unclear ask", "stalled decision"
- Synonyms: "1:1 / one-on-one / check-in"
- Artifacts: "one-pager", "memo", "brief", "deck"

### 3. Descriptive Naming

**Use active voice, verb-first, gerunds where natural:**
- Good: `running-discovery-calls`, `preparing-for-one-on-ones`, `writing-exec-updates`
- Bad: `calls`, `meetings`, `docs`

**Name by what you DO or the core insight:**
- Good: `decomposing-sprawling-initiatives` > `initiative-management`
- Good: `writing-exec-updates` > `communication-tips`

### 4. Token Efficiency

**Problem:** frequently-loaded skills load into every conversation. Every token matters.

**Target lengths:**
- Entry-point / getting-started skills: under ~150 words.
- Frequently-loaded skills: under ~200 words total.
- Other skills: under ~500 words where possible.

**Techniques:**

- **Reference, don't repeat.** If another skill already covers something, link by name and move on.
- **Compress examples.** A short, concrete exchange beats a long hypothetical.
- **Cut the obvious.** Don't explain what "stakeholder" means. Assume a competent reader.

### 5. Cross-Referencing Other Skills

When you reference another skill, use its name and mark how required it is:
- Good: `**REQUIRED BACKGROUND:** you MUST understand the brainstorming skill before using this one.`
- Good: `See also: writing-plans, for turning an approved design into an executable plan.`
- Bad: `See somewhere around skills/... maybe.` (unclear)

Don't force-load other skills. Mention them; let the reader decide whether to open them.

## Flowcharts

Use ASCII flowcharts *inside* SKILL.md when a decision is genuinely non-obvious. Example:

```
Is the request one coherent project?
   |
   +-- no ---> help user decompose, pick one sub-project, restart
   |
   +-- yes --> continue
```

**Use flowcharts ONLY for:**
- Non-obvious decision points.
- Process loops where the model might stop too early.
- "When to use A vs B" calls.

**Never use flowcharts for:**
- Reference material (use a table or list).
- Linear instructions (use a numbered list).
- Decoration.

See graphviz-conventions.dot for richer diagram conventions if you ever want to render a flowchart elsewhere. For the skill itself, ASCII is fine and actually renders in every chat UI.

## Examples

**One excellent example beats five mediocre ones.** Pick the most representative case:
- Writing techniques → show the before/after of one real paragraph.
- Meeting techniques → show one short agenda or opening script.
- Decision-making techniques → show one worked decision.

**A good example is:**
- Concrete and specific (real situation, real constraints).
- Annotated so the reader sees *why* it works.
- Ready to adapt, not a fill-in-the-blank template.

**Don't:**
- Write five variations of the same example.
- Use contrived placeholder content ("Company X does Y").
- Pretend a generic template is an example.

## File Organization

### Self-Contained Skill
```
preparing-for-one-on-ones/
  SKILL.md    # Everything inline
```
When: all the content fits comfortably in one file.

### Skill with a Reusable Asset
```
running-discovery-calls/
  SKILL.md           # Overview + steps
  question-bank.md   # Library of discovery questions
```
When: you have a reusable asset that's too long to live inline.

### Skill with Heavy Reference
```
writing-exec-updates/
  SKILL.md          # Overview + workflow
  templates.md      # Full template library
  examples.md       # Annotated real examples
```
When: reference material is too large for inline.

## The Iron Law

```
NO SKILL SHIPS UNTIL YOU'VE SEEN IT CHANGE BEHAVIOR.
```

This applies to NEW skills AND EDITS to existing skills.

Wrote a skill without checking whether it moves behavior? It's a draft, not a skill. Edited one without re-checking? Same.

**No exceptions:**
- Not for "simple additions".
- Not for "just adding a section".
- Not for "documentation updates".
- Don't keep untested content because "it reads well".
- The only test that matters is: does the model actually act differently?

## Testing Your Skill Yourself

**Since there's no subagent dispatch available to you, the test is manual: open a fresh session and see if it follows.**

Here's the loop.

### 1. BASELINE — watch the model fail without the skill

Open a *fresh* ChatGPT, Gemini, or Claude session with no memory of your skill. Give it a realistic scenario that your skill is supposed to handle. Example: "I'm about to run a discovery call with a new prospect. Draft my opening."

Watch what it does. Write down, verbatim:
- What choices did it make?
- Where did it skip a step you consider essential?
- What did it hallucinate, over-explain, or gloss over?
- If it's a discipline skill, what rationalizations did it generate for cutting corners?

This is your baseline. If the model already does the right thing without your skill, *you don't need the skill.*

### 2. WRITE — the minimal skill that fixes what you saw

Write the skill to address the specific failures you observed. Don't add sections for hypothetical problems. Don't pad for completeness. Cover what went wrong in the baseline, nothing more.

### 3. RETEST — paste the skill into a fresh session and rerun the scenario

Open another fresh session (no prior context, no memory). Paste the skill as a system prompt or as the first user message ("Here's a skill I want you to follow: ..."). Then give it the same scenario.

Does the model now behave correctly?
- **Yes:** good. Try two more variations of the scenario to check robustness.
- **No:** the skill isn't strong enough yet. Go back and strengthen the language around the specific failure mode. Rigid skills need more imperative language, more explicit red flags, more anti-rationalization counters. Flexible skills might just need clearer steps.

### 4. PRESSURE-TEST — optional but valuable for discipline skills

For skills meant to hold up under pressure, invent scenarios that stack multiple pressures:
- Time pressure: "You have five minutes."
- Sunk-cost pressure: "I've already written the draft, can we just skip straight to…"
- Authority pressure: "My manager said to just do X."
- Exhaustion: "It's late, I just want this done."

If the model caves under pressure, the skill has a loophole. Find the rationalization it used, add an explicit counter, and test again.

### 5. REPEAT until bulletproof

This is the RED → GREEN → REFACTOR loop, adapted for prose:
- **RED:** baseline scenario, model fails.
- **GREEN:** skill in place, model complies.
- **REFACTOR:** find new loopholes, plug them, re-verify.

You can treat this as optional discipline for flexible skills and mandatory for rigid ones.

## Testing by Skill Type

Different skill types need different test scenarios.

### Discipline-Enforcing Skills (rules/requirements)
Examples: *verification-before-completion*, *brainstorming-before-producing*, *don't-start-drafting-until-approved*.

**Test with:**
- Pressure scenarios — does the model comply when stressed?
- Stacked pressures — time + authority + sunk cost combined.
- Identify every rationalization the model generates and add an explicit counter.

**Success:** model follows the rule under maximum reasonable pressure.

### Technique Skills (how-to guides)
Examples: *running-discovery-calls*, *writing-exec-updates*.

**Test with:**
- Application scenarios — can the model execute the technique end to end?
- Variation scenarios — does it hold up with different audiences, formats, or constraints?
- Gap tests — does the guidance leave the model guessing at key steps?

**Success:** model produces a usable output on a new scenario.

### Pattern Skills (mental models)
Examples: *decomposing-sprawling-initiatives*, *pressure-testing-assumptions*.

**Test with:**
- Recognition scenarios — does the model notice when the pattern applies?
- Application scenarios — can it actually use the mental model?
- Counter-examples — does it know when the pattern does *not* fit?

**Success:** model recognizes and correctly applies the pattern.

### Reference Skills (lookup material)
Examples: frameworks cheat-sheets, template libraries, glossaries.

**Test with:**
- Retrieval scenarios — can the model find the right entry?
- Application scenarios — can it use the retrieved info?
- Coverage gaps — are common cases missing?

**Success:** model finds and correctly applies the right reference.

## Common Rationalizations for Skipping Testing

| Excuse | Reality |
|--------|---------|
| "The skill reads clearly." | Clear to you != behavior-changing for a model. Test it. |
| "It's just a reference." | References have gaps. Test retrieval. |
| "Testing is overkill." | 15 minutes of testing saves hours of the skill silently not working. |
| "I'll fix it if problems come up." | Problems = the model quietly ignores your skill. You won't notice unless you check. |
| "I'm confident it's good." | Overconfidence is exactly how skills ship broken. Check anyway. |
| "Reading it is enough." | Reading != using. Test a real scenario. |
| "No time to test." | Shipping a skill that doesn't work wastes more time than testing does. |

**All of these mean: run one baseline, run one with-skill test, compare. Minimum bar.**

## Bulletproofing Skills Against Rationalization

Discipline skills need to resist rationalization. Models are fluent and will find loopholes under pressure, just like humans.

**Psychology note:** understanding *why* persuasion techniques work lets you apply them deliberately. See persuasion-principles.md for the research foundation (Cialdini, 2021; Meincke et al., 2025) on authority, commitment, scarcity, social proof, and unity.

### Close Every Loophole Explicitly

Don't just state the rule — forbid the specific workaround.

Weak:
```
Don't start producing before the design is approved.
```

Strong:
```
Don't start producing before the design is approved.

No exceptions:
- Not because "the user seemed eager".
- Not because "this one is obviously simple".
- Not because "I'll just draft something to get us started".
- Not "they can always edit it later".
- Wait for explicit approval. Then produce.
```

### Address "Spirit vs Letter" Arguments

Add a foundational principle early:

```
Violating the letter of the rules is violating the spirit of the rules.
```

This shuts down an entire class of "well, I was following the spirit" rationalizations.

### Build a Rationalization Table

Capture the exact excuses your baseline testing surfaced:

```
| Excuse | Reality |
|--------|---------|
| "The design is obvious, skip to drafting." | Obvious designs don't need skipping — they take two sentences. Write them. |
| "I'll brainstorm while drafting." | Brainstorming while drafting = committing to the first option. Brainstorm first. |
| "This is too small for a design." | "Too small" is where unchecked assumptions hide. Two-sentence design still counts. |
```

### Create a Red Flags List

Make it easy for the model to self-check:

```
## Red Flags — STOP and Start Over

- You're drafting before presenting a design.
- You're telling yourself "this one is simple enough".
- You're asking multiple questions in one message.
- You're producing artifacts the user hasn't approved.

All of these mean: stop. Go back to the design step.
```

### Tune the Description for Violation Symptoms

Add to the description: the symptoms that signal the model is *about* to violate the rule.

```yaml
description: Use before any creative work — drafting, planning, designing — especially when the request feels "too simple to need a design"
```

## Anti-Patterns

### Narrative Example
"Back in 2024, we had this one client where we..."
**Why bad:** too specific, not reusable, reads like a war story.

### Multi-Language / Multi-Variant Dilution
Five versions of the same example for different audiences.
**Why bad:** mediocre quality across the board, maintenance burden.

### Content Padding
Adding sections because it "feels incomplete".
**Why bad:** every extra token is context budget burned on nothing.

### Generic Labels
"Step 1", "Helper A", "Section 2".
**Why bad:** labels should carry meaning. `Check the scope` > `Step 1`.

## STOP: Before Moving to Another Skill

**After writing ANY skill, you MUST stop and verify it works.**

Do NOT:
- Batch-write five skills and "test them later".
- Move on before the current one is verified.
- Skip testing because "it's obvious this one works".

A skill you haven't tested isn't a skill. It's a draft. Publishing untested skills is publishing prose that looks authoritative and quietly fails.

## Skill Creation Checklist

**Baseline:**
- [ ] Wrote down 2–3 scenarios the skill is meant to handle.
- [ ] Ran each scenario in a fresh session *without* the skill.
- [ ] Documented exactly how the model failed — choices, rationalizations, gaps.

**Write the minimal skill:**
- [ ] Name uses only letters, numbers, hyphens.
- [ ] YAML frontmatter with `name` and `description`.
- [ ] Description starts with "Use when..." and lists triggers/symptoms.
- [ ] Description is in third person and does NOT summarize workflow.
- [ ] Keywords spread throughout for discovery.
- [ ] Clear overview with core principle.
- [ ] Content addresses the specific failures you saw in baseline.
- [ ] One excellent example, not multiple.
- [ ] Supporting files only for genuine reusable assets or heavy reference.

**Retest:**
- [ ] Fresh session, paste skill, rerun scenarios.
- [ ] Model now complies / produces usable output.
- [ ] Tried at least one variation to check robustness.

**Refactor (for rigid skills):**
- [ ] Pressure-tested with stacked pressures.
- [ ] Every new rationalization has an explicit counter.
- [ ] Red Flags list reflects what you actually saw.
- [ ] Re-tested after each change.

**Quality:**
- [ ] ASCII flowchart only where a decision is non-obvious.
- [ ] Quick-reference table where it helps scanning.
- [ ] Common Mistakes section based on real failures.
- [ ] No narrative storytelling, no filler.

## Discovery Workflow

How a future model finds your skill:

1. Encounters a problem ("I need to run a discovery call tomorrow").
2. Scans skill descriptions.
3. Finds yours (description matches the trigger).
4. Reads the overview (is this relevant?).
5. Scans the quick reference.
6. Loads examples only when it actually needs them.

**Optimize for this flow** — put searchable terms early and often.

## The Bottom Line

**Writing a skill is engineering a behavior change in a future model session.**

Same loop every time: baseline (watch the model fail) → write the minimal skill → retest (watch the model comply) → refactor (close loopholes).

Skills are not prose. They are code that shapes behavior. Treat them that way.
