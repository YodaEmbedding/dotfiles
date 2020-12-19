" Auto close preview {{{1
autocmd InsertLeave * silent! pclose!

" Autocompletion {{{1
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Check up to date plugins {{{1
autocmd VimEnter * call CheckForUpdates()

" coc.nvim {{{1
if PlugLoaded('coc.nvim')
    set updatetime=50
    autocmd CursorHold * silent     call CocActionAsync('highlight')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd FileType python let b:coc_root_patterns = ['.env', '.git']
endif

" Color column {{{1
autocmd FileType python   setlocal colorcolumn=79

" Conceal level {{{1
autocmd FileType markdown setlocal conceallevel=0

" Disable continue comment on new line {{{1
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Folding {{{1
autocmd FileType conf,markdown,python,vim,zsh let anyfold_activate=0
autocmd FileType conf,markdown,python,vim,zsh setlocal foldminlines=1

"autocmd FileType *       setlocal foldmethod=indent
autocmd FileType conf     setlocal foldmethod=expr   foldexpr=FoldConfig()
autocmd FileType i3       setlocal foldmethod=expr   foldexpr=FoldConfig()
autocmd FileType fortran  setlocal foldmethod=expr   foldexpr=FoldFortran()
autocmd FileType markdown setlocal foldmethod=expr   foldexpr=FoldMarkdown()
autocmd FileType vim,zsh  setlocal foldmethod=marker
autocmd FileType c,cpp    setlocal foldmethod=syntax
autocmd FileType java     setlocal foldmethod=syntax
autocmd FileType rust     setlocal foldmethod=syntax foldnestmax=2
autocmd FileType python   setlocal foldtext=FoldTextStyle()

" Indenting and Tabs {{{1
autocmd FileType css        setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType fortran    setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType haskell    setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType html       setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType lisp       setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown   setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python     setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType tex        setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4
autocmd FileType typescript setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4

let fortran_do_enddo=1
let fortran_free_source=1
let fortran_fold=1

" Line wrapping {{{1
autocmd FileType tex        setlocal textwidth=79

" Remove trailing whitespace on file save {{{1
"autocmd FileType c,cpp,python autocmd BufWritePre <buffer> :FixWhitespace

" Syntax highlighting {{{1
autocmd BufRead,BufNewFile *.cls set filetype=tex
autocmd BufRead,BufNewFile *.nxc set filetype=cpp
autocmd BufRead,BufNewFile *rc set filetype=config
autocmd BufRead,BufNewFile ~/.config/* set filetype=config
autocmd BufRead,BufNewFile ~/dotfiles/*/.config/* set filetype=config
autocmd BufRead,BufNewFile ~/dotfiles/bash/* set filetype=zsh
autocmd BufRead,BufNewFile ~/dotfiles/zsh/* set filetype=zsh
