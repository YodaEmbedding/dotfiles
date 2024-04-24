return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    -- "aznhe21/actions-preview.nvim",
    "Myzel394/jsonfly.nvim",
    "nvim-lua/plenary.nvim",
  },

  lazy = true,

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

        mappings = {
          i = {
            ["<Esc>"] = actions.close,
            ["<C-c>"] = function()
              vim.cmd [[stopinsert]]
            end,
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

    -- require("mappings._telescope_nvim")

    require("telescope").load_extension("jsonfly")
  end,
}
