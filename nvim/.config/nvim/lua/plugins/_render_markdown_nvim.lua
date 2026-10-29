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
      unchecked = { icon = "☐ " },
      checked = { icon = "☑ " },

      -- See Minimal / Things as reference: https://minimal.guide/checklists
      -- stylua: ignore
      custom = {
        -- Lifecycle
        todo        = { raw = "[/]", rendered = "◐ ", highlight = "RenderMarkdownTodo" },
        cancelled   = { raw = "[-]", rendered = "⊘ ", highlight = "Comment" },
        forwarded   = { raw = "[>]", rendered = "➜ ", highlight = "RenderMarkdownInfo" },
        scheduled   = { raw = "[<]", rendered = "◷ ", highlight = "RenderMarkdownHint" },

        -- Annotations
        question    = { raw = "[?]", rendered = "? ", highlight = "RenderMarkdownWarn" },
        important   = { raw = "[!]", rendered = "‼ ", highlight = "RenderMarkdownError" },
        bookmark    = { raw = "[b]", rendered = "⚑ ", highlight = "RenderMarkdownHint" },
        information = { raw = "[i]", rendered = "ⓘ ", highlight = "RenderMarkdownInfo" },
        idea        = { raw = "[I]", rendered = "💡 ", highlight = "RenderMarkdownHint" },
      },
    },
    html = {
      comment = {
        conceal = false,
      },
    },
  },
}
