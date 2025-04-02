-- Clear registers
vim.api.nvim_create_user_command("WipeReg", function()
  require("utils").wipe_registers()
end, {})

-- Copy search matches to a register (default is ")
vim.api.nvim_create_user_command("CopyMatches", function(opts)
  local register = opts.args or '"'
  require("utils").copy_matches(register)
end, { nargs = 1 })

-- Remove old swap files
vim.api.nvim_create_user_command("SwapRemoveOld", function()
  require("utils").buf_remove_old_swap()
end, {})
