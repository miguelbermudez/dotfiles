set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"""
""" BEGIN PLUGINS
"""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-scriptease'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'radenling/vim-dispatch-neovim'
Plug 'Quramy/tsuquyomi'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'leafgarland/typescript-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'airblade/vim-gitgutter'
Plug 'rakr/vim-one' 

"""
""" INITIALIZE PLUGINS
"""
call plug#end()

"""
""" USER CONFIG
"""

" Leader
let mapleader=","


set autoindent	" always set autoindenting on
set autowrite		" automatically :write before running commands
set hidden
set nobackup
set noswapfile
set nowrap			" don't wrap lines
set number			" always show linenumbers
set ruler 			"	show cursor position all the time
set shiftround		" use multiple of shiftwidth when indenting with '<' and '>'
set shiftwidth=2	" number of spaces to use for autoindenting
set showcmd			" display incomplete commands
set showmatch		" set show matching parenthesis
set tabstop=2		" a tab is 2 spaces

" Easy Esc
:inoremap fd <Esc>

" Termainal Esc
:tnoremap <Esc> <C-\><C-n>
" Quick movement commands
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l
if has ('nvim')
	tnoremap <M-h> <c-\><c-n><c-w>h
	tnoremap <M-j> <c-\><c-n><c-w>j
	tnoremap <M-k> <c-\><c-n><c-w>k
	tnoremap <M-l> <c-\><c-n><c-w>l
endif



" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Quickly switch between last two files (like Spacemacs!)
noremap <Space><Tab> <C-^>

" fzf-mapping
" nnoremap <C-p> :<C-u>FZF<CR>
nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
nmap <leader>b :Buffers<CR>

" fzf-powered :Find
" --column: Show column number
"  " --line-number: Show line number
"  " --no-heading: Do not show file headings in results
"  " --fixed-strings: Search term as a literal string
"  " --ignore-case: Case insensitive search
"  " --no-ignore: Do not respect .gitignore, etc...
"  " --hidden: Search hidden files and folders
"  " --follow: Follow symlinks
"  " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
"  " --color: Search color options
"
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

augroup vimrcEx
	autocmd BufNewFile,BufReadPost *.md set filetype=markdown
	au BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Prettier Config
" let g:prettier#autoformat = 0
" let g:prettier#quickfix_auto_focus = 0

" when running at every change you may want to disable quickfix
" let g:prettier#quickfix_enabled = 0
" let g:prettier#autoformat = 0
" autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync


nmap <Leader>p <Plug>(PrettierAsync)


" TYPESCRIPT
" Disable leafgarland_typescript custom indenter
" let g:typescript_indent_disable = 1

" JAVASCRIPT
" For JavaScript files, use `eslint` (and only eslint)
"
let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" OCAML
autocmd FileType ocaml setlocal commentstring=(*%s*)
" autocmd FileType ocaml source "$(opam config var prefix)"/share/typerex/ocp-indent/ocp-indent.vim
" autocmd FileType ocaml execute "set rtp+=" . substitute(system('opam config var share'), '\n$', '', '''') . "/ocp-indent/vim/indent/ocaml.vim"
au BufRead,BufNewFile *.ml,*.mli compiler ocaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"


" Vim-Markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'json']
let g:markdown_minlines = 100

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" Shoe erros or warnings in status bar 
let g:airline#extensions#ale#enabled = 1

" Open Quickfix if there are errors
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Reasonml
let g:LanguageClient_serverCommands = {
    \ 'reason': ['~/src/reason-language-server/reason-language-server.exe']
    \ }

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
nnoremap <silent> gf :call LanguageClient_textDocument_formatting()<cr>
nnoremap <silent> gs :call LanguageClient_textDocument_documentSymbol()<cr>
nnoremap <silent> <cr> :call LanguageClient_textDocument_hover()<cr>

" enable autocomplete
let g:deoplete#enable_at_startup = 1
" close preview after selecting completion
autocmd CompleteDone * silent! pclose!

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

let g:airline_theme='one'
let g:one_allow_italics = 1
colorscheme one
set background=dark

