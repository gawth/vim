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
set tabstop=4
set autoindent

set showcmd
let mapleader=","

" Arrow Key Fix 
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

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


Plugin 'ctrlpvim/ctrlp.vim'



" All of your Plugins must be added before the following line
call vundle#end()            " required

"Switch on neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
inoremap <CR> <CR>
inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <TAB>   pumvisible() ? "\<C-y>" : "\<TAB>"


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

filetype on
filetype plugin indent on    " required
