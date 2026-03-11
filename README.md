# vim
## vimrc settings


Core components:
	•	vim-plug — plugin manager
	•	fzf + fzf.vim — file/buffer/text search
	•	ALE — linting, formatting, and LSP-style navigation
	•	vim-fugitive / vim-surround / vim-repeat / vim-commentary — editing and git tools
	•	vim-go — Go development support (optional)


⸻

# Installation

## Create required Vim directories

mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/plugged
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap


⸻

## Install vim-plug

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


⸻

## Install base dependencies


brew install vim git fzf ripgrep


⸻

## Optional language tools

These enable linting, formatting, and LSP features used by ALE.

Go

go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest

JavaScript / TypeScript

npm install -g eslint typescript typescript-language-server

Python

python3 -m pip install --user ruff pyright


⸻

## Install plugins

Start Vim and run:

:PlugInstall

Then quit and reopen Vim.

⸻

## Test the setup

Inside Vim, try:

:Files
:Buffers
:Rg test
:ALEInfo

If you use Go:

:GoBuild
:GoTest


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

:PlugUpdate


⸻

## Notes
- :Rg requires ripgrep (rg) to be installed.
