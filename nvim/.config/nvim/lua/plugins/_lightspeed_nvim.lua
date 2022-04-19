if not _G.plugin_loaded("lightspeed.nvim") then
  do return end
end

vim.g.lightspeed_no_default_keymaps = true

require("lightspeed").setup {
  ignore_case = true,
}

require("mappings._lightspeed_nvim")
