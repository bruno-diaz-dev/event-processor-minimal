## Event Processor Minimal

This repository provides a minimal, reusable GitHub Actions–based event processor designed to demonstrate event-driven automation patterns using native GitHub workflows.

It is intentionally simple and focuses on clarity, reusability, and real-world applicability rather than completeness or feature richness.

---

### What this repository does

- Defines a reusable GitHub Actions workflow

- Processes issues.opened events

- Reads the GitHub event payload (github.event)

- Extracts core issue metadata (title, author, labels, issue number)

- Generates a structured JSON artifact

- Optionally posts an automated comment back to the issue

---

### Intended usage

This repository is not meant to be run directly.

Instead, it is designed to be consumed by other repositories using GitHub Actions reusable workflows (workflow_call).

The caller repository is responsible for:

- Triggering the workflow (for example, on issues.opened)

- Providing required permissions

- Checking out this repository into the workflow workspace

This explicit contract avoids hidden assumptions and makes execution behavior deterministic.

---

### Why this pattern matters

This design mirrors real-world automation commonly used in platform and DevOps teams, including:

- Issue triage automation

- Internal bots

- Event-driven tooling

- Audit and telemetry pipelines

- Cross-repository workflow reuse

The focus is on understanding how GitHub Actions executes workflows across repositories, not on implementing a full-featured bot.

---

### Design principles

- Minimal surface area

- Explicit inputs and execution context

- No secrets required

- No external cloud dependencies

- Clear separation between workflow orchestration and business logic

---

### What this repository intentionally avoids

- Long-lived secrets

- Vendor-specific integrations

- Complex abstractions

- Hidden magic or implicit behavior

The goal is to make the execution model easy to reason about and easy to explain.

---

### Who this is for

This repository is intended for:

- Learning GitHub Actions at a platform level

- Practicing reusable workflow design

- Understanding event payload processing

- Building a portfolio of real, explainable automation patterns

---

## Author

### Bruno Mijail Díaz Barba | Azure DevOps Engineer 

#### Feedback and suggestions are welcome.