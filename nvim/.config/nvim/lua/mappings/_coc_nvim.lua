if not _G.plugin_loaded("coc.nvim") then
  do return end
end

local vimp = require("vimp")
local utils = require("utils")

local inoremap = vimp.inoremap
local nnoremap = vimp.nnoremap
local xnoremap = vimp.xnoremap
local nmap = vimp.nmap
local xmap = vimp.xmap


---@format disable

-- Navigation
nmap("gd",  "<Plug>(coc-definition)")
nmap("gD",  "<Plug>(coc-declaration)")
nmap("gi",  "<Plug>(coc-implementation)")
nmap("gr",  "<Plug>(coc-references)")
nmap("gS",  "<Plug>(coc-list-symbols)")
nmap("gt",  "<Plug>(coc-type-definition)")
nmap("gw",  "<Plug>(coc-action-getWorkspaceSymbols)")

-- Documentation
inoremap({"silent", "expr"}, "<C-k>", "CocActionAsync('showSignatureHelp')")
nnoremap("K",     utils.coc_documentation_openclose)
nnoremap("<C-k>", utils.coc_documentation_openjumpclose)

-- Diagnostics
nmap("[c", "<Plug>(coc-diagnostic-prev)")
nmap("]c", "<Plug>(coc-diagnostic-next)")
nnoremap("<space>d", ":<C-u>CocList diagnostics<CR>")

-- Refactoring
nmap("<space>a",  "<Plug>(coc-codeaction)")
nmap("<space>A",  "<Plug>(coc-codeaction-selected)")
xmap("<space>a",  "<Plug>(coc-codeaction-selected)")
nmap("<space>f",  "<Plug>(coc-format)")
nmap("<space>F",  "<Plug>(coc-format-selected)")
xmap("<space>f",  "<Plug>(coc-format-selected)")
nmap("<space>qf", "<Plug>(coc-fix-current)")
nmap("<space>rn", "<Plug>(coc-rename)")

-- CocList
inoremap({"silent", "expr"}, "<C-space>", "coc#refresh()")
nnoremap("<space><space>", ":<C-u>CocList<CR>")
nnoremap("<C-space>", ":<C-u>CocListResume<CR>")
-- nnoremap("<space>a", ":<C-u>CocList actions<CR>")
nnoremap("<space>c",  ":<C-u>CocList commands<CR>")
nnoremap("<space>m",  ":<C-u>CocList marks<CR>")
nnoremap("<space>o",  ":<C-u>CocList outline<CR>")
nnoremap("<space>qq", ":<C-u>CocList quickfix<CR>")
nnoremap("<space>s",  ":<C-u>CocList -I symbols<CR>")
nnoremap("<space>y",  ":<C-u>CocList -A --normal yank<CR>")

-- Miscellaneous
inoremap({"silent", "expr"}, "<Tab>",
  [[pumvisible() ? '\<C-n>' : ]] ..
  [[luaeval('require("utils").check_backspace()') ? '\<Tab>' : ]] ..
  [[coc#refresh()]]
)
inoremap({"expr"}, "<S-Tab>", [[pumvisible() ? '\<C-p>' : '\<C-h>']])
