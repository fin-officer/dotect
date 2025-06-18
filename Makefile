# dotect - Document Detection package for InvOCR
# Development and deployment automation

.PHONY: help install test lint format build clean

# Default target
help:
	@echo "dotect Development Commands"
	@echo "=========================="
	@echo "install     - Install dependencies"
	@echo "test        - Run tests"
	@echo "lint        - Run linting"
	@echo "format      - Format code"
	@echo "build       - Build package"
	@echo "clean       - Clean build artifacts"

install:
	poetry install
	poetry run pre-commit install

test:
	poetry run pytest --cov=dotect --cov-report=html

lint:
	poetry run flake8 dotect/
	poetry run mypy dotect/

format:
	poetry run black dotect/ tests/
	poetry run isort dotect/ tests/

build:
	poetry build

clean:
	rm -rf dist/ build/ *.egg-info/
	rm -rf .coverage htmlcov/
	rm -rf .pytest_cache/
	find . -type d -name __pycache__ -delete
	find . -type f -name "*.pyc" -delete
