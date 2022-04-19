if not _G.plugin_loaded("lightspeed.nvim") then
  do return end
end

require("lightspeed").setup {
  ignore_case = true,
}

require("mappings._lightspeed_nvim")
