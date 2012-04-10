call pathogen#infect()

syntax enable
set background=dark
colorscheme solarized

if has("gui_running")
	set guioptions=egmrt
endif

set number

set nobackup
set nowritebackup
set noswapfile

set encoding=utf-8
set autoindent
set smartindent
set showmode
set noshowcmd
set wrap

set nolazyredraw
set ruler
set backspace=2
set report=0

set showmatch              " brackets/braces that is
set mat=5                  " duration to show matching brace (1/10 sec)
set incsearch              " do incremental searching
set laststatus=2           " always show the status line
set ignorecase             " ignore case when searching

set shiftwidth=2
set tabstop=4
set nosmarttab
set expandtab

let mapleader = ","

let NERDTreeShowBookmarks=1

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
map <C-n> :call NumberToggle()<CR>
map <leader>r :call NumberToggle()<CR>

map <C-l> :bn<CR>
map <C-Right> :bn<CR>
map <C-h> :bp<CR>
map <C-Left> :bp<CR>

map <leader>n :NERDTreeToggle<CR>
map <leader>d <leader>bd<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }
