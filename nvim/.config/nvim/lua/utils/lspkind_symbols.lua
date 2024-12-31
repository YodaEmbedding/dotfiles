local kind_symbol_map = {
  Class         = "∴", -- ∴  🅒
  Color         = "⛭", -- 🖌
  Constant      = "π", -- 
  Constructor   = "⬡", -- 
  Copilot       = "",
  Enum          = "e", -- 
  EnumMember    = ".", -- 
  Event         = "", -- 
  Field         = ".", --  ⚐ →
  File          = "🗎", --  🗈 🗎
  Folder        = "🗀", -- 🗀 📁
  Function      = "λ", --  ƒ 𝑓 ⇒
  Interface     = "I", --  I
  Keyword       = "⌘", -- ⌘ 🗝
  Method        = "λ", --  ❖
  Module        = "⬡", --  📦
  Operator      = "+", -- 
  Property      = ".", -- 
  Reference     = "⮻", -- ↶
  Snippet       = "✂", -- ✂
  Struct        = "", --  {}
  Text          = "𐄗", -- t  𐄗
  TypeParameter = "t", -- 
  Unit          = "µ", -- u
  Value         = "#", -- $
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

local source_map = {
  buffer        = "Buf",
  nvim_lsp      = "LSP",
  luasnip       = "Snip",
  nvim_lua      = "Lua",
  latex_symbols = "TeX",
}

local function build_kind_map()
  local kind_map = {}
  for kind, symbol in pairs(kind_symbol_map) do
    local sep = string.rep(" ", 2 - vim.fn.strchars(symbol))
    kind_map[kind] = symbol .. sep
  end
  return kind_map
end

local kind_map = build_kind_map()

return {
  _ = {
    kind_map = kind_map,
    kind_symbol_map = kind_symbol_map,
    source_map = source_map,
  },
}
