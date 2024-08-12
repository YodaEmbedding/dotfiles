local map = vim.keymap.set


map("n", "<space>t", ":Trouble<CR>")
map("n", "<space>l", ":Trouble loclist toggle<CR>")
map("n", "<space>q", ":Trouble quickfix toggle<CR>")
map("n", "<space>w", ":Trouble diagnostics toggle<CR>")
