# vim
## vimrc settings

Clone this repo then link to it, e.g. if you have cloned in to vim...
`ln -s vim/.vimrc .vimrc`

This uses https://github.com/tpope/vim-pathogen for loading of plugins

To install

```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

Then, in the bundle dir use the commands below to download the various modules - I just copy/paste
in to a command window.

```
git clone https://github.com/vim-scripts/AutoClose.git
git clone https://github.com/ctrlpvim/ctrlp.vim.git
git clone https://github.com/Shougo/neocomplete.vim.git
git clone https://github.com/Shougo/neosnippet.git
git clone https://github.com/Shougo/neosnippet-snippets.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/majutsushi/tagbar.git
git clone https://github.com/vim-airline/vim-airline.git
git clone https://github.com/easymotion/vim-easymotion.git
git clone https://github.com/xolox/vim-easytags.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/fatih/vim-go.git
git clone https://github.com/mxw/vim-jsx.git
git clone https://github.com/xolox/vim-misc.git
git clone https://github.com/tpope/vim-sensible.git
```

Before running vim makes sure ctags is installed, on the Mac usually as simple as `brew install
ctags` otherwise off to http://ctags.sourceforge.net/


