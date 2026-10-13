SHELL_SCRIPTS := $(shell for f in [a-z]*; do head -n1 "$$f" | grep -qE '^\#!/bin/(ba)?sh' && echo "$$f"; done)

test:
	@echo Running shellcheck...
	@shellcheck --exclude SC2096 $(SHELL_SCRIPTS)
	@echo Running bashate...
	@bashate --ignore E010 --ignore E006 $(SHELL_SCRIPTS)
