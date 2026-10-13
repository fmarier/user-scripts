scripts_matching = $(shell for f in [a-z]*; do head -n1 "$$f" | grep -qE '$(1)' && echo "$$f"; done)

SHELL_SCRIPTS := $(call scripts_matching,^\#!/bin/(ba)?sh)
PERL_SCRIPTS := $(call scripts_matching,^\#!/usr/bin/perl)
PYTHON_SCRIPTS := $(call scripts_matching,^\#!/usr/bin/python)
ALL_SCRIPTS := $(wildcard [a-z]*)
UNLINTED_SCRIPTS := $(filter-out $(SHELL_SCRIPTS) $(PERL_SCRIPTS) $(PYTHON_SCRIPTS),$(ALL_SCRIPTS))

test:
	@echo Checking that all scripts are linted...
	@test -z "$(UNLINTED_SCRIPTS)" || { echo "No linter for: $(UNLINTED_SCRIPTS)"; exit 1; }
	@echo Running shellcheck...
	@shellcheck --exclude SC2096 $(SHELL_SCRIPTS)
	@echo Running bashate...
	@bashate --ignore E010 --ignore E006 $(SHELL_SCRIPTS)
	@echo Running perlcritic...
	@perlcritic --quiet $(PERL_SCRIPTS)
	@echo Running flake8...
	@flake8 $(PYTHON_SCRIPTS)
