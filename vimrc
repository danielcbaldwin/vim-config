call pathogen#infect()

syntax enable
colorscheme wombat256

if has("gui_running")
	set guioptions=egmrt
  " Move a line of text using (on Mac)
  " http://vimbits.com/bits/283
  nmap <D-j> mz:m+<cr>`z
  nmap <D-k> mz:m-2<cr>`z
  vmap <D-j> :m'>+<cr>`<my`>mzgv`yo`z
  vmap <D-k> :m'<-2<cr>`>my`<mzgv`yo`z
endif

set number
set backspace=2             " fixing backspace because vim is dumb

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default
set ignorecase             " ignore case when searching

set autoread                " Update open files when changed externally

set encoding=utf-8
set autoindent
set smartindent
set showmode
set noshowcmd
set wrap

set showmatch              " brackets/braces that is
set mat=3                  " duration to show matching brace (1/10 sec)

set shiftwidth=2
set tabstop=2
set nosmarttab
set expandtab

" Reselect visual block after indent/outdent
" http://www.vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" Clear search highlights
" http://www.vimbits.com/bits/21
" nnoremap <silent><Leader>/ :nohls<CR>
nnoremap <silent><Leader>h :nohls<CR>
" nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Backups {{{

set undodir=~/.vim/tmp/undo//     " undo files
set backupdir=~/.vim/tmp/backup// " backups
set directory=~/.vim/tmp/swap//   " swap files
set nobackup                        " enable backups
set nowritebackup
set noswapfile                    " It's 2012, Vim.

" }}}
" Leader {{{

let mapleader = ","

" }}}

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Make Vim able to edit crontab files again.
set backupskip=/tmp/*,/private/tmp/*"

" Better Completion
set completeopt=longest,menuone,preview

" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
" augroup line_return
"    au!
"    au BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \     execute 'normal! g`"zvzz' |
"        \ endif
" augroup END

" }}}

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" NERD Tree {{{

noremap <leader>n :NERDTreeToggle<CR>
inoremap <leader>n <esc>:NERDTreeToggle<CR>

let NERDTreeShowBookmarks=1

augroup ps_nerdtree
    au!

    au Filetype nerdtree setlocal nolist
    au Filetype nerdtree nnoremap <buffer> K :q<cr>
augroup END

let NERDTreeHighlightCursorline = 1
let NERDTreeIgnore = ['.vim$', '\~$', '.*\.pyc$', 'pip-log\.txt$', 'whoosh_index',
                    \ 'xapian_index', '.*.pid', 'monitor.py', '.*-fixtures-.*.json',
                    \ '.*\.o$', 'db.db', 'tags.bak']

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeMouseMode = 2

" }}}

" Powerline {{{

"let g:Powerline_symbols = 'fancy'
let g:Powerline_cache_enabled = 1

" }}}

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
map <C-n> :call NumberToggle()<CR>
map <leader>r :call NumberToggle()<CR>

nnoremap <silent><C-l> :bn<CR>
"nnoremap <silent><C-Right> :bn<CR>
nnoremap <silent><C-h> :bp<CR>
"nnoremap <silent><C-Left> :bp<CR>

map <silent><leader>d <leader>bd<CR>

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
" Disable paste mode when leaving Insert Mode
" http://www.vimbits.com/bits/170
au InsertLeave * set nopaste

" Insert blank lines without going into insert mode
" http://www.vimbits.com/bits/176
nmap t o<ESC>k
nmap T O<ESC>j
