---
ai_generated: true
model: "openai/gpt-5.2-codex@2026-02-07"
operator: "johnmillerATcodemag-com"
chat_id: "cqrs-architecture-instructions-20260207"
prompt: |
  @solution-architect create an instruction file for a CQRS architecture
started: "2026-02-07T17:00:00Z"
ended: "2026-02-07T17:20:00Z"
task_durations:
  - task: "requirements analysis"
    duration: "00:05:00"
  - task: "instruction drafting"
    duration: "00:12:00"
  - task: "review and refinement"
    duration: "00:03:00"
total_duration: "00:20:00"
ai_log: "ai-logs/2026/02/07/cqrs-architecture-instructions-20260207/conversation.md"
source: "johnmillerATcodemag-com"
applyTo: "**/*"
---

# CQRS Architecture Instructions

## Overview

Guidance for designing and implementing Command Query Responsibility Segregation (CQRS).
Use this when separate write and read models improve scalability, performance, or domain clarity.

**Target Audience**: AI assistants, architects, senior developers
**Scope**: CQRS decision criteria, components, data models, consistency, integration, and validation

**Related Documentation**:

- [AI-Assisted Output Instructions](.github/instructions/ai-assisted-output.instructions.md)
- [Vertical Slice Architecture](.github/instructions/vertical-slice-architecture.instructions.md)
- [Business Rules to Vertical Slices](.github/instructions/business-rules-to-vertical-slices.instructions.md)

## Table of Contents

- [When to Use CQRS](#when-to-use-cqrs)
- [Core Principles](#core-principles)
- [Architecture Components](#architecture-components)
- [Command Model Design](#command-model-design)
- [Query Model Design](#query-model-design)
- [Consistency and Transactions](#consistency-and-transactions)
- [Integration and Messaging](#integration-and-messaging)
- [Operational Concerns](#operational-concerns)
- [Anti-Patterns](#anti-patterns)
- [Migration Strategy](#migration-strategy)
- [Quality Checklist](#quality-checklist)
- [Examples](#examples)

## When to Use CQRS

Use CQRS when one or more are true:

- Read and write workloads scale differently.
- Read models require denormalization, caching, or projections.
- Write model needs strong invariants and task-focused workflows.
- Auditing, event sourcing, or integration events are required.
- Query complexity is slowing down transactional throughput.

Avoid CQRS when:

- The domain is small and reads/writes are balanced.
- There is no clear boundary between commands and queries.
- Operational overhead is not justified.

## Core Principles

- Commands change state; queries never change state.
- Write model enforces invariants; read model optimizes retrieval.
- Models can be stored separately and evolve independently.
- Eventual consistency is acceptable for read model sync.

## Architecture Components

Minimum components:

- **Command API**: Accepts commands, validates, enforces invariants.
- **Command Handler**: Orchestrates domain operations.
- **Write Store**: Transactional database for aggregates.
- **Event/Change Publisher**: Emits domain or integration events.
- **Projection/Read Updater**: Builds read models.
- **Query API**: Serves read models with filtering and pagination.
- **Read Store**: Query-optimized database (relational, document, or search).

## Command Model Design

- Use task-based commands: `CreateOrder`, `ApproveOrder`.
- Validate at the command boundary; reject invalid commands fast.
- Use aggregates to enforce invariants and consistency rules.
- Keep command handlers deterministic and side-effect controlled.
- Write to a single source of truth (write store).

Command rules:

- Commands are imperative and intention revealing.
- Commands can fail; queries should not.
- One command should target one aggregate root.

## Query Model Design

- Shape queries for the UI or consumer use case.
- Prefer read models that avoid joins and complex calculations.
- Use projections updated from events or change feeds.
- Keep read models versioned and rebuildable.

Query rules:

- Queries are idempotent and side-effect free.
- Read models are optimized for latency and throughput.

## Consistency and Transactions

- Expect eventual consistency between write and read models.
- Define consistency requirements per feature (strong vs eventual).
- Use the outbox pattern for reliable event publication.
- For strong consistency, query the write model directly or use dual-write safeguards.

Consistency decision matrix:

- **Strong**: Payments, inventory, security
- **Eventual**: Dashboards, activity feeds, analytics

## Integration and Messaging

- Publish domain events after successful writes.
- Use message brokers for async projection updates.
- Support replay to rebuild read models.
- Version events; avoid breaking changes to event contracts.

## Operational Concerns

- Monitor command latency, projection lag, and read freshness.
- Provide backfill and rebuild procedures for read models.
- Implement idempotency for projection consumers.
- Use separate scaling for read and write paths.

## Anti-Patterns

- Mixing query logic in command handlers.
- Sharing the same ORM model for reads and writes.
- Over-using CQRS for simple CRUD domains.
- Dual writes without an outbox or transaction coordination.

## Migration Strategy

- Start with a single bounded context or feature.
- Split read model first; keep write model intact.
- Add projections and read store incrementally.
- Introduce event publishing after stable write flow.

## Quality Checklist

- [ ] Command and query models are clearly separated
- [ ] Write model enforces all invariants
- [ ] Read model is optimized for query use cases
- [ ] Event publication is reliable (outbox or equivalent)
- [ ] Projection updates are idempotent and monitored
- [ ] Consistency expectations are documented per feature
- [ ] Operational dashboards include read freshness and lag
- [ ] Rebuild strategy for read models is documented

## Examples

**Command flow (write)**:

1. API receives `ApproveOrder` command
2. Command handler loads `Order` aggregate
3. Aggregate validates approval rules
4. Transaction commits to write store
5. Event published: `OrderApproved`

**Query flow (read)**:

1. UI requests order summary
2. Query API reads `OrderSummary` projection
3. Read store returns denormalized view
4. Response includes `lastUpdatedUtc` for freshness
