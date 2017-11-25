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
Plugin 'Shougo/vimproc.vim'

Plugin 'altercation/vim-colors-solarized'

"Plugin 'scrooloose/syntastic'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'idris-hackers/idris-vim'
Plugin 'derekwyatt/vim-scala'

Plugin 'pbrisbin/vim-syntax-shakespeare'

call vundle#end()
filetype plugin indent on
" --- end Vundle ---

let mapleader = "-"
let maplocalleader = "-"

set encoding=utf-8

set mouse=a
set number
set cursorline

set breakindent

set clipboard+=unnamedplus

set ts=4
set shiftwidth=4
filetype plugin indent on
set expandtab

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set background=dark
colorscheme solarized



map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

autocmd FileType haskell setlocal expandtab
let g:haddock_browser="/Applications/Safari.app"
let g:ghc=substitute(system('stack --verbosity silent path --compiler-exe'), '\n\+$', '', '')
