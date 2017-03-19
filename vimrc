" Set tab width to 2 spaces
set tabstop=2
" Set shift width to match tab width
set shiftwidth=2
" Make <Tab> insert spaces instead of tabs
set expandtab

" Show line numbers
set number

" Enable colors
set t_Co=256

" Show status line even when only one window is open
set ls=2

" === Vundle ===
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'rust-lang/rust.vim'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on
" === Vundle ===

" Enable syntax highlighting
syntax on

" let g:syntastic_rust_checkers = ['rustc']

" Allow backspace to go over boundaries
set backspace=indent,eol,start

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
