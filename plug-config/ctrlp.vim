map <leader>f :CtrlP<CR>
map <leader>o :Rg<CR>
map <leader>w :Windows<CR>
map <leader>b :CtrlPBuffer<CR>
nnoremap <C-f> :BLines<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](.git|.hg|.svn|vendor|node_modules|.github|build|.next|var)$',
  \ 'file': '\v(exe|so|dll|-lock.json)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
