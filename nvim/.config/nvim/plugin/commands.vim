" Clear registers
command! WipeReg lua require('utils').wipe_registers()

" Copy search matches
command! -register CopyMatches
    \ call luaeval("require('utils').copy_matches(_A)", <q-reg>)
