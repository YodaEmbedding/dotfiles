vim.o.background = "dark"
vim.o.pumblend = 7 -- Pseudo-transparency for popup menu (Pmenu)

local NONE = nil

local colors = {

  -- Base
  -- { "Normal",                      { bg = NONE, fg = "Grey70", ctermbg = NONE, ctermfg = 249, }, },
  -- { "NormalNC",                    { link = "Normal", }, },
  { "ColorColumn",                 { bg = NONE, }, },
  { "Conceal",                     { bg = NONE, fg = "#555555", }, },
  { "CursorLine",                  { bg = "#3d2946", }, },
  { "ExtraWhitespace",             { bg = "#473745", }, },
  { "Folded",                      { bg = "#1e161f", fg = "#6f6f6f", }, },
  { "LineNr",                      { fg = "#6f6f6f", }, },
  { "MatchParen",                  { bg = "#446677", fg = "#dddddd", bold = true, }, },
  { "Pmenu",                       { bg = "#170725", }, },
  { "StatusLine",                  { bg = NONE, fg = NONE, ctermbg = NONE, ctermfg = NONE, cterm = NONE, }, },

  -- vim diff
  { "DiffAdd",                     { bg = "#313e52", fg = NONE, }, },
  { "DiffChange",                  { bg = "#43365c", fg = NONE, }, },
  { "DiffDelete",                  { bg = "#663b63", fg = NONE, }, },
  { "DiffText",                    { bg = "#554575", fg = NONE, }, },

  -- Diagnostics
  { "DiagnosticVirtualTextError",  { bg = NONE, fg = "#905566", }, }, -- Default: bg = "#362c3d", fg = "#db4b4b",
  { "DiagnosticVirtualTextWarn",   { bg = NONE, fg = "#887755", }, }, -- Default: bg = "#373640", fg = "#e0af68",
  { "DiagnosticVirtualTextInfo",   { bg = NONE, fg = "#557788", }, }, -- Default: bg = "#22374b", fg = "#0db9d7",
  { "DiagnosticVirtualTextHint",   { bg = NONE, fg = "#665577", }, }, -- Default: bg = "#233745", fg = "#1abc9c",

  -- gitsigns.nvim
  { "GitSignsAdd",                 { fg = "#2cc474", }, },
  { "GitSignsChange",              { fg = "#8e73f6", }, },
  { "GitSignsDelete",              { fg = "#ff436c", }, },

  -- local-highlight.nvim
  { "LocalHighlight",              { bg = "#513965", }, }, -- Default: fg = "#dcd7ba",
  { "CWLocalHighlight",            { bg = "#443055", }, },

  -- indent-blankline.nvim
  { "IndentBlanklineChar",         { fg = "#382935", nocombine = true }, }, -- v2
  { "IblScope",                    { fg = "#382935", nocombine = true }, }, -- v3

  -- match-visual.nvim
  { "VisualMatch",                 { bg = "#514d6e", }, },

  -- nvim-cmp
  { "CmpItemAbbr",                 { fg = "#bbbbbb", }, },
  { "CmpItemAbbrMatch",            { fg = "#ccccff", }, },
  { "CmpItemAbbrMatchFuzzy",       { fg = "#aaaaff", }, },
  { "CmpItemKind",                 { fg = "#bbbbee", }, },
  { "CmpItemMenu",                 { fg = "#bbbbee", }, },

  -- nvim-hlslens
  { "HlSearchLens",                { bg = "#362956", fg = "#554466", }, },

  -- nvim-treesitter-context
  { "TreesitterContext",           { bg = "#403659", }, },
  { "TreesitterContextLineNumber", { bg = NONE, fg = "#554466", }, },

  -- virt-column.nvim
  { "VirtColumn",                  { fg = "#402d3e", }, },

}

if vim.fn.has("gui_running") == 1 then
  colors.Normal.bg = "#2e253d"
end

for _, c in ipairs(colors) do
  vim.api.nvim_set_hl(0, c[1], c[2])
end
