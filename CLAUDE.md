# normalpowers — Repository Guide

normalpowers is a portable prompt bundle. It turns any LLM — ChatGPT, Gemini, Claude (Projects, free-tier web chat, or API) — into a patient interviewer who asks the right questions before producing anything.

This file is the repository-level guide for humans and AI agents working in this repo. If you're using normalpowers as an end user, start with [README.md](README.md) instead.

## What's In Here

```
.claude-plugin/         plugin manifest for `/plugin install normalpowers@fastxyz`
hooks/                  session-start hook — injects normalpowers.md at Claude Code session start
skills/                 plain-markdown skill files — the product
normalpowers.md         the master prompt (paste-as-system-prompt)
README.md               what it is + per-platform install
CONTRIBUTING.md         how to submit changes
docs/                   philosophy, upstream-sync, comparison
examples/               transcripts showing normalpowers in action
LICENSE                 MIT (Jesse Vincent 2025 + Pi Squared Inc. 2026)
NOTICE                  derivative-work attribution to superpowers
```

## Project Philosophy

normalpowers is a fork of [superpowers](https://github.com/obra/superpowers) by Jesse Vincent. We inherited the core insight — **make the LLM check for a relevant skill before it acts** — and stripped the software-development scaffolding so the remaining pattern works for any knowledge worker.

Three things matter:

1. **Portability over plugin integration.** Every skill must work on a vanilla LLM chat with no tool system, no subagents, no hooks. If a skill needs platform-specific machinery, it doesn't belong here.
2. **Generalist, not domain-specific.** Core skills are useful across product, strategy, research, writing, ops, sales, and many others. Skills for one specific domain belong in a user's own personal bundle — see the `writing-skills` skill for how to author them.
3. **Don't hard-diverge from upstream.** We keep directory names where we can and maintain an `upstream` remote pointing at obra/superpowers so improvements can be cherry-picked. See [docs/upstream-sync.md](docs/upstream-sync.md).

## If You Are an AI Agent Working In This Repo

Before modifying anything in `skills/`:

1. **Read the skill you're about to change, end to end.** Skills are behavior-shaping code, not prose. Small edits to a Red Flags table or a rationalization list can meaningfully change how the LLM behaves.
2. **Read the `writing-skills` skill.** That's the meta-skill for how skills in this project are structured and tested.
3. **Test the change on a real LLM.** A change that "looks better" without a real session to back it up is a guess. Open a fresh ChatGPT / Gemini / Claude session, paste the updated skill, and see if behavior improved.
4. **Don't rebrand, reformat, or restructure for its own sake.** normalpowers deliberately keeps structural parity with superpowers where content didn't diverge — it makes upstream sync easier. If you want to restructure, say why in the PR and be ready to defend the choice.

## Conventions

- **Paths mirror superpowers where possible.** `skills/brainstorming/`, `skills/writing-plans/`, `skills/verification-before-completion/`, `skills/writing-skills/` — same names as upstream so `git cherry-pick` works.
- **Renamed skills:** `using-normalpowers` (from `using-superpowers`), `following-your-plan` (from `executing-plans`), `systematic-problem-solving` (from `systematic-debugging`), `receiving-feedback` (from `receiving-code-review`). Porting upstream improvements to these requires manual work.
- **Frontmatter:** every `SKILL.md` starts with `---` YAML: `name` (hyphenated kebab-case matching the directory) and `description` (one line describing when to use it).
- **Voice:** direct, terse, no filler. Skills are read under time pressure — they have to land fast.
- **No emoji in skill content** unless specifically testing emoji rendering. Keep the surface boring so the instructions read as the instructions.
- **Examples drawn from knowledge work**, not code. Product launches, stakeholder memos, research questions, strategy decisions, 1:1 prep, incident retros.

## Not Accepted

These get closed without review:

- **New platform integrations** beyond the existing Claude Code plugin manifest. We ship one — `/plugin install normalpowers@fastxyz` via `.claude-plugin/` + `hooks/`. Adding Cursor, Codex, or others requires a design doc and maintainer approval.
- **Domain-specific skills** (sales-discovery, specific-industry-workflows). Use `writing-skills` to author them in your own bundle.
- **"Compliance" rewrites** restructuring skills to match some external style guide without eval evidence that behavior improved.
- **Rebrands, rewording sweeps, or tone-unification PRs** without a specific behavioral problem they solve.
- **Fabricated content.** Invented problems, made-up quotes from users, hallucinated LLM responses. Don't.

See [CONTRIBUTING.md](CONTRIBUTING.md) for the practical PR workflow.

## Upstream Sync

We stay close to [obra/superpowers](https://github.com/obra/superpowers) on purpose. If you're touching a skill that also exists upstream:

1. Check whether the upstream version has moved: `git fetch upstream && git log upstream/main -- skills/<name>/`.
2. Prefer porting upstream's fix to our version over reinventing.
3. If you're making a normalpowers-specific change (dropping a software example, rewording for generalist readers), keep the structural shape identical to upstream so future cherry-picks stay clean.

Details: [docs/upstream-sync.md](docs/upstream-sync.md).

## License

MIT. Jesse Vincent's 2025 copyright is retained verbatim in [LICENSE](LICENSE). Pi Squared Inc. and normalpowers contributors hold 2026. Derivation is documented in [NOTICE](NOTICE).
