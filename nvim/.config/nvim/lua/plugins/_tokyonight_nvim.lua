return {
  "folke/tokyonight.nvim",

  lazy = false,
  priority = 1000,

  -- See https://github.com/folke/tokyonight.nvim#%EF%B8%8F-configuration
  opts = {
    -- style = "night",
    transparent = true,
    styles = {
      -- floats = "transparent",
      sidebars = "transparent",
    },
    on_colors = function(colors)
      local new_colors = {
        fg = "Grey70",
        git = {
          add = "#2cc474",
          change = "#8e73f6",
          delete = "#ff436c",
        },
      }
      for key, value in pairs(new_colors) do
        colors[key] = value
      end
    end,
    on_highlights = function(highlights, colors)
      local new_highlights = {
        -- Conceal = { fg = "#555555", },
        CursorLine = { bg = "#3d2946", },
        -- LineNr = { fg = "#6f6f6f", },
        ExtraWhitespace = { bg = "#473745", },
        MatchParen = { bg = "#446677", fg = "#dddddd", bold = true },
        -- NormalNC = { link = "Normal", },
        Pmenu = {
          bg = "#170725",
          fg = highlights.Pmenu.fg,
          blend = highlights.Pmenu.blend,
        },
        StatusLine = {},
        -- nvim-treesitter-context
        TreesitterContext = { bg = "#403659", },
        TreesitterContextLineNumber = { fg = "#554466", },
      }
      if vim.fn.has("gui_running") == 1 then
        new_highlights.Normal.bg = "#2e253d"
      end
      for key, attrs in pairs(new_highlights) do
        -- attrs = vim.tbl_extend("force", highlights[key] or {}, attrs)
        highlights[key] = attrs
      end
    end,
  },

  config = function(_, opts)
    require("tokyonight").setup(opts)

    if vim.fn.exists("+termguicolors") then
      vim.cmd [[ colorscheme tokyonight ]]
    end
  end
}
