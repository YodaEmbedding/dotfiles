if not _G.plugin_loaded("blame.nvim") then
  do return end
end

local map = vim.keymap.set

map("n", "<Space>gb", function()
  vim.cmd [[
    execute "BlameToggle window"
    sleep 200m
    call feedkeys("\<C-w>l")
  ]]
end)
