# My dotfiles

Hi, and welcome to my dotfiles repo.
Here you’ll find anything I use in my shell.

# How to use

To install everything:
```bash
$ make install
```

To list all rules:
```bash
$ make
```
and then you can call `make` followed by the desired rule to only install this one.


# Contents

- Aliases around bashrc management, vim, tmux, git and docker commands
- Activate completion for tools you may already have installed, like git
- Set default editor as vim for all intents and purposes
- Completion for `npm run` scripts, when applicable
- History configuration, like history-search, shared history between tmux panels, and moar
- A nice prompt when you are outside a git repository, and a very nice one when inside a git repository based on [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt)
- The ability to type the beginning of a command and cycle through all you history for commands that starts the same (e.g `vim to` and then UP several times can give you `vim toto`, `vim toad`, `vim totally_spies`, and so on…)
- A handy [prettier](https://prettier.io/) configuration file
