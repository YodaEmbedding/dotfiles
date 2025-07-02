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
    checkbox = {
      bullet = true,
      right_pad = 2,
      -- right_pad = 4,
    },
    html = {
      comment = {
        conceal = false,
      },
    },
  },
}
