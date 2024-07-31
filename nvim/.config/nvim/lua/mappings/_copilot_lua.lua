if not _G.plugin_loaded("copilot.lua") then
  do return end
end

vim.keymap.set("n", "<Leader>c", function()
  local was_enabled = require("copilot.client").buf_is_attached(0)
  vim.cmd [[Copilot toggle]]
  local is_enabled = require("copilot.client").buf_is_attached(0)
  assert(was_enabled ~= is_enabled)
  print(is_enabled)
end, { silent = true })
