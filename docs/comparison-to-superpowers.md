# Comparison to superpowers

normalpowers is a fork of [superpowers](https://github.com/obra/superpowers) by [Jesse Vincent](https://blog.fsck.com/). superpowers is the original — the insight that "before you act, check which skill applies" is entirely Jesse's, and the skills we kept are in most cases light edits over the ones he wrote. We are grateful the project exists and grateful it is MIT-licensed. normalpowers is what you get when you take that insight and aim it at knowledge workers who aren't writing code.

## Skill-by-skill

| superpowers | normalpowers | Why different |
|---|---|---|
| `using-superpowers` | `using-normalpowers` | Renamed. Same entry-point pattern — every conversation starts here. Examples swapped from CLI sessions to knowledge-work conversations. |
| `brainstorming` | `brainstorming` | Same directory name, same structure. Re-exampled: instead of "design this API," triggers are "plan this launch," "write this memo," "decide this hire." |
| `writing-plans` | `writing-plans` | Same directory name, same structure. Plans break down into memo sections, stakeholder messages, and research steps rather than functions and tests. |
| `executing-plans` | `following-your-plan` | Renamed to de-emphasize the software connotation of "execute." Same core principle: silent deviations from the plan are the failure; named deviations are fine. |
| `systematic-debugging` | `systematic-problem-solving` | Renamed. Four phases (reproduce, hypothesize, test, verify) kept verbatim. Examples are campaign misses, retention drops, stalled deals — not stack traces. |
| `verification-before-completion` | `verification-before-completion` | Same directory name. "Your internal belief is not evidence" transfers directly. External evidence is now stakeholder sign-off and fresh metric pulls, not passing tests. |
| `receiving-code-review` | `receiving-feedback` | Renamed to cover any critique, not just code review — manager feedback, peer review of a memo, pushback on a decision. Same separate-the-emotion-from-the-merit frame. |
| `writing-skills` | `writing-skills` | Same directory name, same structure. The meta-skill is domain-neutral already. |

**Dropped entirely** — software-specific or plugin-specific, no knowledge-work analog we were willing to invent on day one:

- `test-driven-development`
- `using-git-worktrees`
- `subagent-driven-development`
- `requesting-code-review`
- `dispatching-parallel-agents`
- `finishing-a-development-branch`
- all plugin manifests, hook definitions, and Skill-tool wiring

If a knowledge-work version of any of these turns out to be useful, it will be written from scratch using `writing-skills` — not back-ported from the code versions.

## Structural differences

superpowers is a Claude Code plugin. It has a plugin manifest, a hook system, a Skill tool that the agent invokes, subagent orchestration, and assumptions about a working tool environment (shell, editor, git, tests).

normalpowers has none of that. It is plain markdown by design:

- No plugin manifest. The install is copy-paste.
- No hooks. The master prompt does the work that hooks would do — "check for a skill before responding."
- No Skill tool. Skills are announced in prose ("Using `brainstorming` to sharpen this launch plan") and the relevant SKILL.md is either already in the model's context or pasted on request.
- No subagents. There is only the current conversation.
- No tool-system assumptions. Works on Claude.ai free tier, ChatGPT, Gemini, and API sessions equally.

This is a deliberate scope constraint. Portability across every LLM front-end beats deeper integration with one of them.

## Recommendation

**If you are writing software, use [superpowers](https://github.com/obra/superpowers).** It is tuned for that work and sharper on that axis than anything we could offer. The TDD and subagent skills in particular have no substitute here.

**If you are doing any other kind of knowledge work** — product, strategy, research, writing, ops, sales, management — **try normalpowers.** The skills are shaped for the work you actually do, and the install works on whatever LLM you already use.

Using both, on different projects, is fine and expected.
