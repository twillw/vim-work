set omnifunc=syntax#Complete

set nocompatible

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'othree/javascript-libraries-syntax.vim'
Bundle 'mattn/emmet-vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kien/ctrlp.vim'
Bundle 'gregsexton/MatchTag'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/closetag.vim'
Bundle 'Shutnik/jshint2.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'terryma/vim-expand-region'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-repeat'
Plugin 'airblade/vim-gitgutter'

" Get rid of bell
set noeb vb t_vb=
au GUIEnter * set vb t_vb=


" Settings for Ctrlp plugin
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'c'


" Make backspace work like anywhere else
set backspace=indent,eol,start


"Set color scheme 
set background=dark
"let g:solarized_termcolors = 256 
colorscheme lucius

"Checks filetype - for syntax highlighting
filetype plugin on
filetype plugin indent on
syntax enable
syntax on


" Just some gui settings
set background=dark
set guifont=Inconsolata:h14
set guioptions-=m
set guioptions-=T
set guioptions-=r
set number
set guioptions=aAce

" Ignore case when searching
set ignorecase
set smartcase
set incsearch

" Set autoindent and tabs to 2 spaces
set smarttab
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2


" No backup files
set nobackup
set noswapfile


" Sets auto bracket closing
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap " ""<Esc>i
inoremap ' ''<Esc>i
inoremap ' ''<Esc>i
inoremap < <><Esc>i
autocmd FileType javascript inoremap < <

" Drops down a line and indents for curly brace - overridden by double tapping
" open brace
inoremap {<CR> {<CR><BS>}<Esc>ko
inoremap {{ {


" Puts cursor back inside html tags after completing

inoremap <Leader>c </<C-x><C-o><Esc>2ba

" Sets up open tags with indented line in between

inoremap <Leader>t <CR><Esc>ko
"
 "<Ctrl-l> redraws the screen and removes any search highlighting.

nnoremap <silent> <C-l> :nohl<CR><C-l>


" Maps Ctrl-s to write file

inoremap <C-s> <Esc>:w<CR>
"
nnoremap <C-s> <Esc>:w<CR>
"
"
"
" " Remaps colon to semicolon
"
nnoremap ; :

" Remap Y to yank until end of line (to match D behaviour)

nnoremap Y y$

" Leader for writing file

inoremap <Leader>s <Esc>:w<CR> 


" Leader for going to the end of the line and append

nnoremap <Leader>e $a

" Leader for yanking and pasting to and from clipboard

vmap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" Expand region remap

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Better search and replace

vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Go to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" angular html linting off
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_mode_map={'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html']}

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
