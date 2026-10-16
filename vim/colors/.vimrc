" ===== COULEURS =====
syntax on                 " coloration syntaxique
filetype plugin indent on " détecte le langage (C, JS, Python...)
set termguicolors         " vraies couleurs (Ghostty les supporte)
colorscheme saturnes_vapor   " ta palette (~/.vim/colors/saturnes_vapor.vim)
" ====================

" ===== CUSTOM HEADER =====
function! InsertHeader()
    let w = 74
    let sep   = repeat('*', w)
    let empty = repeat(' ', w)

    let art = [
        \ "  ================================================.",
        \ "       .-.   .-.     .--.                         |",
        \ "      | OO| | OO|   / _.-' .-.   .-.  .-.   .''.  |",
        \ "      |   | |   |   \\  '-. '-'   '-'  '-'   '..'  |",
        \ "      '^^^' '^^^'    '--'                         |",
        \ "  ===============.  .-.  .================.  .-.  |",
        \ "                 | |   | |                |  '-'  |",
        \ "                 | |   | |                |       |",
        \ "                 | ':-:' |                |  .-.  |",
        \ "  l42            |  '-'  |                |  '-'  |",
        \ "  ==============='       '================'       |",
    \ ]

    let header = [
        \ '/* ' . sep   . ' */',
        \ '/* ' . empty . ' */',
    \ ]

    for line in art
        let pad = w - len(line)
        if pad < 0 | let pad = 0 | endif
        call add(header, '/* ' . line . repeat(' ', pad) . ' */')
    endfor

    call add(header, '/* ' . empty . ' */')
    call add(header, '/* ' . sep   . ' */')
    call add(header, '')

    call append(0, header)
    echo "Header inserted!"
endfunction

command! Saynt call InsertHeader()
nnoremap <F2> :call InsertHeader()<CR>
" ==========================
