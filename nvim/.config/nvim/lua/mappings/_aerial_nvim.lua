local map = vim.keymap.set


map("n", "<Space>o", function() vim.cmd [[ execute "AerialToggle" ]] end)
