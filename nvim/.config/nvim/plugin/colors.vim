set background=dark

set pumblend=7  " Pseudo-transparency for popup menu (Pmenu)

hi Normal           guibg=NONE    guifg=Grey70                ctermbg=NONE  ctermfg=249
hi NormalNC         guibg=NONE                                ctermbg=NONE
hi ColorColumn      guibg=NONE
hi Conceal          guibg=NONE    guifg=#555555
hi CursorLine       guibg=#3D2946
hi ExtraWhitespace  guibg=#473745
hi Folded           guibg=#1E161F guifg=#6f6f6f
hi LineNr                         guifg=#6f6f6f
hi MatchParen       guibg=#446677 guifg=#dddddd gui=bold                                  cterm=bold
hi Pmenu            guibg=#170725
hi SignColumn       guibg=NONE
hi StatusLine       guibg=NONE    guifg=NONE    gui=NONE      ctermbg=NONE  ctermfg=NONE  cterm=NONE

if has("gui_running")
    hi Normal       guibg=#291935 guifg=Grey70
endif

" vim diff
hi DiffAdd          guibg=#313e52 guifg=NONE
hi DiffChange       guibg=#43365C guifg=NONE
hi DiffDelete       guibg=#663b63 guifg=NONE
hi DiffText         guibg=#554575 guifg=NONE

" Diagnostics
hi DiagnosticVirtualTextError guibg=NONE guifg=#905566
hi DiagnosticVirtualTextWarn  guibg=NONE guifg=#887755
hi DiagnosticVirtualTextInfo  guibg=NONE guifg=#557788
hi DiagnosticVirtualTextHint  guibg=NONE guifg=#665577

" gitsigns.nvim
hi GitSignsAdd                    guifg=#2CC474
hi GitSignsChange                 guifg=#8E73F6
hi GitSignsDelete                 guifg=#FF436C

" local-highlight.nvim
hi LocalHighlight   guibg=#4c395c
hi CWLocalHighlight guibg=#443055

" indent-blankline.nvim
hi IndentBlanklineChar            guifg=#382935

" nvim-cmp
hi CmpItemAbbr                    guifg=#bbbbbb
hi CmpItemAbbrMatch               guifg=#ccccff
hi CmpItemAbbrMatchFuzzy          guifg=#aaaaff
hi CmpItemKind                    guifg=#bbbbee
hi CmpItemMenu                    guifg=#bbbbee

" virt-column.nvim
hi VirtColumn                     guifg=#402D3E
