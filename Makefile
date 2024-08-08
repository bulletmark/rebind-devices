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

NAME = rebind-devices

all:
	@echo "Type sudo make install|uninstall"
	@echo "or make check|clean"

install:
	@./$(NAME)-setup -d "$(DESTDIR)" install

uninstall:
	@./$(NAME)-setup -d "$(DESTDIR)" uninstall

check:
	ruff $(NAME)
	flake8 $(NAME)
	mypy $(NAME)
	pyright-cli $(NAME)
	vermin --no-tips -i $(NAME)
	shellcheck $(NAME)-setup

doc:
	update-readme-usage

clean:
	@rm -vrf __pycache__/
