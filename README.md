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

## Stack

- Backend: FastAPI + uv (Python 3.12+)
- Frontend: React + Vite + Bun

## Quickstart

Backend (uv):

```bash
make api-setup
make api-dev
```

Frontend (bun):

```bash
make web-setup
make web-dev
```

Run both together:

```bash
make dev
```

Run all checks:

```bash
make ci
```
