if not _G.plugin_loaded("blame.nvim") then
  do return end
end

local map = vim.keymap.set


vim.api.nvim_create_autocmd("User", {
  pattern = "BlameViewOpened",
  callback = function(event)
    local blame_type = event.data
    if blame_type == "window" then
      vim.cmd [[
        execute "LspLensOff"
      ]]
    end
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "BlameViewClosed",
  callback = function(event)
    local blame_type = event.data
    if blame_type == "window" then
      vim.cmd [[
        execute "LspLensOn"
      ]]
    end
  end,
})


map("n", "<Space>gb", function()
  vim.cmd [[
    execute "BlameToggle window"
    sleep 200m
    call feedkeys("\<C-w>l")
  ]]
end)
