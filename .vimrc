".vimrc file - Save this file as .vimrc in your home directory. (e.g. /home/user/.vimrc)
" Author: Shashank Shanbhag

set directory=.,$TEMP
"-- General --
set number		"Show line numbers
set ruler		"Show the line and column number of the cursor position
set t_Co=256
""set ts=4 sw=4 et
""let g:indent_guides_start_level=2
""let g:indent_guides_guide_size=1

""hi IndentGuidesOdd guibg=black ctermbg=black
""hi IndentGuidesEven guibg=black ctermbg=black
""let g:indent_guides_color_change_percent = 1
""let g:indent_guides_enable_on_vim_startup = 0
colorscheme molokai

"-- Programming --
set autoindent    "Copy indent from current line when starting a new line
set smartindent		"Do smart indenting when starting a new line. Works with supported c-like languages

"-- Spaces/Tabs --
set expandtab		"Use spaces instead of tabs
set shiftwidth=4
set tabstop=4

"-- Searching --
set hlsearch		"Highlight search results
set ignorecase		"When doing a search, ignore the case of letters
set smartcase		"Override the ignorecase option if the search pattern contains upper case letters
"Clear the search highlight by pressing ENTER when in Normal mode (Typing commands)
:nnoremap <CR> :nohlsearch<CR>/<BS><CR>

"-- Tabbed Editing --
"Open a new (empty) tab by pressing CTRL-T. Prompts for name of file to edit
map <C-T> :tabnew<CR>:edit 
"Open a file in a new tab by pressing CTRL-O. Prompts for name of file to edit
map <C-O> :tabfind 
"Switch between tabs by pressing Shift-Tab
map <C-Tab> gt

"-- Tweaks --
"Add tweak for better backspace support
set backspace=indent,eol,start

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()

:filetype plugin indent on
syntax on

:filetype on
:filetype indent on

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader="\\"
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
""set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
"if exists("&relativenumber")
"	set relativenumber
"	au BufReadPost * set relativenumber
"endif
" Start scrolling three lines before the horizontal window border
"set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>


" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
endif

""autocmd FileType python set ft=python.django " For SnipMate
""autocmd FileType html set ft=htmldjango.html " For SnipMate


"PySmell
autocmd FileType python setlocal omnifunc=pysmell#Complete

"Syntastic
let g:syntastic_mode_map = { 'mode': 'active',
                            \ 'active_filetypes': ['python'],
                            \ 'passive_filetypes': [] }
let g:syntastic_enable_signs=1
"let g:syntastic_enable_balloons=1
let g:syntastic_auto_loc_list=1
map <Leader>sct :SyntasticToggleMode<CR> " switch between active and passive mode
map <Leader>scn :SyntasticCheck<CR> "Syntax check now

"NERDTree
let g:NERDChristmasTree=1
let NERDTreeIgnore = ['\.pyc$']
""autocmd vimenter * NERDTree
""autocmd vimenter * if !argc() | NERDTree | endif
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <Leader>no :NERDTree<cr>
map <Leader>nc :NERDTreeClose<cr>
map <Leader>nt :NERDTreeToggle<cr>
map <Leader>nm :NERDTreeMirror<cr>
map <Leader>nf :NERDTreeFind<cr>
" t - open selected node in new tab
" T - open selected node in new tab but keep focus on current tab
" i - open selected file in a split window
"
""let g:nerdtree_tabs_open_on_console_startup=1
""map <Leader>nt <plug>NERDTreeTabsToggle<CR>
""map <Leader>no <plug>NERDTreeTabsOpen<CR>
""map <Leader>nc <plug>NERDTreeTabsClose<CR>
""map <Leader>nm <plug>NERDTreeMirrorOpen<CR>

set splitright

"Taglist that uses cscope
noremap <leader>] :TlistToggle<CR>
:set tags=tags;/
set cscopetag

"Minibufexplorer options
"Open minibufexplorer
map <Leader>m :MiniBufExplorer<cr>
"Close minibufexplorer
map <Leader>c :CMiniBufExplorer<cr>
"update the explorer
map <Leader>u :UMiniBufExplorer<cr>
"Toggle the explorer
map <Leader>t :TMiniBufExplorer<cr>

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplCloseOnSelect = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplorerMoreThanOne=1

"Gundo
nnoremap <leader>g :GundoToggle<CR>
let g:gundo_right=1


"PythonMode options
let g:pymode_folding=0
let g:pymode_lint=0
let g:pmode_lint_onfly=0
let g:pymode_rope=0

"Pylint"
nnoremap <leader>l :PyLintToggle<CR>

"Command-T"
"EDITED PLUGIN DIRECTLY LINE 369 "map <Leader>ct :CommandT<CR>

if !pymode#Default('g:pymode_path', 1) || g:pymode_path
python << EOF
import sys, vim, os, StringIO

curpath = vim.eval("getcwd()")
libpath = os.path.join(os.path.dirname(os.path.dirname(
	vim.eval("expand('<sfile>:p')"))), 'pylibs')

sys.path = [libpath, curpath] + sys.path
EOF
endif


"tagbar"
nmap <leader>tb :TagbarToggle<CR>



