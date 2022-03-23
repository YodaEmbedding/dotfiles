" Colorscheme {{{1
let g:quantum_black = 1
let g:tokyonight_transparent = 1
" colorscheme quantum
colorscheme tokyonight

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

hi ScrollView       guibg=#9977aa

hi DiffAdd          guibg=#313e52 guifg=NONE
hi DiffChange       guibg=#43365C guifg=NONE
hi DiffDelete       guibg=#663b63 guifg=NONE
hi DiffText         guibg=#554575 guifg=NONE

hi IndentBlanklineChar      guifg=#382935

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

" Statusline colors {{{2
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLine guifg=NONE ctermfg=NONE
hi StatusLine gui=NONE   cterm=NONE

" Window title {{{1
set title               " Change window title to current buffer
set titlestring=%t      " Change window title

" Highlight groups {{{1
autocmd BufEnter * syn keyword Todo TODO       containedin=.*Comment
autocmd BufEnter * syn keyword Todo DEBUG      containedin=.*Comment
autocmd BufEnter * syn keyword Todo NOTE       containedin=.*Comment
autocmd BufEnter * syn keyword Todo TODOFIGURE containedin=.*Comment

hi LspDiagnosticsVirtualTextError   guifg=#6C5569
hi LspDiagnosticsVirtualTextHint    guifg=#5C4459

" hi LspDiagnosticsVirtualTextError   guifg=#6f5565
" hi LspDiagnosticsVirtualTextHint    guifg=#544454

hi GitSignsAdd      guifg=#2CC474
hi GitSignsChange   guifg=#8E73F6
hi GitSignsDelete   guifg=#FF436C

hi CmpItemAbbr              guifg=#bbbbbb
hi CmpItemAbbrMatch         guifg=#ccccff
hi CmpItemAbbrMatchFuzzy    guifg=#aaaaff
hi CmpItemKind              guifg=#bbbbee
hi CmpItemMenu              guifg=#bbbbee
" hi CmpItemAbbrDeprecated

hi VirtColumn       guifg=#402D3E
hi ColorColumn      guibg=NONE
