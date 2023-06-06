return {
  cmd = "Copilot",
  event = "InsertEnter",

  config = function()
    require("copilot").setup {

      panel = {
        enabled = false,      -- default: true
        auto_refresh = true,  -- default: false
        keymap = {
          jump_prev = "[[",   -- default: "[["
          jump_next = "]]",   -- default: "]]"
          accept = "<CR>",    -- default: "<CR>"
          refresh = "gr",     -- default: "gr"
          open = "<M-CR>",    -- default: "<M-CR>
        },
        layout = {
          position = "bottom", -- default: "bottom"
          ratio = 0.4,         -- default: 0.4
        },
      },

      suggestion = {
        enabled = true,          -- default: true
        auto_trigger = true,     -- default: false
        debounce = 75,           -- default: 75
        keymap = {
          accept      = "<C-t>", -- default: "<M-l>"
          accept_word = "<C-w>", -- default: false
          accept_line = "<C-f>", -- default: false
          next        = "<C-g>", -- default: "<M-]>"
          prev        = "<C-b>", -- default: "<M-[>"
          dismiss     = "<C-x>", -- default: "<C-]>"
        },
      },

      server_opts_overrides = {
        -- settings = {
        --   advanced = {
        --     listCount = 10,         -- number of completions for panel
        --     inlineSuggestCount = 3, -- number of completions for getCompletions
        --   },
        -- },
      },

    }
  end,
}
