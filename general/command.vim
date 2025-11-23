" Command for neovim
"set makeprg="gcc -Wall -Wextra -Werror *.c -o prog"
set makeprg=gcc\ -Wall\ -Wextra\ -Werror\ *.c\ -o\ prog;

command! -nargs=? -complete=customlist,s:MakeComplete Make call s:make_compile(<q-args>)
" command! -nargs=? -complete=customlist,s:MakeComplete MakeRun call s:make_run(<q-args>)

"─────────────────────────────────────────────────────────────
" Complétion pour Make et MakeRun
"─────────────────────────────────────────────────────────────
function! s:MakeComplete(ArgLead, CmdLine, CursorPos)
    return filter(['c', 'cpp'], 'v:val =~ "^' . a:ArgLead . '"')
endfunction

"─────────────────────────────────────────────────────────────
" Change makeprg selon le type (c ou cpp), défaut = c
"─────────────────────────────────────────────────────────────
function! s:set_makeprg(type) abort
    let l:type = empty(a:type) ? 'c' : a:type
    if l:type == 'cpp'
        setlocal makeprg=g++\ -std=c++23\ -g\ -Wall\ -Wextra\ -Werror\ *.cpp\ -o\ prog
        return 'cpp'
    elseif l:type == 'c'
        setlocal makeprg=gcc\ -g\ -Wall\ -Wextra\ -Werror\ *.c\ -o\ prog
        return 'c'
    else
        echohl ErrorMsg
        echo "Type invalide : " . a:type . " (attendu : c ou cpp)"
        echohl None
        return ''
    endif
endfunction

"─────────────────────────────────────────────────────────────
" :Make → compile seulement
"─────────────────────────────────────────────────────────────
function! s:make_compile(type) abort
    let l:type = s:set_makeprg(a:type)
    if empty(l:type) | return | endif
    echo "Compilation" l:type
    make!
    if v:shell_error == 0
        echo "Compilation réussie"
    else
      copen
    endif
endfunction

"─────────────────────────────────────────────────────────────
" :MakeRun → compile + exécute si succès
"─────────────────────────────────────────────────────────────
function! s:make_run(type) abort
    let l:type = s:set_makeprg(a:type)
    if empty(l:type) | return | endif

    echo "Compilation" l:type "..."
    make!

    if v:shell_error != 0
        echo "Échec de compilation"
        copen
        return
    endif

    " 3. Cherche ou crée le buffer terminal nommé "⟨RUN⟩"
    let l:run_buf = bufnr('^⟨RUN⟩$')
    if l:run_buf == -1
        " Premier lancement → on crée le terminal
        below 12split
        execute 'terminal ./prog'
        file ⟨RUN⟩                       " on le renomme proprement
        setlocal bufhidden=hide nobuflisted
    else
        " Le buffer existe déjà → on le réutilise
        let l:win = bufwinnr(l:run_buf)
        if l:win == -1
            below 12split
            execute 'buffer' l:run_buf
        else
            execute l:win . 'wincmd w'       " on va dans la fenêtre existante
        endif

        " Nettoie l'écran + relance le binaire
        call term_sendkeys(l:run_buf, "\<C-l>./prog\r")
    endif

    " Remet le focus sur le code (optionnel, mais très pratique)
    " wincmd p
    
endfunction
