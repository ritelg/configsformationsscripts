set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

if has('nvim')
	tnoremap <ESC> <C-\><C-n>
endif
autocmd TermOpen * setlocal nonumber norelativenumber
