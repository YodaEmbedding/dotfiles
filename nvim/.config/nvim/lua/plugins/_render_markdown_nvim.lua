return {
  "MeanderingProgrammer/render-markdown.nvim",

  dependencies = {
    "nvim-treesitter/nvim-treesitter",

    "nvim-tree/nvim-web-devicons",
    -- "echasnovski/mini.nvim",
    -- "echasnovski/mini.icons",
  },

  ---@module "render-markdown"
  ---@type render.md.UserConfig
  opts = {
    html = {
      comment = {
        conceal = false,
      },
    },
  },
}
