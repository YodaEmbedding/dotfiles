if not _G.plugin_loaded("harpoon") then
  do return end
end

local ui = require("harpoon.ui")
local mark = require("harpoon.mark")
local vimp = require("vimp")

local nnoremap = vimp.nnoremap

nnoremap("<space>t",  ui.toggle_quick_menu)
nnoremap("<space>T",  mark.add_file)

-- nnoremap("", function () harpoon.ui.nav_file(1) end)

