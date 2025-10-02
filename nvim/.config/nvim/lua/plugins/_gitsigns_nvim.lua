return {
  "lewis6991/gitsigns.nvim",

  opts = {
    -- See https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#keymaps
    on_attach = function(bufnr)
      local mappings = require("plugins._gitsigns_nvim")._.keys
      require("utils").set_buffer_local_mappings(mappings, bufnr)
    end,
  },

  _ = {
    keys = {

      -- Navigation
      {
        "]c",
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "]c", bang = true })
          else
            require("gitsigns").nav_hunk("next")
          end
        end,
        desc = "Go to next Git hunk",
      },
      {
        "[c",
        function()
          if vim.wo.diff then
            vim.cmd.normal({ "[c", bang = true })
          else
            require("gitsigns").nav_hunk("prev")
          end
        end,
        desc = "Go to previous Git hunk",
      },

      -- Hunks
      {
        -- WARN: <C-m> maps to <CR> (Enter) in terminal.
        "<C-m>",
        function() require("gitsigns").stage_hunk() end,
        desc = "Git stage hunk",
      },
      {
        "<space>ghs",
        function() require("gitsigns").stage_hunk() end,
        desc = "Git stage hunk",
      },
      {
        "<C-m>",
        function() require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
        "v",
        desc = "Git stage hunk",
      },
      {
        "<space>ghs",
        function() require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
        "v",
        desc = "Git stage hunk",
      },
      {
        "<C-n>",
        function()
          require("gitsigns").stage_hunk()
          require("gitsigns").nav_hunk("next")
        end,
        desc = "Git stage hunk then go to next Git hunk",
      },
      {
        "<C-n>",
        function()
          require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") }
          require("gitsigns").nav_hunk("next")
        end,
        "v",
        desc = "Git stage hunk then go to next Git hunk",
      },
      {
        "<space>ghr",
        function() require("gitsigns").reset_hunk() end,
        desc = "Git reset hunk",
      },
      {
        "<space>ghr",
        function() require("gitsigns").reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
        "v",
        desc = "Git reset hunk",
      },
      {
        "<space>ghS",
        function() require("gitsigns").stage_buffer() end,
        desc = "Git stage buffer",
      },
      {
        "<space>ghu",
        function() require("gitsigns").undo_stage_hunk() end,
        desc = "Git undo stage hunk",
      },
      {
        "<space>ghR",
        function() require("gitsigns").reset_buffer() end,
        desc = "Git reset buffer",
      },
      {
        "<space>ghp",
        function() require("gitsigns").preview_hunk() end,
        desc = "Git preview hunk",
      },

      -- Blame
      {
        "<space>gb<space>",
        function() require("gitsigns").blame() end,
        desc = "Git blame (Gitsigns)",
      },
      {
        "<space>gbl",
        function() require("gitsigns").blame_line { full = true } end,
        desc = "Git blame line",
      },
      {
        "<space>gbt",
        function() require("gitsigns").toggle_current_line_blame() end,
        desc = "Git blame current line toggle",
      },

      -- Diff
      {
        "<space>gdh",
        function() require("gitsigns").diffthis() end,
        desc = "Git diff",
      },
      {
        "<space>gd~",
        function() require("gitsigns").diffthis("~") end,
        desc = "Git diff (HEAD~)",
      },
      {
        "<space>gdt",
        function() require("gitsigns").toggle_deleted() end,
        desc = "Git toggle deleted",
      },

      -- Text object
      {
        "ih",
        ":<C-U>Gitsigns select_hunk<CR>",
        { "o", "x" },
        desc = "Git select hunk",
      },

    },
  },
}
