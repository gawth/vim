
" ==========================================
" Alan's minimal modern Vim config
" ==========================================

set nocompatible

" --- core behaviour ---
filetype plugin indent on
syntax on

set number
set ruler
set showcmd
set hidden
set mouse=a
set updatetime=300
set signcolumn=yes
set incsearch
set hlsearch
set ignorecase
set smartcase
set nowrap
set splitbelow
set splitright
set undofile
set undodir=~/.vim/undo
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set clipboard=unnamed

let mapleader = ","

" --- indentation defaults ---
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" --- display ---
set textwidth=100
set colorcolumn=101
highlight ColorColumn ctermbg=236

" --- markdown: soft wrap, no forced line width ---
augroup alan_markdown
  autocmd!
  autocmd FileType markdown setlocal textwidth=0 wrap linebreak nolist
augroup END

" --- web / config files: 2 spaces ---
augroup alan_web
  autocmd!
  autocmd FileType javascript,typescript,javascriptreact,typescriptreact,vue,json,yaml \
    setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab
augroup END

" --- python: 4 spaces, spaces not tabs ---
augroup alan_python
  autocmd!
  autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4 expandtab
augroup END

" --- go uses tabs ---
augroup alan_go_tabs
  autocmd!
  autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" --- split navigation ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- quickfix navigation ---
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprevious<CR>

" ==========================================
" Plugins
" ==========================================
call plug#begin('~/.vim/plugged')

" editing / git
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'

" tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" linting / fixing / LSP-style features
Plug 'dense-analysis/ale'

" Go support - remove if you no longer use Go much
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

call plug#end()

" ==========================================
" fzf
" ==========================================
let g:fzf_preview_window = []

nnoremap <leader>; :Files<CR>
nnoremap ; :Buffers<CR>
nnoremap <leader>r :Rg<CR>
nnoremap <leader>t :Tags<CR>

" ==========================================
" ALE
" ==========================================
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'python': ['ruff', 'pyright'],
\   'go': ['gopls'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'typescript': ['eslint'],
\   'python': ['ruff_format'],
\   'go': ['goimports'],
\}

nnoremap <silent> gd :ALEGoToDefinition<CR>
nnoremap <silent> gr :ALEFindReferences<CR>
nnoremap <silent> K :ALEHover<CR>

" ==========================================
" vim-go
" ==========================================
let g:go_fmt_command = "goimports"
let g:go_def_mode = "gopls"
let g:go_info_mode = "gopls"
let g:go_doc_popup_window = 1

augroup alan_go_maps
  autocmd!
  autocmd FileType go nnoremap <buffer> <leader>rt :GoTest<CR>
  autocmd FileType go nnoremap <buffer> <leader>rb :GoBuild<CR>
  autocmd FileType go nnoremap <buffer> <leader>rc :GoCoverageToggle<CR>
  autocmd FileType go nnoremap <buffer> <leader>a :GoAlternate<CR>
augroup END
