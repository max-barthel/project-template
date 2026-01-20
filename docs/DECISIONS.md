# Decisions

This document records foundational decisions for this repository.
Changing anything here requires a deliberate reason.

## Language

Python is the default language.

Reason:

- Strong ecosystem
- Excellent backend and tooling support
- Fast iteration speed
- Suitable for APIs, tooling, and applied research

## Python Version

Python 3.12+

Reason:

- Current stable baseline
- Better performance and typing improvements
- Forces modern syntax and libraries

## Project Type Assumption

Default assumption is a full-stack app with a lightweight web UI.

Reason:

- Most projects need a minimal web surface
- Keeps the template practical without forcing a heavy frontend

## Dependency Management

uv is the default dependency and virtual environment manager.

Reason:

- Extremely fast
- Single tool for venv + deps
- Simple mental model
- Actively developed and widely adopted

## Frontend Stack

Default frontend stack:

- Bun for package management
- Vite for dev/build
- React + TypeScript for UI

Reason:

- Fast local feedback loop
- Minimal configuration overhead
- Widely supported ecosystem

## Code Quality

Default tools:

- ruff for linting and formatting
- mypy for static typing
- pytest for testing

Reason:

- Fast feedback
- Minimal configuration
- Widely adopted modern defaults
