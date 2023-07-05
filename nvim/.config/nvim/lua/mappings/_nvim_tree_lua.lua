if not _G.plugin_loaded("nvim-tree.lua") then
  do return end
end

local vimp = require("vimp")

local n = vimp.nmap

-- n ("<space>t",  ":NvimTreeToggle<CR>")
