" Clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), " ") | endfor

" Copy search matches
command! -register CopyMatches call CopyMatches(<q-reg>)
