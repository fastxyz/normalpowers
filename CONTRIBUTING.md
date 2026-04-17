# Contributing to normalpowers

Thanks for considering a contribution. This guide covers the practical steps for submitting a change. For philosophy and conventions, read [CLAUDE.md](CLAUDE.md) first.

## Before You Start

- **For a new skill:** this repo's core is small on purpose. Skills here need to be useful across many different kinds of knowledge work — product, strategy, research, writing, ops, sales, and so on. Domain-specific skills (sales-discovery, 1:1-prep, specific-industry-workflow) belong in your own personal bundle. The `writing-skills` skill shows how to author them.
- **For an edit to an existing skill:** skills are behavior-shaping code, not prose. Small rewording can change how the LLM responds. Open a fresh session on at least one target platform (ChatGPT, Gemini, Claude) and verify behavior before opening a PR.
- **For a bug report with no fix:** open an issue with a minimal reproducible prompt — the system prompt used, the user message that triggered the problem, what the LLM did, what you expected. "The model went off the rails" is not actionable; "here's the exact session where it skipped brainstorming" is.

## The Workflow

1. **Open an issue first** if the change is non-trivial. A one-line wording fix can skip this; a restructured skill cannot. The issue conversation is where we agree on whether the change belongs in core.
2. **Fork the repo** and create a branch off `main`.
3. **Make the change.** Keep the diff focused — one problem per PR. Bundled unrelated changes get split or closed.
4. **Test on at least one target platform.** Paste the updated skill (or the full `normalpowers.md` master prompt with the change applied) into a fresh session on ChatGPT, Gemini, or Claude. Walk through a realistic scenario. Note what changed in behavior.
5. **Open a PR** using the template. Include:
   - The problem you're solving — a specific session, error, or behavior that motivated this.
   - The change, at a high level.
   - The platforms you tested on, and what you observed.
   - If you changed a skill, a before/after snippet of the LLM's behavior on a realistic prompt.

## Style

- **Voice: direct, terse, no filler.** Skills are read under time pressure.
- **Examples: knowledge work, not code.** Memos, campaigns, research, stakeholder decisions, 1:1s, retros. Avoid git, commits, tests, PRs, debugging, deploys.
- **No emojis in skill content** unless you're specifically testing emoji handling.
- **Frontmatter:** every `SKILL.md` starts with `---` YAML: `name` (hyphenated kebab-case matching the directory) and `description` (one sentence describing when to use it).
- **Don't rebrand or rewrite for tone alone.** If the change has no behavioral justification, it won't land.

## What Gets Accepted

- Concrete fixes to specific, reproducible problems on specific platforms.
- New examples or rationalizations added to existing skills, where you can show the addition catches behavior that the current list misses.
- Upstream-sync ports: bringing a clean improvement from [obra/superpowers](https://github.com/obra/superpowers) into our version of a shared skill. Cite the upstream commit.
- Documentation fixes — install steps that don't work, broken links, outdated screenshots.

## What Gets Rejected

- **New core skills without strong evidence of cross-domain utility.** Domain-specific skills belong in your own bundle, not core.
- **Platform integrations** — plugin manifests, hooks, tool wiring, CLI packaging. normalpowers is deliberately a portable markdown bundle.
- **Rebrands, reformats, or tone-unification sweeps** without a behavioral problem they solve.
- **"Compliance" rewrites** restructuring skills to match some external style guide without eval evidence that behavior improved.
- **Speculative fixes.** "A review agent flagged this" or "this could theoretically be confusing" is not a problem report. Show the session.
- **Fabricated content** — invented problems, made-up user quotes, hallucinated LLM behavior. Don't.
- **Bulk PRs** that point an agent at the issue list and tell it to "fix things." One problem per PR, genuinely understood.
- **Fork-specific changes.** If you maintain a fork with customizations and want to sync your fork's changes upstream, don't — publish your fork separately.

## If You're Using An AI Agent

AI agents are fine contributors when they're driven by a specific problem. They're terrible contributors when they're told "contribute to this repo."

If you're working with an agent on a PR:

1. **You** must have experienced the problem the PR solves, or have clear reason to believe it affects real users.
2. Read the full diff before submitting. If you can't explain every change in the diff, don't submit.
3. Run the test on a real LLM session yourself. Don't trust the agent's summary of what happened.
4. Fill in the PR template personally. Template answers that read like LLM output get closed.

The maintainers are happy to review agent-written PRs that meet this bar. They will close the ones that don't, because that's the only way the review queue stays tractable.

## License

By contributing, you agree that your contribution will be licensed under the MIT License (see [LICENSE](LICENSE)).

## Questions

Open an issue with the `question` label. We'd rather talk early than close a PR that went in the wrong direction.
