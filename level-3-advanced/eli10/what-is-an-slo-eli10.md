# What Is an SLO?

An SLO is like a pizza delivery promise. A restaurant cannot promise that every pizza arrives instantly, but it can promise that almost all arrive hot within a stated time and explain what happens when that promise is missed.

Imagine running a busy apartment building. The useful question is never “is the assistant smart?” It is “will the right person get the right help, quickly and safely, when something weird happens?” That turns a technical idea into an operating promise.

For an AI maintenance helper, the promise might be: 99.5% of eligible requests get a first useful response within ten seconds, and urgent safety reports are escalated correctly. The tiny allowed set of misses is the error budget. If too many pizzas arrive cold, the restaurant pauses new menu experiments and fixes delivery. AI teams should do the same: pause risky releases when reliability is spending the budget too quickly.

The trick is to make the promise visible. Write down what starts the process, what the system is allowed to use, what a good result looks like, and what happens when it cannot be sure. Then measure the real result, not just a convincing demo. If a resident gets a fast answer that sends them to the wrong vendor, the system did not succeed.

For Belle Realty, test this with ordinary work and uncomfortable cases: a missing unit number, a resident who changes their story, an old lease PDF, a provider outage, a message that tries to trick the assistant, or a request involving private information. Good systems have a safe way to pause, ask, escalate, or hand off to a human.

## Why it matters

This concept matters because production AI has real consequences: tenant trust, property operations, money, privacy, and safety. Understanding it helps you build a system people can rely on even when the situation is messy.
