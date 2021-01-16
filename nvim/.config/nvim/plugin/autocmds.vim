" Filetype: Close location list
autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>

" Filetype: Conceal level
autocmd FileType markdown   setlocal conceallevel=0

" Filetype: Indenting and Tabs
autocmd FileType css        setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType fortran    setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType haskell    setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html       setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType lisp       setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType lua        setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown   setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python     setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType tex        setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4

" Filetype: Text width
autocmd FileType python     setlocal textwidth=79 colorcolumn=79
autocmd FileType tex        setlocal textwidth=79 colorcolumn=79

" Buffer: Determine filetype based on path
autocmd BufRead,BufNewFile *.cls setlocal filetype=tex
autocmd BufRead,BufNewFile *.nxc setlocal filetype=cpp
autocmd BufRead,BufNewFile *rc setlocal filetype=config
autocmd BufRead,BufNewFile if empty(&filetype) | ~/.config/* setlocal filetype=config | endif
autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/*/.config/* setlocal filetype=config | endif
autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/bash/* setlocal filetype=zsh | endif
autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/zsh/* setlocal filetype=zsh | endif

" Buffer: Disable continue comment on new line
autocmd BufRead,BufNewFile * setlocal formatoptions-=cro

" Miscellaneous: Auto close preview
autocmd InsertLeave * silent! pclose!

" Plugin: coc.nvim
set updatetime=50
autocmd CursorHold * silent     call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
autocmd FileType python let b:coc_root_patterns = ['.env', '.git']

" Plugin: nvim-scrollview
autocmd FileType python let b:scrollview_column=79
