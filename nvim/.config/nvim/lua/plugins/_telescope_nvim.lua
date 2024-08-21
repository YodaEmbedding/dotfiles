return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    -- "aznhe21/actions-preview.nvim",
    "Myzel394/jsonfly.nvim",
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-smart-history.nvim",
    "prochri/telescope-all-recent.nvim",
  },

  lazy = true,

  keys = require("mappings._telescope_nvim"),

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")

    local function buffer_previewer_maker(filepath, bufnr, opts)
      opts = opts or {}
      filepath = vim.fn.expand(filepath)
      vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then
          return
        end
        if stat.size > 100000 then
          return
        else
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
      end)
    end

    telescope.setup {
      defaults = {

        history = {
          path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
          limit = 100,
        },

        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-c>"] = function()
              vim.cmd [[stopinsert]]
            end,
            ["<C-n>"] = require("telescope.actions").cycle_history_next,
            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
            ["<C-j>"] = require("telescope.actions").cycle_history_next,
            ["<C-k>"] = require("telescope.actions").cycle_history_prev,
          },
        },

        layout_config = {
          horizontal = {
            height_padding = 1,
            width = 0.98,
          },
          vertical = {
            height_padding = 1,
          },
          preview_cutoff = 180,
        },

        buffer_previewer_maker = buffer_previewer_maker,

      },

      extensions = {
        frecency = {
          default_workspace = "CWD",
        },
        smart_open = {
          show_scores = false,
          ignore_patterns = {"*.git/*", "*/tmp/*"},
          match_algorithm = "fzy",
        },
      },

      pickers = {
        buffers = {
          ignore_current_buffer = true,
          -- sort_lastused = true,
          sort_mru = true,
        },
      },
    }

    require("telescope").load_extension("jsonfly")
    require("telescope").load_extension("smart_history")
  end,
}
