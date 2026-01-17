SHELL := /bin/bash
.DEFAULT_GOAL := help

.PHONY: help
help:
	@printf "Targets:\n"
	@printf "  api-setup  api-ci  api-dev\n"
	@printf "  web-setup  web-ci  web-dev\n"
	@printf "  ci         dev\n"

api-setup:
	cd apps/api && uv sync --all-extras
	cd apps/api && uv run pre-commit install

api-ci:
	cd apps/api && uv run ruff format . --check
	cd apps/api && uv run ruff check .
	cd apps/api && uv run mypy .
	cd apps/api && uv run pytest -q

api-dev:
	cd apps/api && uv run uvicorn api.main:app --reload --host 127.0.0.1 --port 8000

web-setup:
	cd apps/web && bun install

web-ci:
	cd apps/web && bun run build

web-dev:
	cd apps/web && bun run dev

ci: api-ci web-ci

dev:
	@$(MAKE) -j2 api-dev web-dev
