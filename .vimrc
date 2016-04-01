set nocompatible              " be iMproved, required
filetype off                  " required

" Usually using a dark terminal
set background=dark

" Fairly mild colour scheme
colorscheme desert

" Syntax highlighting on!
syntax enable

"Setup tabs - use spaces, 4 characters
"Taken from http://vim.wikia.com/wiki/Indenting_source_code
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

set showcmd
let mapleader=","


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" git plugin
Plugin 'tpope/vim-fugitive'

" GOLang Support
Plugin 'fatih/vim-go'

"Autocomplete
Plugin 'Shougo/neocomplete.vim'
"Snippet support and snippet
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

"Syntastic - syntax and error reporting for loads of languages
Plugin 'scrooloose/syntastic'

"easytags - auto generates ctags files if exuberant ctags is installed
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" Tagbar 
Plugin 'majutsushi/tagbar'

" Nerdcommenter - for commenting out stuff
Plugin 'scrooloose/nerdcommenter'

" Autoclose - does what it says on the tin
Plugin 'vim-scripts/AutoClose'

" Airline - status line on steroids
Plugin 'vim-airline/vim-airline'

" Easymotion - allows nav around by means of matching word patterns, etc
Plugin 'easymotion/vim-easymotion'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"Switch on neocomplete
let g:neocomplete#enable_at_startup = 1

"Snippet related settings
"
"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" This is supposed to allow use of tab to move through snippets but doesn't
" seem to work :-(
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
 \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


"Point to user defined snippets.  Use comma separated for multiple folders
let g:neosnippet#snippets_directory='~/.vim/snippets'


"Syntasic Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Easytags
let g:easytags_async = 1

" TagBar short cut
nmap <F8> :TagbarToggle<CR>

