return {
  "nvim-treesitter/nvim-treesitter",

  version = "*",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = "all",
      ignore_install = { "wing" },
      highlight = {
        enable = true,
        disable = { "latex" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = {
        enable = true,
        disable = {
          -- "javascript",
          "python",
        },
      },
      textobjects = {
        enable = true,
        move = {
          enable = true,
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["g>>"] = "@parameter.inner",
            ["g>f"] = "@function.outer",
          },
          swap_previous = {
            ["g<<"] = "@parameter.inner",
            ["g<f"] = "@function.outer",
          },
        },
      },
    }

    -- vim.cmd [[set foldmethod=expr]]
    -- vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
  end,
}
