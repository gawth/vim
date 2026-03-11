# vim
## vimrc settings


Core components:

- vim-plug — plugin manager
- fzf + fzf.vim — file/buffer/text search
- ALE — linting, formatting, and LSP-style navigation
- vim-fugitive / vim-surround / vim-repeat / vim-commentary — editing and git tools
- vim-go — Go development support (optional)


⸻

# Installation

## Create required Vim directories

```
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
```

⸻

## Install vim-plug

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

⸻

## Install base dependencies

```
brew install vim git fzf ripgrep
```

⸻

## Optional language tools

These enable linting, formatting, and LSP features used by ALE.

Go

```
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
```

JavaScript / TypeScript

```
npm install -g eslint typescript typescript-language-server
```

Python

```
python3 -m pip install --user ruff pyright
```

⸻

## Install plugins

Start Vim and run:

```
:PlugInstall
```

Then quit and reopen Vim.

⸻

## Test the setup

Inside Vim, try:

```
:Files
:Buffers
:Rg test
:ALEInfo
```

If you use Go:

```
:GoBuild
:GoTest
```

⸻

## Keybindings

Leader key: ,

Key	Action
,;	Find files
;	List buffers
,r	Ripgrep search
,t	Search tags
gd	Go to definition
gr	Find references
K	Hover / documentation
]q	Next quickfix item
[q	Previous quickfix item


⸻

## Updating plugins

Inside Vim:

```
:PlugUpdate
```

⸻

## Notes

- :Rg requires ripgrep (rg) to be installed.


# Plugins

This setup intentionally keeps the plugin list small and focused.

⸻

## Plugin manager

vim-plug
Minimal plugin manager for Vim. Installs and updates plugins with:

:PlugInstall
:PlugUpdate


⸻

## Core editing improvements

vim-sensible
Provides a set of sensible default Vim settings that fix common annoyances in the default Vim configuration.

⸻

vim-surround
Adds simple commands for manipulating surrounding characters like quotes, brackets, or HTML tags.

Examples:

```
cs"'     change " to '
ysiw(    surround word with ()
ds(      delete surrounding ()
```

⸻

vim-repeat
Extends Vim’s . repeat command so that plugin commands can also be repeated.

Example:

.    repeat last change


⸻

vim-commentary
Provides a simple way to comment and uncomment lines of code.

Examples:

```
gcc      comment current line
gc{motion}  comment a motion (e.g. gcip)
```

⸻

## Git integration

vim-fugitive
Full Git integration inside Vim, allowing you to inspect changes, stage files, and commit without leaving the editor.

Common commands:

```
:Git
:Gdiffsplit
:Gstatus
:Gblame
```

⸻

## Navigation

vim-tmux-navigator
Allows seamless navigation between Vim splits and tmux panes using the same keys.

Mapped keys:

Ctrl-h    move left
Ctrl-j    move down
Ctrl-k    move up
Ctrl-l    move right


⸻

## Fuzzy searching

fzf
A fast fuzzy finder used for interactively filtering files and search results.

⸻

fzf.vim
Integrates fzf with Vim to provide fast navigation across files, buffers, and project text.

Mapped keys:

,f    search files (:Files)
,b    switch buffers (:Buffers)
,r    search project text with ripgrep (:Rg)
,t    search tags (:Tags)


⸻

## Linting and language support

ALE (Asynchronous Lint Engine)
Provides asynchronous linting, formatting, and language server integration. Shows errors and warnings while editing and supports navigation features.

Mapped keys:

gd    go to definition
gr    find references
K     show documentation / hover
]q    next quickfix item
[q    previous quickfix item

ALE also formats code automatically on save.

⸻

## Language support

vim-go (optional)
Adds Go development features including formatting, testing, navigation, and integration with Go tools like gopls.

Mapped keys (in Go files):

,rt   run tests
,rb   build package
,rc   toggle coverage
,a    switch between implementation and test file
