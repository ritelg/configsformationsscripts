
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
set encoding=utf-8
" Copier dans le presse papier du system
set clipboard+=unnamed
set  nu
set tabstop =4
set shiftwidth =4
set softtabstop =4
set splitbelow
set splitright
set scrolloff=1000
" Recharge le fichier quand il est modifié en dehors de VIM
set autoread
let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree .

let g:airline#extensions#tabline#enabled = 1

" ----------------------------------
" Theme et background
" ----------------------------------
set bg=dark
colorscheme ron 

" ----------------------------------
" Backup
" ----------------------------------

set nobackup
set noswapfile
" set dir=~/tmp

" ----------------------------------
" Correction Orthographe
" ----------------------------------

"set  spelllang =en,fr
"set  spell
"set  spellsuggest =5

" ----------------------------------
" Autocompletion
" ----------------------------------

set omnifunc=syntaxcomplete#Complete
let g:javascript_plugin_jsdoc = 1
let g:user_emmet_leader_key=','

let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {
			\   'javascript': ['trim_whitespace', 'eslint'],
			\   'python': ['trim_whitespace'],
			\   'yaml': ['trim_whitespace', 'yamllint'],
			\   'markdown': ['trim_whitespace']
			\}

" ----------------------------------
" Mapping 
" ----------------------------------

let mapleader=","
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>t :TagbarToggle<CR>
nmap \h gT 
nmap \l gt
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>o :Rg<CR>
nmap <leader>w :Windows<CR>

nmap <leader>u <C-u>
nmap <leader>d <C-d>

" Format le document
nmap <leader>id gg=G

" Deplacer splits
nmap <leader>J <C-W>J
nmap <leader>K <C-W>K
nmap <leader>H <C-W>H
nmap <leader>L <C-W>L
" Exchange current window with next one.
nmap <leader>x <C-W>x
" Rotate windows downwards/rightwards.
nmap <leader>r <C-W>r
" Rotate windows upwards/leftwards.
nmap <leader>R <C-W>R 
" Move window in new tab
nmap <leader>T <C-W>T

" Navigate splits
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>h <C-W>h
nmap <leader>l <C-W>l

" Resize verticalement
nmap <C-j> <C-W>+
nmap <C-k> <C-W>-
" Resize horizontalement
nmap <C-l> <C-W>>
nmap <C-h> <C-W><
" Maximizer horizontalement et egaliser
nmap <leader>\| <C-W>\|
nmap <leader>_ <C-W>_
nmap <leader>= <C-W>=


" Taper ,, pour autocomplete
" Autocomplete
imap <leader>c <C-x><C-o>
" Autocompletion de fichier
imap <leader>C <C-x><C-f>
" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Mode visuel par blocs
nnoremap <leader>v <c-v>

" Fermeture accolade
inoremap {<cr> {<cr>}<esc>
" Fermeture accolade import
inoremap {<space> {   }<left>
" Fermeture parenthese
inoremap (<space> ()<left>
" Fermeture Crochet
inoremap [ []<left>



" Rotate a window horizontally to the left
" function! RotateLeft()
"     let l:curbuf = bufnr('%')
"     hide
"     wincmd h
"     split
"     exe 'buf' l:curbuf
" endfunc

" Rotate a window horizontally to the right
" function! RotateRight()
"     let l:curbuf = bufnr('%')
"     hide
"     wincmd l
"     split
"     exe 'buf' l:curbuf
" endfunc

