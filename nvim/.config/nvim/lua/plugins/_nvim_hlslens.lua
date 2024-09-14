return {
  "kevinhwang91/nvim-hlslens",

  config = function()
    local config = {

    }

    if _G.plugin_loaded("nvim-scrollbar") then
      config.handlers = { search = true }
      require("scrollbar.handlers.search").setup(config)
    else
      require("hlslens").setup(config)
    end
  end,
}
