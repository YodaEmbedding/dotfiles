" Change window title to current buffer
set title
set titlestring=%t

if exists('+termguicolors')
    set termguicolors
endif

let g:enable_bold_font = 1

if has("gui_running")
    set guifont=Iosevka\ 15
    " set guifont=Roboto\ Mono\ 16
endif

" Comment-only keywords
autocmd BufEnter * syn keyword Todo TODO       containedin=.*Comment
autocmd BufEnter * syn keyword Todo DEBUG      containedin=.*Comment
autocmd BufEnter * syn keyword Todo NOTE       containedin=.*Comment
autocmd BufEnter * syn keyword Todo TODOFIGURE containedin=.*Comment
