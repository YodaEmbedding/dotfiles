local _M = {}

_M.kind_symbol_map = {
  Class         = "∴", -- ∴  🅒
  Color         = "⛭", -- 🖌
  Constant      = "π", -- 
  Constructor   = "⬡", -- 
  Copilot       = "",
  Enum          = "e",  -- 
  EnumMember    = ".",  -- 
  Event         = "", -- 
  Field         = ".",  --  ⚐ →
  File          = "🗎", --  🗈 🗎
  Folder        = "📁", -- 🗀
  Function      = "λ", --  ƒ 𝑓 ⇒
  Interface     = "I",  -- 
  Keyword       = "🗝", -- ⌘
  Method        = "λ", --  ❖
  Module        = "⬡", --  📦
  Operator      = "+",  -- 
  Property      = ".",  -- 
  Reference     = "⮻", -- ↶
  Snippet       = "✂", -- ✂
  Struct        = "{}", -- 
  Text          = "𐄗", -- t
  TypeParameter = "", -- 
  Unit          = "()", -- u
  Value         = "#",  -- $
  Variable      = "α", --  × χ

  -- New; added for barbecue.nvim
  Array         = "",
  Boolean       = "",
  Key           = "",
  Namespace     = "",
  Null          = "",
  Number        = "",
  Object        = "",
  Package       = "",
  String        = "",

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

  -- New; added for barbecue.nvim
  Array         = "Arr",
  Boolean       = "Boo",
  Key           = "Key",
  Namespace     = "Ns",
  Null          = "Nul",
  Number        = "Num",
  Object        = "Obj",
  Package       = "Pkg",
  String        = "Str",

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
  -- local text = _M.kind_text_map[kind]
  -- local sep = string.rep(" ", 3 - vim.fn.strchars(symbol))
  -- kind_map[kind] = symbol .. sep .. text

  kind_map[kind] = symbol
end

_M.kind_map = kind_map

return {
  _ = _M,
}
