return {
  "folke/tokyonight.nvim",

  config = function()
    -- See https://github.com/folke/tokyonight.nvim#%EF%B8%8F-configuration
    require("tokyonight").setup {
      -- style = "night",
      transparent = true,
      styles = {
        -- floats = "transparent",
        sidebars = "transparent",
      },
    }

    if vim.fn.exists("+termguicolors") then
      vim.cmd [[ colorscheme tokyonight ]]
    end
  end
}
