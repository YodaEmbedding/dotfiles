return {
  dependencies = {
    "neovim/nvim-lspconfig",
  },

  config = function()
    -- https://github.com/SmiteshP/nvim-navic#-customise
    require("nvim-navic").setup {
    }
  end,

  _ = {
    on_attach = function(client, bufnr)
      if not _G.plugin_loaded("nvim-navic") then
        return
      end

      if client.server_capabilities.documentSymbolProvider then
        require("nvim-navic").attach(client, bufnr)
      end
    end
  },
}
