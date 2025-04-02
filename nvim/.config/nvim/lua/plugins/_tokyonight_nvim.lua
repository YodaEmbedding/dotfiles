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
      }
      for key, value in pairs(new_colors) do
        colors[key] = value
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
