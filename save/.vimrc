
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

" set termsize=10x0
autocmd VimEnter * NERDTree . 
" autocmd VimEnter * wincmd p
" autocmd VimEnter * terminal
" autocmd VimEnter * wincmd k
" autocmd VimEnter * 20 wincmd +


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

setlocal spell spelllang=fr
set  spelllang =en,fr
set  spell
set  spellsuggest =5

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
" Configuration Bash 
" ----------------------------------

let g:BASH_AuthorName   = 'Gaëtan Ritel'
let g:BASH_Email        = 'ritelg@yahoo.fr'

" ----------------------------------
" YouCompleteMe
" ----------------------------------

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_python_binary_path='/usr/bin/python3'

" ----------------------------------
" Mapping 
" ----------------------------------

let mapleader=","
" cmap make make<CR>

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>tt :TagbarToggle<CR>
nmap \h gT 
nmap \l gt
nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>o :Rg<CR>
nmap <leader>w :Windows<CR>
nmap <leader>te :sp \| term<CR>
nmap <leader>u <C-u>
nmap <leader>d <C-d>

" Format le document
nmap <leader>== gg=G

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

" ----------------------------------
" Débuging
" ----------------------------------
let g:vimspector_enable_mappings='HUMAN'
" for normal mode mode
nmap <Leader>di <Plug>VimspecturBalloonEval
" for visual mode
xmap <Leader>di <Plug>VimspecturBalloonEval


" Filter log
" vimgrep /something/g % | copen

source ~/.vim/functions.vim













" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fo <Plug>(coc-format-selected)
nmap <leader>fo  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
