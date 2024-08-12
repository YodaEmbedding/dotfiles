local map = vim.keymap.set

map("n", "<Space>o", function() require("aerial").toggle() end)
