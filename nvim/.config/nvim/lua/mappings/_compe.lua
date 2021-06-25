if not _G.plugin_loaded("nvim-compe") then
  do return end
end

local vimp = require("vimp")

local inoremap = vimp.inoremap

inoremap({"silent", "expr"}, "<C-Space>", "compe#complete()")
inoremap({"silent", "expr"}, "<CR>",      "compe#confirm('<CR>')")
inoremap({"silent", "expr"}, "<C-e>",     "compe#close('<C-e>')")
inoremap({"silent", "expr"}, "<C-f>",     "compe#scroll({ 'delta': +4 })")
inoremap({"silent", "expr"}, "<C-d>",     "compe#scroll({ 'delta': -4 })")
