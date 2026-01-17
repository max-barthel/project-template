SHELL := /bin/bash
.DEFAULT_GOAL := help

UV := uv

.PHONY: help
help:
	@printf "Targets:\n"
	@printf "  setup  - sync deps + install pre-commit hooks\n"
	@printf "  fmt    - format code\n"
	@printf "  lint   - run static checks\n"
	@printf "  test   - run tests\n"
	@printf "  ci     - run what CI runs (fmt check + lint + tests)\n"

.PHONY: setup
setup:
	$(UV) sync --all-extras
	$(UV) run pre-commit install

.PHONY: fmt
fmt:
	$(UV) run ruff format .
	$(UV) run ruff check . --fix

.PHONY: lint
lint:
	$(UV) run ruff check .
	$(UV) run mypy .

.PHONY: test
test:
	$(UV) run pytest -q

.PHONY: ci
ci:
	$(UV) run ruff format . --check
	$(UV) run ruff check .
	$(UV) run mypy .
	$(UV) run pytest -q
