local vimp = require("vimp")

local inoremap = vimp.inoremap
local nnoremap = vimp.nnoremap
local xnoremap = vimp.xnoremap

inoremap({"silent", "expr"}, "<C-space>", "coc#refresh()")
inoremap({"silent", "expr"}, "<C-k>", "CocActionAsync('showSignatureHelp')")
nnoremap({"silent"}, "[c", "<Plug>(coc-diagnostic-prev)")
nnoremap({"silent"}, "]c", "<Plug>(coc-diagnostic-next)")
nnoremap({"silent"}, "gd", "<Plug>(coc-definition)")
nnoremap({"silent"}, "gi", "<Plug>(coc-implementation)")
nnoremap({"silent"}, "gr", "<Plug>(coc-references)")
nnoremap({"silent"}, "gt", "<Plug>(coc-type-definition)")
nnoremap("<Leader>=", "<Plug>(coc-format-selected)")
xnoremap("<Leader>=", "<Plug>(coc-format-selected)")
nnoremap("<Leader>aa", "<Plug>(coc-codeaction-selected)")
xnoremap("<Leader>aa", "<Plug>(coc-codeaction-selected)")
nnoremap("<Leader>ac", "<Plug>(coc-codeaction)")
nnoremap("<Leader>qf", "<Plug>(coc-fix-current)")
nnoremap("<Leader>rn", "<Plug>(coc-rename)")

nnoremap({"silent"}, "<space><space>", ":<C-u>CocList<CR>")
nnoremap({"silent"}, "<C-space>", ":<C-u>CocListResume<CR>")
nnoremap({"silent"}, "<space>a", ":<C-u>CocList actions<CR>")
nnoremap({"silent"}, "<space>c", ":<C-u>CocList commands<CR>")
nnoremap({"silent"}, "<space>d", ":<C-u>CocList diagnostics<CR>")
nnoremap({"silent"}, "<space>m", ":<C-u>CocList marks<CR>")
nnoremap({"silent"}, "<space>o", ":<C-u>CocList outline<CR>")
nnoremap({"silent"}, "<space>q", ":<C-u>CocList quickfix<CR>")
nnoremap({"silent"}, "<space>s", ":<C-u>CocList -I symbols<CR>")
nnoremap({"silent"}, "<space>y", ":<C-u>CocList -A --normal yank<CR>")

-- TODO use lua functions rather than weird vimscript
nnoremap({"silent", "expr"}, "K",
  "(coc#float#has_float() "
  .. "? ':call coc#float#close_all()<CR>' "
  .. ": ':lua require(\"utils\").coc_documentation()<CR>')"
)
nnoremap({"silent", "expr"}, "<C-k>",
  "(exists('w:float') "
  .. "? ':call coc#float#close_all()<CR>' "
  .. ": coc#float#has_float() "
  .. "? ':call coc#float#jump()<CR>' "
  .. ": ':lua require(\"utils\").coc_documentation()<CR>')"
)

inoremap({"silent", "expr"}, "<Tab>",
  [[pumvisible() ? '\<C-n>' : ]] ..
  [[luaeval('require("utils").check_backspace()') ? '\<Tab>' : ]] ..
  [[coc#refresh()]]
)
inoremap({"expr"}, "<S-Tab>", [[pumvisible() ? '\<C-p>' : '\<C-h>']])
