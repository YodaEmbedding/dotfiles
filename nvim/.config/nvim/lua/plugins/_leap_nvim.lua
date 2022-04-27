if not _G.plugin_loaded("leap.nvim") then
  do return end
end

require("leap").set_default_keymaps()

require("leap").setup {
  case_insensitive = true,
}

require("mappings._leap_nvim")
