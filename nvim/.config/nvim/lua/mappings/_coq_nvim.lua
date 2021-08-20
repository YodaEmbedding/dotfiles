if not _G.plugin_loaded("coq_nvim") then
  do return end
end

local vimp = require("vimp")

local inoremap = vimp.inoremap

-- Defaults
-- inoremap({"silent", "expr"}, "<Esc>",   [[pumvisible() ? "\<C-e>\<Esc>" : "\<Esc>"]])
inoremap({"silent", "expr"}, "<C-c>",   [[pumvisible() ? "\<C-e>\<C-c>" : "\<C-c>"]])
inoremap({"silent", "expr"}, "<BS>",    [[pumvisible() ? "\<C-e>\<BS>"  : "\<BS>"]])
inoremap({"silent", "expr"}, "<CR>",    [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e>\<CR>" : "\<C-y>") : "\<CR>"]])
inoremap({"silent", "expr"}, "<Tab>",   [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
inoremap({"silent", "expr"}, "<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<BS>"]])

inoremap({"silent", "expr"}, "<Esc>",
  [[pumvisible() ? ]] ..
  [[  (complete_info().selected == -1 ? "\<Esc>" : "\<C-y>\<Esc>") : ]] ..
  [[  "\<Esc>"]]
)
