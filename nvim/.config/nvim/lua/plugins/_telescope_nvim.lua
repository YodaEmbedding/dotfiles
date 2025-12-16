---@format disable-next
local b = {
  builtin                   = function() require("telescope.builtin").builtin() end,
  buffers                   = function() require("telescope.builtin").buffers() end,
  smart_open                = function() require("telescope").extensions.smart_open.smart_open() end,
  smart_open_cwd            = function() require("telescope").extensions.smart_open.smart_open({cwd_only = true, filename_first = true}) end,
  current_buffer_fuzzy_find = function() require("telescope.builtin").current_buffer_fuzzy_find() end,
  jumplist                  = function() require("telescope.builtin").jumplist() end,
  live_grep                 = function() require("telescope.builtin").live_grep() end,
  marks                     = function() require("telescope.builtin").marks() end,
  resume                    = function() require("telescope.builtin").resume() end,
  command_history           = function() require("telescope.builtin").command_history() end,
  lsp_definitions           = function() require("telescope.builtin").lsp_definitions() end,
  lsp_implementations       = function() require("telescope.builtin").lsp_implementations() end,
  lsp_references            = function() require("telescope.builtin").lsp_references({show_line = false}) end,
  lsp_type_definitions      = function() require("telescope.builtin").lsp_type_definitions() end,
  lsp_incoming_calls        = function() require("telescope.builtin").lsp_incoming_calls() end,
  lsp_outgoing_calls        = function() require("telescope.builtin").lsp_outgoing_calls() end,
  lsp_document_symbols      = function() require("telescope.builtin").lsp_document_symbols() end,
  lsp_workspace_symbols     = function() require("telescope.builtin").lsp_workspace_symbols() end,
  lsp_dynamic_workspace_symbols = function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
}

return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    -- "aznhe21/actions-preview.nvim",
    "Myzel394/jsonfly.nvim",
    "nvim-lua/plenary.nvim",
    -- "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-smart-history.nvim",
    "prochri/telescope-all-recent.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    { "nvim-telescope/telescope-fzy-native.nvim" },
  },

  lazy = true,

  keys = {
    { "<Space><Space>", b.builtin,                       desc = "Telescope" },
    { "<Tab>",          b.buffers,                       desc = "Buffers" },
    { ",",              b.smart_open_cwd,                desc = "Open file (cwd)" },
    { "<Space>,",       b.smart_open,                    desc = "Open file" },
    -- { "_",              b.current_buffer_fuzzy_find,     desc = "Fuzzy find" },
    { "<CR>",           b.jumplist,                      desc = "Jumplist" },
    { "-",              b.live_grep,                     desc = "Grep" },
    { "<Space>m",       b.marks,                         desc = "Marks" },
    { "<Space>r",       b.resume,                        desc = "Telescope resume" },
    { "<Space>:",       b.command_history,               desc = "Command history" },

    { "gd",             b.lsp_definitions,               desc = "Go to definition" },
    { "gi",             b.lsp_implementations,           desc = "Go to implementation" },
    { "gr",             b.lsp_references,                desc = "Go to references" },
    { "gt",             b.lsp_type_definitions,          desc = "Go to type definition" },
    { "gCi",            b.lsp_incoming_calls,            desc = "Incoming calls" },
    { "gCo",            b.lsp_outgoing_calls,            desc = "Outgoing calls" },
    { "gS",             b.lsp_document_symbols,          desc = "Document symbols" },
    { "gW",             b.lsp_workspace_symbols,         desc = "Workspace symbols" },
    -- { "<C-t>",          b.lsp_dynamic_workspace_symbols, desc = "Workspace symbols (dynamic)" },
  },

  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local previewers = require("telescope.previewers")
    local sorters = require("telescope.sorters")

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

    local databases_dir = vim.fn.stdpath("data") .. "/databases"
    vim.fn.mkdir(databases_dir, "p")

    require("telescope").setup {
      defaults = {

        history = {
          path = databases_dir .. "/telescope_history.sqlite3",
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

        layout_strategy = "flex",

        layout_config = {
          flex = {
            flip_columns = 162,
            flip_lines = 0,
          },
          horizontal = {
            width = 0.99,
            preview_width = 0.5,
          },
          vertical = {
            height = 0.99,
            preview_cutoff = 22,
          },
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
          result_limit = 1000,
        },
      },

      pickers = {
        buffers = {
          ignore_current_buffer = true,
          -- sort_lastused = true,
          sort_mru = true,
        },
        live_grep = {
          additional_args = {
            "--hidden",
            "--glob", "!.git",
          },
        },
        lsp_dynamic_workspace_symbols = {
          -- sorter = sorters.get_generic_fuzzy_sorter(),
          -- sorter = sorters.get_fzy_sorter(),
          sorter = telescope.extensions.fzf.native_fzf_sorter(),
        }
      },
    }

    require("telescope-all-recent").setup {}

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("fzy_native")
    require("telescope").load_extension("jsonfly")
    require("telescope").load_extension("smart_history")
  end,
}
