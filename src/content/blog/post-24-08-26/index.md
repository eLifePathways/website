---
title: "Stewarding Kotahi: what we've shipped, and what we've learned"
date: 2026-08-24
imageAlt: "Kotahi logo"
image: "./kotahi-logo.png"
summary: "eLife Pathways has stewarded Kotahi since June 2026. Four releases on: COAR Notify support, faster imports at scale, and a new interface."
---


*In June 2026 we announced that eLife Pathways had taken on stewardship of Kotahi, the open-source submission and peer review platform. Four releases later, Kotahi supports the COAR Notify protocol, runs faster and more reliably at scale, and has begun a new chapter of interface work. Here's what we've shipped, and what it opens up.*

## What is Kotahi?

Kotahi is an open-source platform for submission, peer review and publishing, serving journals, preprint servers, preprint review services and micropublications. It grew out of PubSweet at the Coko Foundation, was launched in 2021 under community governance, and has been stewarded by eLife Pathways since June 2026. Today, it supports the review-and-assessment component of eLife's Publish-Review-Curate (PRC) workflow, as well as research communities including MetaRoR, Lifecycle Journal and NASA's Astromaterials Data System (Astromat).

Kotahi is multi-tenant by design: a single installation can serve many independent journals, each with its own workflows, forms and branding. Its form builder lets a publisher shape a submission, review or decision process without writing code. It is genuinely open — MIT-licensed, community-governed, with no licence fees and no lock-in.

## Kotahi now supports COAR Notify

The release we'd point to first landed on 3 July 2026: Kotahi now supports the COAR Notify protocol.

COAR Notify is an open standard, maintained by the Confederation of Open Access Repositories, that enables repositories, preprint servers, overlay journals and peer review services to exchange standardised messages. It is already in use at bioRxiv, HAL, PREreview, Peer Community In and Episcience.

This unlocks the publish-review-curate model, working directly within Kotahi. An author can request a peer review or create an overlay-journal publication directly from a deposited preprint. Datasets can be linked to articles across repositories. Earlier 2026 releases added DataCite support, custom metadata mapping and token-based authentication to the same integration, so the July release completes a line of work that has been building all year.

This is the part that reaches beyond Kotahi's users. An interoperability standard earns its value from the number of independent systems that implement it — every new implementation makes the standard more useful to everyone already relying on it, including communities we have nothing to do with. Kotahi is now one of those systems.

## Kotahi now runs faster, and at greater scale

Our June 2026 releases went into the engine room, and the results are the kind users feel immediately.

Bulk manuscript imports in Kotahi now run in staggered batches, so large batches move through the system without straining it. We separated the job queue's database connection from the main application connection, which means Kotahi runs reliably on managed Postgres clusters and pooled database setups — a meaningful unblocking for anyone hosting at scale. We fixed the Production page, the editor toolbar and the CMS file browser.

We have moved the Kotahi client to a TypeScript build, with the server to follow shortly, and reintroduced Storybook for the component library. That groundwork makes every future change faster to build and safer to ship — and it's why the interface work below can move at pace.

## A new Kotahi interface, arriving in steps

The 11 August 2026 release brought the first of the interface changes: a new menu and pages user experience.

We've heard clearly from the Kotahi community that the interface has room to improve, and this is the first step in a deliberate, incremental programme. No workflows changed, and no process steps moved — anyone using Kotahi today should carry on exactly as before and will simply find things a little easier to navigate with each release.

We've chosen this route on purpose. Kotahi's architecture is sound; it needs an interface that guides authors, reviewers, and editors through the work they came to do. Delivering that in steps means the community sees progress continuously and can shape it as it happens.

## Working with our Communities

Kotahi's communities told us their preferences on how we can best collaborate, and a more intuitive experience came to the top of the list. Every release now moves the interface forward, and we share our plans and release notes as we go so nothing lands as a surprise.

## What we've learned

**Small, frequent releases build trust.** Four Kotahi releases in two months, each explainable in a paragraph, have given the community a much clearer view of where the platform is going than a single large drop would have.

**Stewardship is a relationship.** The most valuable thing we've picked up isn't code — it's the accumulated knowledge of a community that has been building this platform for years. That comes from conversations, and we're having a lot of them.

**Interoperability compounds.** COAR Notify support took real engineering effort, and its value grows every time another system joins the network. That's a good shape for investment.

## What's next for Kotahi

Kotahi speaking an open interoperability standard is the foundation for something bigger: submission, peer review and publication as one connected pipeline rather than a series of handoffs. That's the direction eLife Pathways is building towards, and COAR Notify is the first structural piece of it.

Nearer term: continued interface improvements shaped by community feedback, and refreshed public documentation. We'll report on both.

## Get involved

Kotahi is open source and developed in the open — the code is public at [github.com/eLifePathways/Kotahi](https://github.com/eLifePathways/Kotahi). If you run a journal, a preprint review service or a research community and want to explore whether Kotahi fits, or you'd like to contribute, get in touch at [elifepathways.org/#get-involved](https://elifepathways.org/#get-involved)
