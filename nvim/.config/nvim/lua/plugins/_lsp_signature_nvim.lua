return {
  "ray-x/lsp_signature.nvim",

  enabled = false,

  _ = {
    on_attach = function()
      if not _G.plugin_loaded("lsp_signature.nvim") then
        return
      end

      require("lsp_signature").on_attach {
        --fix_pos = true,
        max_width = 80,
      }
    end
  },
}
