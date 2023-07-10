return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    require("lualine").setup {
      options = {
        theme = "palenight",
      },
      sections = {
        lualine_a = {},
        lualine_b = { { "filename", path = 1, newfile_status = true } },
        lualine_c = {},
        lualine_x = { "diff", "branch", "diagnostics", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
    }
  end,
}
