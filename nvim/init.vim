set nocompatible              " be iMproved, required
filetype off                  " required

" Show line numbers
set number

" Syntax and colorscheme
syntax on

" Tab behavior
set expandtab
set tabstop=4
set scrolloff=25

" set t_Co=256
"
set backspace=indent,eol,start
set clipboard=unnamed
set guifont=DroidMono\ Nerd\ Font\ Mono:h16

set hidden
nnoremap <C-L> :bnext<CR>
nnoremap <C-H> :bprev<CR>
nnoremap <C-;> :bd<CR>

"
"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"set termguicolors
"
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

let g:python_host_prog = substitute(system("which python2"), '\n', '', 'g')
let g:python3_host_prog = substitute(system("which python3"), '\n', '', 'g')

call plug#begin('~/.vim/plugged')
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'davidhalter/jedi'
Plug 'ryanoasis/vim-devicons'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'joshdick/onedark.vim'
Plug 'bling/vim-airline'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Yggdroot/indentLine'
" Plug 'kien/ctrlp.vim'
" Plug 'ap/vim-buftabline'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
Plug 'rbgrouleff/bclose.vim'
Plug 'jvirtanen/vim-hcl'

" FZF and display mode
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'francoiscabrol/ranger.vim'

" Terraform
Plug 'hashivim/vim-terraform'

" LanguageCliemt-neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'neovimhaskell/haskell-vim'
Plug 'rhysd/vim-grammarous'
Plug 'tpope/vim-surround'
Plug 'chrisbra/csv.vim'
Plug 'Chiel92/vim-autoformat'

call plug#end()
" =========================================================
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo -----------------------------------

let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

""" fzf config
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
endif
"""


"-----------------
" Bind JSON to different colorscheme
" autocmd BufEnter *.json colorscheme default
" Vim-JSON plugin
" let g:vim_json_syntax_conceal = 0
" au BufRead,BufNewFile,BufReadPost *.json set syntax=json
"------------------

"
""
"""
""""
"""""
""""""
"""""""
" ===========================================

" Python path for neovim

" Nerdtree configuration 
"
" Ctrl + n for nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Nerdtree file highlight
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" Enable nerdtree folder highlight
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

" Nerdtree highlight colors
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

" Custom file highlighting
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:orange" sets the color of css files to blue

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['py'] = s:blue" sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

""""""
" Rainbow parenthasis
"
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

"""""
" Scheme indent
"
autocmd filetype lisp,scheme,art setlocal equalprg=scmindent.rkt

let g:deoplete#enable_at_startup = 1


let g:Powerline_symbols = 'fancy'

let g:LanguageClient_serverCommands = {
    \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
    \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
    \ }

let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
let g:LanguageClient_settingsPath = '/Users/Avrahami/.config/nvim/settings.json'
set completefunc=LanguageClient#complete
set formatexpr=LanguageClient_textDocument_rangeFormatting()

nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

let b:ale_linters = ['pylint', 'hlint', 'ghc-mod']

""""""
" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
"let g:lightline = {
"  \ 'colorscheme': 'onedark',
"  \ }
au BufNewFile,BufRead Jenkinsfile setf groovy

""""""
" Terraform
let g:terraform_align=1
let g:terraform_fmt_on_save=1
