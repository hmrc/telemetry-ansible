SHELL := /usr/bin/env bash
POETRY_OK := $(shell type -P poetry)
PYTHON_OK := $(shell type -P python)
PYTHON_VERSION := $(shell python -V | cut -d' ' -f2)
PYTHON_REQUIRED := $(shell cat .python-version)
ROOT_DIR := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
POETRY_VIRTUALENVS_IN_PROJECT ?= true

help: ## The help text you are reading
	@grep --no-filename -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help

check_poetry: check_python ## Check Poetry installation
    ifeq ('$(POETRY_OK)','')
	    $(error package 'poetry' not found!)
    else
	    @echo Found poetry!
    endif

check_python: ## Check Python installation
    ifeq ('$(PYTHON_OK)','')
	    $(error python interpreter: 'python' not found!)
    else
	    @echo Found Python
    endif
    ifneq ('$(PYTHON_REQUIRED)','$(PYTHON_VERSION)')
	    $(error incorrect version of python found: '${PYTHON_VERSION}'. Expected '${PYTHON_REQUIRED}'!)
    else
	    @echo Found Python ${PYTHON_REQUIRED}
    endif

reset: ## Teardown tooling
	rm -rfv $$(poetry env info --path) poetry.lock
.PHONY: reset

setup: check_poetry ## Setup virtualenv & dependencies using Poetry
	export POETRY_VIRTUALENVS_IN_PROJECT=$(POETRY_VIRTUALENVS_IN_PROJECT)
	poetry run pip install --upgrade pip
	pip install aws-profile
	poetry install --no-root
	python --version
.PHONY: setup

run: ## Run ansible playbook for the supplied Jira Ticket e.g make run ticket=TEL-2906
ifdef ticket
	ansible-playbook ./playbooks/$(ticket)/playbook.yml --inventory ./inventories/aws_ec2.yml
else
	@echo 'Ticket is not provided! usage: make $@ ticket=TEL-2906'
endif
