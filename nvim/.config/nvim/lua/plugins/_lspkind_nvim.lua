return {
  "onsails/lspkind-nvim",

  _ = {
    on_attach = function()
      if not _G.plugin_loaded("lspkind-nvim") then
        return
      end

      if _G.plugin_loaded("nvim-cmp") then
        return
      end

      require("lspkind").init {
        symbol_map = require("utils.lspkind_symbols")._.symbol_map,
      }
    end,
  },
}
