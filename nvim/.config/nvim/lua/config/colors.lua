local NONE = nil

local highlights = {

  -- vim diff
  DiffAdd                     = { bg = "#313e52", fg = NONE, },
  DiffChange                  = { bg = "#43365c", fg = NONE, },
  DiffDelete                  = { bg = "#663b63", fg = NONE, },
  DiffText                    = { bg = "#554575", fg = NONE, },

  -- Diagnostics
  DiagnosticVirtualTextError  = { bg = NONE, fg = "#905566", }, -- Default: bg = "#362c3d", fg = "#db4b4b",
  DiagnosticVirtualTextWarn   = { bg = NONE, fg = "#887755", }, -- Default: bg = "#373640", fg = "#e0af68",
  DiagnosticVirtualTextInfo   = { bg = NONE, fg = "#557788", }, -- Default: bg = "#22374b", fg = "#0db9d7",
  DiagnosticVirtualTextHint   = { bg = NONE, fg = "#665577", }, -- Default: bg = "#233745", fg = "#1abc9c",

  -- local-highlight.nvim
  LocalHighlight              = { bg = "#513965", }, -- Default: fg = "#dcd7ba",
  CWLocalHighlight            = { bg = "#443055", },

  -- indent-blankline.nvim
  IndentBlanklineChar         = { fg = "#382935", nocombine = true }, -- v2
  IblScope                    = { fg = "#382935", nocombine = true }, -- v3

  -- match-visual.nvim
  VisualMatch                 = { bg = "#514d6e", },

  -- nvim-hlslens
  HlSearchLens                = { bg = "#362956", fg = "#554466", },

  -- virt-column.nvim
  VirtColumn                  = { fg = "#402d3e", },

}

for key, attrs in pairs(highlights) do
  vim.api.nvim_set_hl(0, key, attrs)
end
