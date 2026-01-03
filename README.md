# Event Processor Minimal

This repository demonstrates a minimal, event-driven GitHub Actions workflow.

## What it does

- Triggers on `issues.opened`
- Reads the GitHub event payload
- Extracts issue metadata
- Generates a JSON artifact for auditing or further processing

## Why this matters

This pattern mirrors real-world automation used for:
- issue triage
- bots
- platform tooling
- event-driven workflows

No secrets. No cloud dependencies. Pure GitHub Actions.
