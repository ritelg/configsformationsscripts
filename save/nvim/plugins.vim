call plug#begin('~/.config/nvim/autoload/plugged')
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'jiangmiao/auto-pairs'
  Plug 'joshdick/onedark.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-rooter'
  Plug 'mhinz/vim-startify'
  Plug 'mhinz/vim-signify'
  "Plug 'arnaud-lb/vim-php-namespace'
  Plug 'nelsyeung/twig.vim'
  Plug 'mattn/emmet-vim'
  Plug 'github/copilot.vim'
  Plug 'tpope/vim-commentary'
  "Plug 'mte90/coq_wordpress', {'do': './install.sh'}
  Plug 'aklt/plantuml-syntax'
  Plug 'weirongxu/plantuml-previewer.vim'
  Plug 'tyru/open-browser.vim'
  Plug 'preservim/tagbar'
  Plug 'dhruvasagar/vim-marp'
  Plug 'lilydjwg/colorizer'
  Plug 'KabbAmine/vCoolor.vim'
  " Plug 'tibabit/vim-templates'
 Plug 'dinhhuy258/vim-database', {'branch': 'master', 'do': ':UpdateRemotePlugins'}
call plug#end()
