SHELL := /bin/bash
.DEFAULT_GOAL := help

.PHONY: help
help:
	@printf "Targets:\n"
	@printf "  setup      lint     test     run\n"
	@printf "  api-setup  api-lint api-test api-ci api-dev\n"
	@printf "  web-setup  web-lint web-ci   web-dev\n"
	@printf "  ci         dev\n"

API_VENV := apps/api/.venv
WEB_NODE_MODULES := apps/web/node_modules

setup: api-setup web-setup

api-lint:
	cd apps/api && uv run ruff format . --check
	cd apps/api && uv run ruff check .
	cd apps/api && uv run mypy .

api-test:
	cd apps/api && uv run pytest -q

api-setup: $(API_VENV)

$(API_VENV): apps/api/pyproject.toml apps/api/uv.lock
	cd apps/api && uv sync --all-extras
	cd apps/api && uv run pre-commit install

api-ci:
	@$(MAKE) api-lint
	@$(MAKE) api-test

api-dev: $(API_VENV)
	cd apps/api && uv run uvicorn api.main:app --reload --host 127.0.0.1 --port 8000

web-setup: $(WEB_NODE_MODULES)

$(WEB_NODE_MODULES): apps/web/package.json apps/web/bun.lock
	cd apps/web && bun install

web-lint:
	cd apps/web && bun run lint

web-ci:
	@$(MAKE) web-lint
	cd apps/web && bun run build

web-dev: $(WEB_NODE_MODULES)
	cd apps/web && bun run dev

lint: api-lint web-lint

test: api-test

run: dev

ci: api-ci web-ci

dev:
	@$(MAKE) -j2 api-dev web-dev
