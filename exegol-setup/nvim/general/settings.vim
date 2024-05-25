" set leader key
let g:mapleader = ","

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set relativenumber
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autoread
"set foldmethod=indent
"source $VIMRUNTIME/mswin.vim


au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
let g:netrw_fastbrowse = 0

" You can't stop me
cmap w!! w !sudo tee %

" Suprimme les numéro de lignes dans le terminal
autocmd TermOpen * setlocal nonumber norelativenumber

set spelllang=fr
set spellsuggest=best,9

" Trouver tous les documents de maniere recursive 
set path+=** 

" Ouvrir un menu de recherche de fichier 
set wildmenu
set wildmode=list:full
set wildignore+=*/node_modules/*,_site,*/__pycache__/,*/venv/*,*/target/*,*/.vim$,\~$,*/.log,*/.aux,*/.cls,*/.aux,*/.bbl,*/.blg,*/.fls,*/.fdb*/,*/.toc,*/.out,*/.glo,*/.log,*/.ist,*/.fdb_latexmk,*/vendor/,*/.git/,*/.next/,*/.swc/,*/build/,*/autoload/*,

"set grepprg=rg\ --vimgrep\ --smart-case\ --follow
set grepprg=rg\ --vimgrep\ --smart-case\ --follow 
set grepformat^=%f:%l:%c:%m

" Ouvre automatiquement la quickfix list quand on appelle grep
" create a self-clearing autocommand group called 'qf'
augroup qf
    " clear all autocommands in this group
    autocmd!

    " do :cwindow if the quickfix command doesn't start
    " with a 'l' (:grep, :make, etc.)
    autocmd QuickFixCmdPost [^l]* cwindow

    " do :lwindow if the quickfix command starts with
    " a 'l' (:lgrep, :lmake, etc.)
    autocmd QuickFixCmdPost l*    lwindow

    " do :cwindow when Vim was started with the '-q' flag
    autocmd VimEnter        *     cwindow

augroup END
