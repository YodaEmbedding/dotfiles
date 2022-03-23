" Change window title to current buffer
set title
set titlestring=%t

let g:enable_bold_font = 1

if has("gui_running")
    set guioptions-=m               " Remove menubar
    set guioptions-=T               " Remove toolbar
    set guifont=Iosevka\ 15
    " set guifont=Roboto\ Mono\ 16
endif

if exists('+termguicolors')
    if !has('nvim')
        let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

" Comment-only keywords
autocmd BufEnter * syn keyword Todo DEBUG      containedin=.*Comment
autocmd BufEnter * syn keyword Todo FIX        containedin=.*Comment
autocmd BufEnter * syn keyword Todo FIXME      containedin=.*Comment
autocmd BufEnter * syn keyword Todo NOTE       containedin=.*Comment
autocmd BufEnter * syn keyword Todo TODO       containedin=.*Comment
autocmd BufEnter * syn keyword Todo TODOFIGURE containedin=.*Comment
autocmd BufEnter * syn keyword Todo WIP        containedin=.*Comment
