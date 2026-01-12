.PHONY: help setup test lint run

help:
	@echo "Available commands:"
	@echo "  make setup   - prepare local environment"
	@echo "  make test    - run tests"
	@echo "  make lint    - run linters"
	@echo "  make run     - run the application"

setup:
	uv venv
	uv sync --all-groups
	uv run pre-commit install

test:
	uv run pytest

lint:
	uv run ruff check .
	uv run ruff format --check .
	uv run mypy app
