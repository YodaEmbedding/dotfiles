return {
  _ = {
    on_attach = function()
      if not _G.plugin_loaded("lspkind-nvim") then
        return
      end

      if _G.plugin_loaded("nvim-cmp") then
        return
      end

      local config = require("utils.lspkind_symbols")._
      require("lspkind").init {
        symbol_map = config.symbol_map,
      }
    end,
  },
}
