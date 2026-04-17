# Philosophy

## The problem

LLMs default to frantic junior behavior. Given a prompt, they produce plausible-looking output fast — a memo, a plan, a diagnosis, a response — and they do it before the question that would have surfaced the unexamined assumption gets asked. The output is confident, fluent, and wrong in ways that only reveal themselves when it hits a real stakeholder: a CFO who notices the missing number, a board member who pokes at the soft claim, a teammate who flags the contradiction on page two.

The failure is not that the model can't think. It's that nothing in its default loop forces it to pause, check what kind of task this is, and run the right procedure. "Be helpful, answer quickly" is a bad prior for work that other people are going to rely on.

## The insight (credit: superpowers)

Jesse Vincent's superpowers project solved this for software work with a single move: **before producing anything, check which skill applies**. The skill — a small piece of behavior-shaping markdown — forces the pattern of a careful senior operator. Ask the right question first. Sharpen the idea before drafting. Decompose into small verifiable steps. Gather evidence before claiming done.

The check is the whole trick. Without it, the model optimizes for fluency. With it, the model runs a procedure that a careful human would run.

## Why this generalizes

The failure modes that TDD and systematic debugging fix in software have direct analogs in every knowledge-work domain.

- Premature optimization in code is premature drafting in a memo — committing to a frame before the problem is understood.
- Missed edge cases in a function are unexamined counter-arguments in a strategy doc.
- Claiming "done" without running the tests is claiming "ready to ship" without checking that the stakeholder who has to act on it can actually read it and decide.

A strategy memo with an unexamined core claim is the same bug as a function with an unchecked edge case. The discipline transfers because the failure mode is the same — skipping the step that would have caught the mistake.

The skills in normalpowers are the knowledge-work versions of that discipline. Brainstorm before you draft. Write a plan before you execute. Follow the plan instead of silently improvising. Diagnose before you fix. Check evidence before you declare done. Evaluate feedback on merit instead of capitulating or dismissing.

## What normalpowers optimizes for

Durable clarity over speed. You get the output later than you would from a raw LLM. The output you get is something you can defend to a CFO, a board, a team, or your future self six months from now.

For quick throwaway questions, normalpowers is overkill and that's fine — tell the model to skip the skill check. For anything a human will read, sign off on, or act on, the extra minutes are the price of work that holds up.

## What it doesn't do

normalpowers does not turn the LLM into a different personality. The model is still warm, still concise, still itself. The skills are scaffolding underneath the normal voice, not a replacement for it. If the output reads like a different bot wrote it, something is wrong.

It also doesn't replace human judgment. The skills force the model to ask the questions a careful senior would ask — you still have to answer them. The point is to get the right questions on the table early, not to automate the thinking away.
