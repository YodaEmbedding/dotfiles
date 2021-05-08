" Clear registers
command! WipeReg silent! call WipeReg()

" Copy search matches
command! -register CopyMatches call CopyMatches(<q-reg>)
