set nocompatible              " be iMproved, required
filetype off                  " required
" Show line numbers
set number
" Syntax and colorscheme
syntax on
" Tab behavior
set expandtab
set tabstop=4
set guifont=UbuntuMono\ Nerd\ Font\ 13

set scrolloff=25
set t_Co=256
colorscheme dracula


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle comments and configuration
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" ========================================================

" let Vundle manage Vundle, required
Plugin 'Valloric/YouCompleteMe'
Plugin 'VundleVim/Vundle.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'klen/python-mode'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'scrooloose/nerdtree'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'elzr/vim-json'
Plugin 'dracula/vim'
Plugin 'kien/rainbow_parentheses.vim'

" Plugins that are not currently in use
" -------------------------------------
" Plugin 'chriskempson/base16-vim'
" Plugin 'sjl/tslime.vim'
" Plugin 'crusoexia/vim-dracula'
" Plugin 'vimwiki/vimwiki'

" =========================================================
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo -----------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
" 
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-------------------------


