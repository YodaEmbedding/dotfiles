return {
  "nvim-lualine/lualine.nvim",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "linrongbin16/lsp-progress.nvim",
  },

  config = function()
    local diff_source = nil
    if _G.plugin_loaded("gitsigns.nvim") then
      diff_source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed
          }
        end
      end
    end

    require("lualine").setup {
      options = {
        theme = "palenight",
      },

      sections = {
        -- Left outer
        lualine_a = {
        },

        -- Left mid
        lualine_b = {
          { "filename", path = 1, newfile_status = true },
        },

        -- Left inner
        lualine_c = {
          "require('lsp-progress').progress()",
        },

        -- Right inner
        lualine_x = {
          -- "diff",
          -- { "diff", cond = not _G.plugin_loaded("gitsigns.nvim") },
          -- { "diff", source = diff_source },
          -- "branch",
          -- { "b:gitsigns_head", icon = "" },
          "diagnostics",
          "fileformat",
          { "filetype", icon_only = true },
        },

        -- Right mid
        lualine_y = {
        },

        -- Right outer
        lualine_z = {
          "location",
        },
      },
    }

    vim.api.nvim_create_augroup("lualine_augroup", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = "lualine_augroup",
      pattern = "LspProgressStatusUpdated",
      callback = require("lualine").refresh,
    })
  end,
}
