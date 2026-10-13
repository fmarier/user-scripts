scripts_matching = $(shell for f in [a-z]*; do head -n1 "$$f" | grep -qE '$(1)' && echo "$$f"; done)

SHELL_SCRIPTS := $(call scripts_matching,^\#!/bin/(ba)?sh)
PERL_SCRIPTS := $(call scripts_matching,^\#!/usr/bin/perl)
PYTHON_SCRIPTS := $(call scripts_matching,^\#!/usr/bin/python)

test:
	@echo Running shellcheck...
	@shellcheck --exclude SC2096 $(SHELL_SCRIPTS)
	@echo Running bashate...
	@bashate --ignore E010 --ignore E006 $(SHELL_SCRIPTS)
	@echo Running perlcritic...
	@perlcritic --quiet $(PERL_SCRIPTS)
	@echo Running flake8...
	@flake8 $(PYTHON_SCRIPTS)
