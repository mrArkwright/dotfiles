set nocompatible               " be iMproved

" --- Vundle ---
" https://github.com/gmarik/vundle
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible' "stdanrad stuff
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-fugitive' "git support
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'

Plugin 'altercation/vim-colors-solarized'

Plugin 'lukerandall/haskellmode-vim'
Plugin 'idris-hackers/idris-vim'

call vundle#end()
filetype plugin indent on
" --- end Vundle ---

set encoding=utf-8

set mouse=a
set number
set cursorline

set breakindent

set clipboard+=unnamedplus

set ts=4
set shiftwidth=4

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set background=dark
colorscheme solarized

let g:haddock_browser="/Applications/Safari.app"
