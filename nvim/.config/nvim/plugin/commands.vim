" Clear registers
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), " ") | endfor

" Copy search matches
command! -register CopyMatches call CopyMatches(<q-reg>)

" fzf.vim
command! -bang -nargs=? -complete=dir LocateFiles
    \ call fzf#run(fzf#wrap({
    \     'source': 'locate --database=./.locate.db <q-args>',
    \     'options': '-m' },
    \   <bang>0))

command! -bang -nargs=* -complete=dir SmartFiles
    \ call SmartFiles(<q-args>)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, &columns > 120 ?
    \ fzf#vim#with_preview() : {}, <bang>0)

command! -bang -nargs=? -complete=dir Buffers
    \ call fzf#vim#buffers(<q-args>, &columns > 120 ?
    \ fzf#vim#with_preview() : {}, <bang>0)
