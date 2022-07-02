" Buffer: Auto-format on save
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()

" Buffer: Disable continue comment on new line
autocmd BufRead,BufNewFile * setlocal formatoptions-=cro

" Miscellaneous: Auto close preview
autocmd InsertLeave * silent! pclose!

" Miscellaneous: Highlight on yank
autocmd TextYankPost * lua vim.highlight.on_yank {timeout=500}

" Miscellaneous: Set read-only if swap file exists
autocmd SwapExists * let v:swapchoice = "o"

" Plugin: coc.nvim
if v:lua.plugin_loaded("coc.nvim")
    set updatetime=50
    autocmd CursorHold * silent     call CocActionAsync("highlight")
    autocmd User CocJumpPlaceholder call CocActionAsync("showSignatureHelp")
end
