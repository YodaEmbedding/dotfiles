if not _G.plugin_loaded("vim-slime") then
  do return end
end

vim.g.slime_target = "tmux"
-- vim.g.slime_python_ipython = 1
