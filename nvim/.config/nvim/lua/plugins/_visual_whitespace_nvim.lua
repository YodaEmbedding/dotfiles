return {
  "mcauley-penney/visual-whitespace.nvim",

  -- opts = {
  --   highlight = {
  --     link = "Visual",
  --   },
  -- },

  config = function(_, opts)
    require("visual-whitespace").setup(opts)

    local default_fg = "#5d5f71"

    local on_colorscheme_change = function()
      local visual_hl = vim.api.nvim_get_hl(0, { name = "Visual" })
      vim.api.nvim_set_hl(0, "VisualNonText", {
        fg = default_fg,
        bg = visual_hl and visual_hl.bg,
      })
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = on_colorscheme_change,
    })

    on_colorscheme_change()
  end,
}
