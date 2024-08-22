return {
  "nathom/filetype.nvim",

  enabled = false,

  init = function()
    -- Do not source the default filetype.vim
    -- (required by Neovim <v0.6)
    -- vim.g.did_load_filetypes = 1
  end,

  opts = {
    overrides = {

      extensions = {
        cls = "tex",
        nxc = "cpp",
      },

      literal = {
        -- gtkrc = "config",
      },

      complex = {
        [".*rc$"] = "config",
        -- [".*/.config/.*$"] = "config",
      },

      function_extensions = {
        -- filetype = function()
        --   vim.bo.filetype = "config"
        --   vim.cmd("syntax off")
        -- end,
      },

      function_literal = {
      },

      function_complex = {
      },

      shebang = {
      },

    },
  },
}
