local map = vim.keymap.set


map("n", "<Space>gb", function()
  vim.cmd [[
    execute "BlameToggle window"
  ]]
end)
