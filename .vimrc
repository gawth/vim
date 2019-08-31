set nocompatible              " be iMproved, required
filetype off                  " required

" Using pathogen...
execute pathogen#infect()

let NERDTreeQuitOnOpen=1

let mapleader = ","

set tabstop=4
set shiftwidth=4

" Arrow Key Fix 
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

" Needed for JSX in JS files 
let g:syntastic_javascript_checkers = ['eslint']

let g:jsx_ext_required = 0 " Allow JSX in normal JS files

autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 softtabstop=0 expandtab

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
"inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  " return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

"inoremap <expr> <TAB>   pumvisible() ? "\<C-y>" : "\<TAB>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>""


"Point to user defined snippets.  Use comma separated for multiple folders
let g:neosnippet#snippets_directory='~/.vim/snippets'

" This causes go to auto save if we invoke a make command...such as go build
set autowrite

" Golang settings
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_enabled = ['golint', 'vet', 'errcheck']
let g:go_metalinter_autosave = 0 "Just hung so have disablled :-(
let g:go_metalinter_deadline = "5s"
let g:go_def_mode = 'godef'
"let g:go_auto_type_info = 1
"set updatetime=100
let g:go_auto_sameids = 1


autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>


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

"
" fzf setup
" Set diff path on mac as I have used homebrew to install
"set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
nmap ; :Buffers<CR>
nmap <Leader>; :Files<CR>
nmap <Leader>t :Tags<CR>

"ELM Setup
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1

call neocomplete#util#set_default_dictionary(
  \ 'g:neocomplete#sources#omni#input_patterns',
  \ 'elm',
  \ '\.')


" List of bundles - by putting these in a func they dont get executed 
" dont call the function though :-)
function! _blockcomment()
git clone https://github.com/ElmCast/elm-vim
git clone https://github.com/christoomey/vim-tmux-navigator.git
git clone git://github.com/tpope/vim-unimpaired.git
git clone https://github.com/junegunn/fzf.vim
git clone https://github.com/mileszs/ack.vim.git ~/.vim/bundle/ack.vim
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
git clone https://github.com/xolox/vim-easytags.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/fatih/vim-go.git
git clone https://github.com/xolox/vim-misc.git
git clone https://github.com/tpope/vim-sensible.git
endfunction
