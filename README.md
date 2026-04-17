# normalpowers

**Give any LLM the power to ask the right question.**

normalpowers is a portable prompt bundle that turns ChatGPT, Gemini, or any flavor of Claude into a patient interviewer who asks the right questions, surfaces unexamined assumptions, and walks you through rigorous thinking on any knowledge-work problem.

No plugin to install. No tool system required. Paste the master prompt, start a conversation.

---

## Built on the shoulders of superpowers

normalpowers is a fork of **[superpowers](https://github.com/obra/superpowers)** by [Jesse Vincent](https://blog.fsck.com/). superpowers is the original — a Claude Code plugin that makes LLMs meaningfully smarter at software work by giving them a metacognitive layer: **"before you act, check which skill applies."**

Jesse's insight is the whole idea. We are deeply grateful the project exists.

What normalpowers changes:

- **Target: every LLM**, not just Claude Code. ChatGPT Custom GPTs, Gemini Gems, Claude Projects, Claude.ai free tier, Claude API, and anything else with a system-prompt slot.
- **Scope: knowledge work**, not software development. The skills we kept (`brainstorming`, `writing-plans`, `verification-before-completion`, `writing-skills`) were already domain-neutral. We re-exampled them for product, strategy, research, writing, ops, sales, and more.
- **Stripped:** `test-driven-development`, `executing-plans` (replaced by `following-your-plan`), `using-git-worktrees`, `subagent-driven-development`, `requesting-code-review`, `dispatching-parallel-agents`, `finishing-a-development-branch`, and all plugin/hook/tool-system machinery.

If you build software, use **superpowers** — it is tuned for that and sharper than anything we could offer. If you work on everything else, try **normalpowers**.

See [docs/comparison-to-superpowers.md](docs/comparison-to-superpowers.md) for a full side-by-side.

---

## What It Is

Eight skills that shape how your LLM approaches knowledge work:

| Skill | Use when… |
|---|---|
| `brainstorming` | You're figuring out WHAT to build, write, decide, or plan. Before drafting. |
| `writing-plans` | You have a clear target and need to break it into executable steps. |
| `following-your-plan` | A plan exists and you're executing it. |
| `systematic-problem-solving` | Something is broken, underperforming, or unexpected. You want to understand why before fixing. |
| `verification-before-completion` | You're about to claim "done" or "ready". Verify with evidence first. |
| `receiving-feedback` | You got critique and need to evaluate and respond. |
| `writing-skills` | You want to author a new skill for your own workflow. |
| `using-normalpowers` | The entry-point skill every conversation starts with. |

The LLM is instructed to check which skill applies **before** responding — even before asking clarifying questions. This is the whole trick.

---

## Install

Copy `normalpowers.md` from this repo. Paste it into whichever platform you use.

Install guide priority: Claude first (it's our internal stack), then ChatGPT and Gemini.

### Claude.ai — Projects (recommended)

1. Open [claude.ai](https://claude.ai) → **Projects** → **New project**.
2. In the project's **Custom instructions** field, paste the full contents of [`normalpowers.md`](normalpowers.md).
3. (Optional, improves behavior) Download the latest [`normalpowers-vX.Y.Z.zip`](https://github.com/fastxyz/normalpowers/releases/latest) from Releases, extract it, and drag the extracted folder into the project's knowledge section. Or upload the individual `skills/*/SKILL.md` files from GitHub if you prefer.
4. Start a chat in the project. Say *"I want to plan a hackathon"* — Claude should enter brainstorming mode, asking one question at a time, rather than jumping to a plan.

### Claude.ai — Free tier (no Projects)

1. Start a new conversation.
2. Paste [`normalpowers.md`](normalpowers.md) as your first message.
3. Continue the conversation from there. The behavior persists for the session. Repeat the paste for each new session.

### Claude API / SDK

Pass `normalpowers.md` as the `system` parameter:

```python
from anthropic import Anthropic

with open("normalpowers.md") as f:
    system_prompt = f.read()

client = Anthropic()
response = client.messages.create(
    model="claude-opus-4-7",
    system=system_prompt,
    max_tokens=4096,
    messages=[{"role": "user", "content": "I want to plan a hackathon."}],
)
```

For deeper behavior, concatenate selected `skills/*/SKILL.md` files after the master prompt.

### ChatGPT — Custom GPT (Plus/Team)

1. ChatGPT → **Explore GPTs** → **Create**.
2. In the **Configure** tab's **Instructions** field, paste [`normalpowers.md`](normalpowers.md).
3. Under **Knowledge**, upload the eight `skills/*/SKILL.md` files so the GPT can retrieve them when the master prompt references a skill by name.
4. Save. Start a conversation.

If the GPT ignores the skills, try pasting the master prompt as the opening user message instead — Custom GPT Instructions are sometimes deprioritized for long prompts.

### Gemini — Gems (Advanced)

1. Gemini → **Gems** → **New Gem**.
2. In **Instructions**, paste [`normalpowers.md`](normalpowers.md).
3. Gems don't support file retrieval, so the individual skill files must be inlined. For full-fidelity behavior, paste the relevant skill file into the chat when the Gem announces "Using `<skill>`".

Known issue: Gemini sometimes ignores long instruction blocks. If you see it skipping straight to answers without the skill-check preamble, shorten the master prompt or paste it as the first chat message.

### Other LLMs

Any LLM with a "system prompt" or equivalent (Mistral, Llama variants, local models): same pattern as Claude API. Paste `normalpowers.md` as the system message.

---

## Quick Demo

After installing on any platform, try this conversation:

> **You:** I want to plan a launch for our new onboarding flow next month.
>
> **LLM (with normalpowers):** Using `brainstorming` to sharpen this launch plan.
>
> Before I suggest anything, a few questions — one at a time.
>
> Who is the primary audience for the new onboarding flow — existing customers, new signups, or a specific segment?

Without normalpowers, most LLMs will produce a plausible-looking launch plan template in the first response. That's the failure mode normalpowers exists to prevent.

See [`examples/`](examples/) for longer transcripts.

---

## Philosophy

> **"Normal" thinking is hard.** Asking the right question, sharpening an idea before producing anything, decomposing into small verifiable steps, checking evidence before declaring done — these are the habits that distinguish a careful senior operator from a frantic junior one. LLMs default to frantic junior. normalpowers makes them act like careful seniors.

Full thesis: [docs/philosophy.md](docs/philosophy.md).

---

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) before opening a PR. Short version:

- **Issue-first** for non-trivial changes.
- **One problem per PR**, tested on a real LLM session.
- Domain-specific skills (sales-discovery, 1:1-prep, specific-industry-workflow) belong in your **own** bundle, not core. The `writing-skills` skill is the entry point for authoring them.
- Platform integrations, rebrands, and tone sweeps without a behavioral problem get closed.

## Staying Close to Upstream

normalpowers deliberately mirrors superpowers' directory structure where we kept a skill unchanged in shape, so that `git cherry-pick` from obra/superpowers remains tractable. See [docs/upstream-sync.md](docs/upstream-sync.md) for the sync workflow.

## License

MIT License. Jesse Vincent's 2025 copyright is retained verbatim in [LICENSE](LICENSE). Pi Squared Inc. and normalpowers contributors hold 2026. Derivation is documented in [NOTICE](NOTICE).

## Acknowledgements

- **[Jesse Vincent](https://blog.fsck.com/)** and the team at [Prime Radiant](https://primeradiant.com) — for superpowers, and for the insight that makes this whole approach work.
- **[Pi Squared Inc.](https://pi2.network) / [FAST](https://fast.xyz)** — for the room to build this and the internal dogfooding that shaped the knowledge-work examples.
