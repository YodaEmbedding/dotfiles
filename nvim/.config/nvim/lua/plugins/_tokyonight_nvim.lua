return {
  config = function()
    -- See https://github.com/folke/tokyonight.nvim#%EF%B8%8F-configuration
    require("tokyonight").setup {
      -- style = "night",
    }

    vim.cmd [[ colorscheme tokyonight ]]
  end
}
