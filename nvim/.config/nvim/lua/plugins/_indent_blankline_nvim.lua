if not _G.plugin_loaded("indent-blankline.nvim") then
  do return end
end

require("indent_blankline").setup {
  char = "│",
  show_current_context = true,
  show_current_context_start = true,
  show_first_indent_level = false,
  use_treesitter = true,
}
