set nocompatible              " be iMproved, required
filetype off                  " required

" Using pathogen...
execute pathogen#infect()

let NERDTreeQuitOnOpen=1

" Arrow Key Fix 
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

" Needed for JSX in JS files 
let g:syntastic_javascript_checkers = ['eslint']

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

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

" List of bundles - by putting these in a func they dont get executed 
" dont call the function though :-)
function! _blockcomment()
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
endfunction
