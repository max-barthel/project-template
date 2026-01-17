# startup-base

This repository defines my personal, opinionated baseline for starting new software projects.

It is not a product template. It is a living standard that captures how I structure projects, manage dependencies, enforce quality, and ship software using modern tools and practices.

Every new project starts by forking this repository and then adapting it intentionally.

## What this repo is for

- Consistent project structure
- Modern tooling defaults
- Clear development workflows
- Built-in quality gates (linting, testing, CI)
- Documented decisions to avoid regressions over time

## What this repo is not

- A finished application
- A framework
- A one-size-fits-all solution

## Quickstart

This repo uses uv for dependency + venv management.

```bash
brew install uv  # or: curl -LsSf https://astral.sh/uv/install.sh | sh

uv sync --all-extras
uv run pre-commit install

make ci
