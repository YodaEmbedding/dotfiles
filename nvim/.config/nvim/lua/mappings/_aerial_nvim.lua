if not _G.plugin_loaded("aerial.nvim") then
  do return end
end

local map = vim.keymap.set

map("n", "<Space>o", function() require("aerial").toggle() end)
