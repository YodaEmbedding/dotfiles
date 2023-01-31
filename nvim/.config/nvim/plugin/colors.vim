set background=dark

if
  \ luaeval('_G.plugin_loaded("vim-quantum")') ||
  \ luaeval('_G.plugin_loaded("nvim-quantum")')
    let g:quantum_black = 1
    colorscheme quantum
endif

if luaeval('_G.plugin_loaded("tokyonight.nvim")')
    let g:tokyonight_transparent = 1
    colorscheme tokyonight
endif

"hi Normal          guibg=#332331
hi Normal           guibg=NONE    ctermbg=NONE
hi Normal           guifg=Grey70  ctermfg=249

hi NormalNC         guibg=NONE    ctermbg=NONE
" hi NormalNC         guifg=Grey70  ctermfg=249

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

hi StatusLine       guibg=NONE ctermbg=NONE
hi StatusLine       guifg=NONE ctermfg=NONE
hi StatusLine       gui=NONE   cterm=NONE

" vim diff
hi DiffAdd          guibg=#313e52 guifg=NONE
hi DiffChange       guibg=#43365C guifg=NONE
hi DiffDelete       guibg=#663b63 guifg=NONE
hi DiffText         guibg=#554575 guifg=NONE

hi LspDiagnosticsVirtualTextError   guifg=#6C5569
hi LspDiagnosticsVirtualTextHint    guifg=#5C4459

" coc.nvim
hi CocErrorFloat            guifg=#cc6666
hi CocErrorVirtualText      guifg=#5C4459
hi CocWarningVirtualText    guifg=#5C4459
hi CocInfoVirtualText       guifg=#5C4459

" gitsigns.nvim
hi GitSignsAdd      guifg=#2CC474
hi GitSignsChange   guifg=#8E73F6
hi GitSignsDelete   guifg=#FF436C

" indent-blankline.nvim
hi IndentBlanklineChar      guifg=#382935

" nvim-cmp
hi CmpItemAbbr              guifg=#bbbbbb
hi CmpItemAbbrMatch         guifg=#ccccff
hi CmpItemAbbrMatchFuzzy    guifg=#aaaaff
hi CmpItemKind              guifg=#bbbbee
hi CmpItemMenu              guifg=#bbbbee
" hi CmpItemAbbrDeprecated

" nvim-scrollview
hi ScrollView       guibg=#9977aa

" virt-column.nvim
hi ColorColumn      guibg=NONE
hi VirtColumn       guifg=#402D3E

if has("gui_running")
    hi Normal guibg=#332331
    hi Normal guifg=#EAEAEA
endif
