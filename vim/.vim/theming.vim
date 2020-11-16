" Colorscheme {{{1
" Favorites: cobalt, desert, hybrid_reverse, hybrid_material, quantum, solarized
let g:quantum_black=1
colorscheme quantum

" Colors {{{1
set background=dark
if exists('+termguicolors')
    if !has('nvim')
        let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

"hi Normal          guibg=#332331
hi Normal           guibg=NONE    ctermbg=NONE
hi Normal           guifg=Grey70  ctermfg=249

hi ColorColumn      guibg=#372735
hi Conceal          guibg=NONE
hi Conceal          guifg=#555555
hi CursorLine       guibg=#402B3D
hi ExtraWhitespace  guibg=#473745
hi Folded           guibg=#1E161F
hi Folded           guifg=#6f6f6f
hi LineNr           guifg=#6f6f6f
hi MatchParen       guibg=#446677
hi MatchParen       guifg=#dddddd
hi Pmenu            guibg=#473745

hi CocErrorFloat            guifg=#cc6666
hi CocErrorVirtualText      guifg=#5C4459
hi CocWarningVirtualText    guifg=#5C4459
hi CocInfoVirtualText       guifg=#5C4459

" NOTE Temporary fix
autocmd User CocOpenFloat
    \   if exists('w:float')
    \ |     setl colorcolumn=
    \ | endif

if has('gui_running')
    hi Normal guibg=#332331
    hi Normal guifg=#EAEAEA
endif

" Font {{{1
if has("gui_running")
    set guifont=Roboto\ Mono\ 16
endif

let g:enable_bold_font = 1

" Statusline {{{1

" Statusline definition {{{2
set statusline=                                 " Clear
set statusline+=\                               " -
set statusline+=%t                              " Tail of the filename
set statusline+=%h                              " Help file flag
set statusline+=%r                              " Read only flag
set statusline+=%m                              " Modified flag
set statusline+=%=                              " Left/right separator
set statusline+=\                               " -
set statusline+=%{g:pluginUpdateStatus}         " Up to date plugins
set statusline+=\ \                             " --
set statusline+=%{&filetype}                    " Filetype
set statusline+=\ \                             " --
set statusline+=%{&fenc}                        " File encoding
set statusline+=[%{&ff}]                        " File format
set statusline+=[                               " Indent settings: begin
set statusline+=%{&expandtab?\"sp\":\"tab\"}\   " Indent settings
set statusline+=%{&shiftwidth}                  " Indent settings
set statusline+=]                               " Indent settings: end
set statusline+=\ \ \ \                         " ----
set statusline+=%2v                             " Cursor column (virtual)
set statusline+=\ \                             " --
set statusline+=(%l\ /\ %L)                     " Cursor line/total lines

" Statusline colors {{{2
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLine guifg=NONE ctermfg=NONE
hi StatusLine gui=NONE   cterm=NONE

" Window title {{{1
set title               " Change window title to current buffer
set titlestring=%t      " Change window title

" Highlight groups {{{1
autocmd BufEnter * syn keyword Todo DEBUG      containedin=.*Comment
autocmd BufEnter * syn keyword Todo NOTE       containedin=.*Comment
autocmd BufEnter * syn keyword Todo TODOFIGURE containedin=.*Comment
