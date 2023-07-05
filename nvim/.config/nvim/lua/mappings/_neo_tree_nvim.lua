if not _G.plugin_loaded("neo-tree.nvim") then
  do return end
end

local vimp = require("vimp")

local n = vimp.nmap

n ("<space>t",  ":NeoTreeFocusToggle<CR>")
