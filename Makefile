# Target directory to install all the configuration to.
TARGET ?= ${HOME}

.DEFAULT: help

.PHONY: help
## Show help
help:
	@grep -B1 -E "^[a-zA-Z0-9_-]+\:" Makefile \
     | grep -v -- -- \
     | sed 'N;s/\n/###/' \
     | sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
     | column -t  -s '###'

.PHONY: bash-git-prompt
#: Install bash-git-prompt script suite
bash-git-prompt:
	@echo Making $@…
	git clone \
		https://github.com/magicmonty/bash-git-prompt.git \
		$(TARGET)/.bash-git-prompt  \
		--depth=1

.PHONY: add-bashrc-scripts
#: Add bashrc scripts as symlinks in a .bashrc.d directory
add-bashrc-scripts:
	@echo Making $@…
	mkdir -p $(TARGET)/.bashrc.d
	for file in .bashrc.d/*.bashrc; do ln -s $$(pwd)/$$file $(TARGET)/$$file; done
	cat .bashrc >> $(TARGET)/.bashrc

.PHONY: add-bash_profile
#: Symlink .bash_profile
add-bash_profile:
	ln -s $$(pwd)/.bash_profile $(TARGET)

.PHONY: add-inputrc
#: Symlink .inputrc
add-inputrc:
	ln -s $$(pwd)/.inputrc $(TARGET)

.PHONY: add-ssh-config
#: Symlink .bash_profile
add-ssh-config:
	ln -s $$(pwd)/ssh_config $(TARGET)/.ssh/config

.PHONY: add-prettier-config
#: Symlink prettier config
add-prettier-config:
	ln -s $$(pwd)/prettier.config.js $(TARGET)

.PHONY: install
#: Install everything
install: bash-git-prompt add-bashrc-scripts add-inputrc add-bash_profile add-prettier-config
	@echo Making $@…
