set nocompatible              " be iMproved, required
filetype off                  " required
colorscheme desert
"error set fillchars+=vert:\ 

" Using pathogen...
execute pathogen#infect()

"let NERDTreeQuitOnOpen=1

let mapleader = ","

set tabstop=4
set shiftwidth=4

" Arrow Key Fix 
" https://github.com/spf13/spf13-vim/issues/780
if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
endif

" Highlight search results
set hlsearch

" Remap the leader key
let mapleader = ","
set showcmd

" Add a column indicating where 120 characters is
set textwidth=100
set colorcolumn=+1
set nowrap


" And set this to a gentler colour in the terminal (default is red)
highlight ColorColumn ctermbg=6

" Switch this off for markdown files as I find it a pain
au BufRead,BufNewFile *.md setlocal textwidth=0
" But we still want md files to wrap but without a hard line break
au BufRead,BufNewFile *.md setlocal wrap
" this is the magic setting - linebreak causes the line to break without inserting an EOL
au BufRead,BufNewFile *.md setlocal linebreak
au BufRead,BufNewFile *.md setlocal nolist
"au BufRead,BufNewFile *.md setlocal textwidth=100
"au BufRead,BufNewFile *.md setlocal wrap
"au BufRead,BufNewFile *.md setlocal colorcolumn=0

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
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" imap <expr><TAB>
"  pumvisible() ? "\<C-n>" :
"  neosnippet#expandable_or_jumpable() ?
"     "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
" Don't like this as it hides quotes in json...
"if has('conceal')
"  set conceallevel=2 concealcursor=niv
"endif

" Allow moving around using control h,j,k,l 
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Point to user defined snippets.  Use comma separated for multiple folders
"let g:neosnippet#snippets_directory='~/.vim/snippets'

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

set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

autocmd FileType javascript setlocal expandtab
autocmd FileType typescript setlocal expandtab

" Using goimports will format the code and sort out imports on save.  Can be
" slow on large code files
let g:go_fmt_command = "goimports"
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_extra_types = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_structs = 1
"let g:go_highlight_types = 1
"let g:go_highlight_format_strings = 1
"let g:go_highlight_variable_declarations = 1
"let g:go_highlight_variable_assignments = 0
" Show type of current var in command line
"let g:go_auto_type_info = 1

" Run linter, vet, etc on save
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
"
" neosnippet support for go?
let g:go_snippet_engine = "neosnippet"

" Fix for interferance between go and syntastic. Taken from vim-go help
let g:syntastic_go_checkers = ['golint', 'govet']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']  }

" This setting highlights use of the var under the cursor.  I thought it was 
" to blame for occassionally leaving visual junk behind so I turned it off...
" but that didn't fix it so its back on!
"let g:go_auto_sameids = 1
"let g:go_updatetime = 750

" Try using godef instead of guru
"let g:go_def_mode = 'godef'
"let g:go_info_mode = 'gocode'


" The are a couple of types of windows that get opened by go.  This forces go
" to always use the quickfix...which means you can then use cnext and
" cprevious to move through the errors
"
" They have changed this for the latest release (Oct 4th) so am disabling for
" now
" let g:go_list_type = "quickfix"

" Key mappings for go
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c  <Plug>(go-coverage-toggle)

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


" The following will auto write the current file if you build/make it
set autowrite


" Switch between file and its test file
au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)

" Run tests mapping plus coverage mapping
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>

" Go to defn of func
au FileType go nmap <F12> <Plug>(go-def)

" Attempt to fix inactive status line
function! Render_Only_File(...)
  let builder = a:1
  let context = a:2

  call builder.add_section('file', '!! %F')

  return 1   " modify the statusline with the current contents of the builder
  return 0   " the default: draw the rest of the statusline
  return -1  " do not modify the statusline
endfunction
call airline#add_inactive_statusline_func('Render_Only_File')

" Added the following to get ctrlp to show hidden files by default
"let g:ctrlp_show_hidden = 1


" New Completion lib...install both of these for it to work
" Also need the silver searcher to get ag command
"
" https://github.com/junegunn/fzf
" https://github.com/junegunn/fzf.vim
"
set rtp+=~/.fzf
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

" Changes to allow use of ag (replacement for grep) with ack in vim
let g:ackprg = 'ag --nogroup --nocolor --column'

" Clashes with autoclose mapping
" nmap <Leader>a :Ack! "\b<cword>\b" <CR>

" Typescript support.  Was getting lots of issues due to tsc not picking up
" tsconfig.json so have tried alternative 
"
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi'] " You shouldn't use 'tsc' checker."


" let g:tmux_navigator_no_mappings = 1

" noremap <silent> {Left-Mapping} :TmuxNavigateLeft<cr>
" noremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
" noremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
" noremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
" noremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
