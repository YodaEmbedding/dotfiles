---@format disable

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
  lsp_dynamic_workspace_symbols = function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end,
  lsp_implementations       = function() require("telescope.builtin").lsp_implementations() end,
  lsp_references            = function() require("telescope.builtin").lsp_references({show_line = false}) end,
}

return {
  { "<Space><Space>",  b.builtin,                       "n" },
  { "<Tab>",           b.buffers,                       "n" },
  { ",",               b.smart_open_cwd,                "n" },
  { "<Space>,",        b.smart_open,                    "n" },
  { "_",               b.current_buffer_fuzzy_find,     "n" },
  { "<CR>",            b.jumplist,                      "n" },
  { "-",               b.live_grep,                     "n" },
  { "<Space>m",        b.marks,                         "n" },
  { "<Space>r",        b.resume,                        "n" },
  { "<Space>:",        b.command_history,               "n" },

  { "gd",              b.lsp_definitions,               "n" },
  { "<C-t>",           b.lsp_dynamic_workspace_symbols, "n" },
  { "gi",              b.lsp_implementations,           "n" },
  { "gr",              b.lsp_references,                "n" },
}
