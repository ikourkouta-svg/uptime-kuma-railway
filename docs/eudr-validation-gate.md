# EUDR Validation Gate — Entry 01, Days 1–10

Companion to [the strategy memo](./autonomous-ai-ventures.md). This is the gate that
decides whether the EU Compliance Desk gets built at all.

Live tracker: https://claude.ai/code/artifact/4514d732-670f-41f9-af4a-2f5b5d909053

## The rule

Twenty conversations before a line of code:

- **10** African exporters or cooperatives in coffee, cocoa or timber
- **10** EU importers from the existing book

**Gate: at least 6 qualified.** Fewer than six → do not build. Move to Entry 03
(Tender & Grant Radar, €2–4k, four weeks to first invoice) and re-run this gate in
the spring. Ten days spent instead of €12,000.

The gate can clear early — six qualified is a go whether it arrives at call nine or
call twenty.

## Scoring

| Verdict | Condition | Meaning |
|---|---|---|
| **Qualified** | No plan **and** budget attached | Deadline has landed, money exists. Pilot candidate. |
| **Warm** | No/partial plan, budget unclear | Real exposure, unresolved funding. Second call. Does not count toward the gate. |
| **Out** | Plan in place, or no budget | Already served, or not yet feeling the deadline. Log and move on. |

> A "yes, we'd use that" with no budget line is **not** a qualified prospect. It is the
> single most common way this gate gets fooled.

## Script

Do not pitch. You are measuring whether the deadline has landed, not selling a dossier.

**Opener — exporter side**
> "You ship into Europe. From 30 December the buyer has to file a deforestation
> statement with your farm coordinates in it, or the container does not clear. I am
> mapping who is ready. Where are you with it?"

**Opener — importer side**
> "You are the operator on record for EUDR, so the liability sits with you, not the
> exporter. How many of your suppliers can actually give you geolocation data today?"

**The three probes**
1. "Who is producing the due-diligence statement — you, the buyer, or nobody yet?"
2. "Is there money set aside for it this year, or is it still unbudgeted?"
3. "What happens to the December shipment if it is not ready?"

**The close**
> "I am building something for exactly this and taking three paid pilots. Not free —
> I need to know it is worth paying for. Should I come back to you with a number?"

## Fields captured per call

Organisation · country · side (exporter/importer) · commodity · existing EUDR plan
(none / partial / in place) · budget attached (yes / unknown / no) · annual volume to
EU in tonnes · decision-maker reached · notes (deadline exposure, current adviser,
objection).

## If the gate clears

Convert three of the qualified prospects into **paid** pilots before writing code.
Free pilots teach nothing about willingness to pay. Target for the build: first due
diligence statement produced end to end in under thirty minutes of owner time.
