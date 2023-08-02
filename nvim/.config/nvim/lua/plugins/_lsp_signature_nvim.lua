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

        -- Disable automatic floating window since nvim-cmp-lsp-signature-help
        -- already displays the signature in as a completion popup.
        floating_window = false,

        -- Enable virtual text hints, though!
        hint_enable = true,
      }
    end
  },
}
