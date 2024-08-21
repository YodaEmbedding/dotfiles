local map = vim.keymap.set


map("n", "<C-o>", function() require("before").jump_to_last_edit() end)
map("n", "<C-p>", function() require("before").jump_to_next_edit() end)
