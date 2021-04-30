execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on

set nocompatible
set mouse=a
set  incsearch
set autowrite

" Toujours au centre de l'ecran
set scrolloff=1000

let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8

" Numero de Ligne
set  nu

set tabstop =4
set shiftwidth =4
set softtabstop =4

" Theme et background
set bg=dark
colorscheme ron 

" Backup
set nobackup
set dir=~/tmp

" Correction Orthographe
"set  spelllang =en,fr
"set  spell
"set  spellsuggest =5

" Autocompletion
set omnifunc=syntaxcomplete#Complete

let g:javascript_plugin_jsdoc = 1

let g:user_emmet_leader_key='<tab>'
let mapleader=","
map <S-n> :NERDTreeToggle<CR>
map <S-t> :TagbarToggle<CR>
map <C-n> :bn<CR>
map <C-p> :bp<CR>
map <C-f> :CtrlP<CR> " Recherche 


let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
	\   'javascript': ['trim_whitespace', 'eslint'],
	\   'python': ['trim_whitespace'],
	\   'yaml': ['trim_whitespace', 'yamllint'],
	\   'markdown': ['trim_whitespace']
	\}



" Fermeture accolade
inoremap {<cr> {<cr>}<esc>O
" Fermeture accolade import
inoremap {<space> {   }<left>
" Fermeture parenthese
inoremap (<space> ()<left>
" Fermeture Crochet
inoremap [ []<left>



" iab  #i #include
