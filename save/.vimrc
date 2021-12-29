" Vimrc sources : 
"	https://github.com/Chewie/dotfiles/blob/master/vim/.vimrc

" Install vim-plug if we don't already have it
" Credit to github.com/captbaritone
" if empty(glob("~/.vim/autoload/plug.vim"))
"     " Ensure all needed directories exist  (Thanks @kapadiamush)
"     execute '!mkdir -p ~/.vim/plugged'
"     execute '!mkdir -p ~/.vim/autoload'
"     " Download the actual plugin manager
"     execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
" endif
" 
" "" Plugins
" ""
" call plug#begin('~/.vim/plugged')
" Plug 'tpope/vim-surround'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'vim-scripts/bash-support.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'preservim/nerdtree'
" " Plug 'ctrlpvim/ctrlp.vim'
" Plug 'mattn/emmet-vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'tpope/vim-commentary'
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" call plug#end()

	
execute pathogen#infect()
execute pathogen#helptags()
syntax on
filetype plugin indent on
set showcmd
set nocompatible
set mouse=a
set incsearch
set autowrite
set hlsearch
autocmd VimEnter * NERDTree .
" Copier dans le presse papier du system
set clipboard+=unnamed

set  nu

set tabstop =4
set shiftwidth =4
set softtabstop =4

let mapleader=","
" Toujours au centre de l'ecran
set scrolloff=1000

let g:airline#extensions#tabline#enabled = 1
set encoding=utf-8

" Theme et background
set bg=dark
colorscheme ron 

" Backup
set nobackup
" set dir=~/tmp

" Correction Orthographe
"set  spelllang =en,fr
"set  spell
"set  spellsuggest =5

" Autocompletion
set omnifunc=syntaxcomplete#Complete

let g:javascript_plugin_jsdoc = 1

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>t :TagbarToggle<CR>
nmap \h gT 
nmap \l gt
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>

nmap <leader>u <C-u>
nmap <leader>d <C-d>


" Taper ,, pour autocomplete
let g:user_emmet_leader_key=','
" Autocomplete
imap <leader>c <C-x><C-o>

" Mode visuel par blocs
nnoremap <leader>v <c-v>


" Deplacer splits
nmap <leader>J <C-W>J
nmap <leader>K <C-W>K
nmap <leader>H <C-W>H
nmap <leader>L <C-W>L

" Navigate splits
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>h <C-W>h
nmap <leader>l <C-W>l

let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
	\   'javascript': ['trim_whitespace', 'eslint'],
	\   'python': ['trim_whitespace'],
	\   'yaml': ['trim_whitespace', 'yamllint'],
	\   'markdown': ['trim_whitespace']
	\}



" Fermeture accolade
inoremap {<cr> {<cr>}<esc>
" Fermeture accolade import
inoremap {<space> {   }<left>
" Fermeture parenthese
inoremap (<space> ()<left>
" Fermeture Crochet
inoremap [ []<left>
