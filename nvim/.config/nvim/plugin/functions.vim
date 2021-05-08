" Copy search matches
function! CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

" Wipe registers
function! WipeReg()
    for i in range(34,122)
        call setreg(nr2char(i), " ")
    endfor
endfunction
