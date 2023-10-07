return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "linrongbin16/lsp-progress.nvim",
  },

  config = function()
    local prose = require("nvim-prose")

    require("lualine").setup {
      options = {
        theme = "palenight",
      },
      sections = {
        lualine_a = {},
        lualine_b = { { "filename", path = 1, newfile_status = true } },
        lualine_c = { "require('lsp-progress').progress()" },
        lualine_x = {
          { prose.word_count,   cond = prose.is_available },
          -- { prose.reading_time, cond = prose.is_available },
          "diff",
          "branch",
          "diagnostics",
          "fileformat",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    }

    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User LspProgressStatusUpdated", {
      group = "lualine_augroup",
      callback = require("lualine").refresh,
    })
  end,
}
