local map = vim.keymap.set


vim.api.nvim_create_autocmd("User", {
  pattern = "BlameViewOpened",
  callback = function(event)
    local blame_type = event.data
    if blame_type == "window" then
      vim.cmd [[
        execute "LspLensOff"
        call feedkeys("\<C-w>h")
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
  ]]
end)
