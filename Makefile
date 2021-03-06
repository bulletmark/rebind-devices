# Copyright (C) 2020 Mark Blakeney. This program is distributed under
# the terms of the GNU General Public License.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or any
# later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License at <http://www.gnu.org/licenses/> for more
# details.

NAME = $(shell basename $(CURDIR))

DOC = README.md
DOCOUT = $(DOC:.md=.html)

all:
	@echo "Type sudo make install|uninstall"
	@echo "or make doc|check|clean"

install:
	@./install.sh -d "$(DESTDIR)" install

uninstall:
	@./install.sh -d "$(DESTDIR)" uninstall

doc:	$(DOCOUT)

$(DOCOUT): $(DOC)
	markdown $< >$@

check:
	flake8 $(NAME)
	vermin --no-tips -i -q $(NAME)
	shellcheck *.sh

clean:
	@rm -vrf $(DOCOUT) __pycache__/
