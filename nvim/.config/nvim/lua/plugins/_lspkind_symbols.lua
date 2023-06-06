local _M = {}

_M.kind_symbol_map = {
  Class         = "∴",
  Color         = "⛭",
  Constant      = "π",
  Constructor   = "⬡",
  Copilot       = "",
  Enum          = "e",
  EnumMember    = ".",
  Event         = "",
  Field         = ".",
  File          = "🗈",
  Folder        = "🗀",
  Function      = "λ",
  Interface     = "I",
  Keyword       = "🗝",
  Method        = "λ",
  Module        = "⬡",
  Operator      = "+",
  Property      = "p",
  Reference     = "⮻",
  Snippet       = "<>",
  Struct        = "{}",
  Text          = "𐄗",
  TypeParameter = "T",
  Unit          = "()",
  Value         = "#",
  Variable      = "×",
  -- Class         = "🅒",
  -- Color         = "🖌",
  -- Constant      = "c",
  -- Constructor   = "()",
  -- Field         = "→",
  -- Field         = "⚐",
  -- File          = "🗎",
  -- Function      = "ƒ",
  -- Function      = "⇒",
  -- Keyword       = "⌘",
  -- Method        = "❖",
  -- Module        = "M",
  -- Module        = "📦",
  -- Reference     = "↶",
  -- Snippet       = "✂",
  -- Text          = "t",
  -- Unit          = "u",
  -- Value         = "$",
  -- Variable      = "χ",
}

_M.kind_text_map = {
  Class         = "Cls",
  Color         = "RGB",
  Constant      = "Con",
  Constructor   = "Init",
  Copilot       = "GH",
  Enum          = "Enum",
  EnumMember    = "EnumMem",
  Event         = "Event",
  Field         = "Field",
  File          = "File",
  Folder        = "Dir",
  Function      = "Fn",
  Interface     = "IF",
  Keyword       = "Kw",
  Method        = "Mth",
  Module        = "Mod",
  Operator      = "Op",
  Property      = "Prop",
  Reference     = "Ref",
  Snippet       = "Sni",
  Struct        = "Strct",
  Text          = "Txt",
  TypeParameter = "TypePar",
  Unit          = "Unit",
  Value         = "Val",
  Variable      = "Var",
}

_M.source_map = {
  buffer        = "Buf",
  nvim_lsp      = "LSP",
  luasnip       = "Snip",
  nvim_lua      = "Lua",
  latex_symbols = "TeX",
}

local kind_map = {}
for kind, symbol in pairs(_M.kind_symbol_map) do
  local text = _M.kind_text_map[kind]
  local sep = string.rep(" ", 3 - vim.fn.strchars(symbol))
  kind_map[kind] = symbol .. sep .. text
end

_M.kind_map = kind_map

return {
  _ = _M,
}
