if exists('+termguicolors')
    set termguicolors
endif

if has("gui_running")
    set guifont=Iosevka\ 15
    " set guifont=Roboto\ Mono\ 16
endif

" Comment-only keywords
autocmd BufEnter * syn keyword Todo DEBUG      containedin=.*Comment
autocmd BufEnter * syn keyword Todo FIX        containedin=.*Comment
autocmd BufEnter * syn keyword Todo TODOFIGURE containedin=.*Comment
autocmd BufEnter * syn keyword Todo WIP        containedin=.*Comment
" Defaults:
" autocmd BufEnter * syn keyword Fixme FIXME     containedin=.*Comment
" autocmd BufEnter * syn keyword Note NOTE       containedin=.*Comment
" autocmd BufEnter * syn keyword Todo TODO       containedin=.*Comment
