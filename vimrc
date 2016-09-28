" Leader
let mapleader = "\\"

set backspace=2   " Backspace deletes like most programs in insert mode
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

call plug#begin('~/.vim/bundle')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'exu/pgsql.vim'
Plug 'ngmy/vim-rubocop'
Plug 'pbrisbin/vim-mkdir'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/tComment'

call plug#end()

filetype plugin indent on

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
    \ {"regex": "possibly useless use of a variable in void context"}

" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Always use vertical diffs
set diffopt+=vertical

" Toggle between text width of 80 and no text width
function! TextWidthToggle()
  if &textwidth
    setlocal textwidth=0
  else
    setlocal textwidth=80
  endif
  " Echo current setting
  set textwidth
endfunction
nnoremap <Leader>sw :call TextWidthToggle()<CR>

" Reveal current file in NERDTree
nnoremap <Leader>nt :NERDTreeFind<CR>
" Find a file in CtrlP
nnoremap <Leader>f :CtrlP<CR>
" Toggle paste mode
nnoremap <Leader>p :set paste!<CR>

" Add RuboCop to syntastic checkers
let g:syntastic_ruby_checkers = ['mri']

" Show files that begin with . in NERDTree
let NERDTreeShowHidden=1

" Backup files
set backup
set writebackup
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup
endif
set backupdir=~/.vim/backup//

" Keep swp files out of projects
set swapfile
if isdirectory($HOME . '/.vim/swp') == 0
  :silent !mkdir -p ~/.vim/swp
endif
set directory=~/.vim/swp//

" Keep undo files
set undofile
if isdirectory($HOME . '/.vim/undo') == 0
  :silent !mkdir -p ~/.vim/undo
endif
set undodir=~/.vim/undo//

" Make search case insensitive
set ignorecase
" unless the search term contains caps
set smartcase

" Open NERDTree automatically if vim started without file
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

