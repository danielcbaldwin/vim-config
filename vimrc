" alot of this is from: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
call pathogen#infect()
call pathogen#helptags()

syntax enable

if has("gui_running")
	set background=light
	colorscheme solarized
	set guioptions=egmrt
endif

set number

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile
set wrap
set textwidth=79
set formatoptions=qrn1
" set confirm

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set list
set listchars=tab:▸\ ,eol:¬

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :

set backupdir=~/.vimbackup/
set directory=~/.vimbackup/
silent execute '!del "~/.vimbackup/*~"'

let NERDTreeShowBookmarks=1

map <leader>n :NERDTreeToggle<CR>
nnoremap <leader>ws :set list!<CR>
