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
  { "<Space><Space>",  b.builtin,                       desc = "Telescope" },
  { "<Tab>",           b.buffers,                       desc = "Buffers" },
  { ",",               b.smart_open_cwd,                desc = "Open file (cwd)" },
  { "<Space>,",        b.smart_open,                    desc = "Open file" },
  { "_",               b.current_buffer_fuzzy_find,     desc = "Fuzzy find" },
  { "<CR>",            b.jumplist,                      desc = "Jumplist" },
  { "-",               b.live_grep,                     desc = "Grep" },
  { "<Space>m",        b.marks,                         desc = "Marks" },
  { "<Space>r",        b.resume,                        desc = "Telescope resume" },
  { "<Space>:",        b.command_history,               desc = "Command history" },

  { "gd",              b.lsp_definitions,               desc = "Go to definition" },
  { "<C-t>",           b.lsp_dynamic_workspace_symbols, desc = "Workspace symbols" },
  { "gi",              b.lsp_implementations,           desc = "Implementations" },
  { "gr",              b.lsp_references,                desc = "References" },
}
