" Better nav for omnicomplete
" inoremap <expr> <c-j> ("\<C-n>")
" inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" TAB in general mode will move to text buffer
"nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
"nnoremap <S-TAB> :bprevious<CR>

" Alternate way to save
"nnoremap <C-s> :w<CR>
" Alternate way to quit
"nnoremap <C-Q> :wq!<CR>
" Use control-c instead of escape
"nnoremap <C-c> <Esc>
" <TAB>: complétion.
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <leader>, <C-y>


" Better tabbing
"vnoremap < <gv
"vnoremap > >gv

" Déplacer Split
nmap <leader>J <C-W>J
nmap <leader>K <C-W>K
nmap <leader>H <C-W>H
nmap <leader>L <C-W>L

" Navigation splits
nmap <leader>j <C-W>j
nmap <leader>k <C-W>k
nmap <leader>h <C-W>h
nmap <leader>l <C-W>l

"nnoremap <Leader>o o<Esc>^Da
"nnoremap <Leader>O O<Esc>^Da

tnoremap <Esc> <C-\><C-n>

" Mode visuel par blocs
nnoremap <leader>v <c-v>

nmap <leader>te :sp \| term<CR>

" Auto complétion 
imap <leader>c <C-x><C-o>
imap <leader>C <C-x><C-f>

" Formater le code
imap <leader>== gg=G

" nmap <leader>tt :TagbarToggle<CR>
nmap <leader>tt :CocOutline<CR>

" Correction orthographique
nnoremap <silent> <F12> :set spell!<CR>
inoremap <silent> <F12> <C-O>:set spell!<CR>

" Dans le mode INSERT, tapez Ctrl+x suivi de s, juste après le mot, ensuite Ctrl+p et Ctrl+n pour
" précédent  et suivant.

" Change avec la première proposition. 
inoremap <leader>s <C-x>s 
