" Buffer: Auto-format on save
" autocmd BufWritePre * lua vim.lsp.buf.format()
autocmd BufWritePre * lua require("utils").format()

" Buffer: Disable continue comment on new line
autocmd BufRead,BufNewFile * setlocal formatoptions-=cro

" Miscellaneous: Highlight on yank
autocmd TextYankPost * lua vim.highlight.on_yank {timeout=500}

" Miscellaneous: Set read-only if swap file exists
autocmd SwapExists * let v:swapchoice = "o"
