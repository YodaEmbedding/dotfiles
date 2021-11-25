if not _G.plugin_loaded("nvim-cmp") then
  do return end
end

local cmp = require("cmp")
local lspkind_symbols = require("plugins._lspkind_symbols")

cmp.setup {
  experimental = {
    native_menu = false,
    ghost_text = true,
  },
  formatting = {
    format = function(entry, vim_item)
      local max_len = 20
      if string.len(vim_item.abbr) > max_len then
        vim_item.abbr = string.sub(vim_item.abbr, 1, max_len - 2) .. "··"
      end
      vim_item.kind = lspkind_symbols.kind_map[vim_item.kind]
      vim_item.menu = lspkind_symbols.source_map[entry.source.name]
      return vim_item
    end,
  },
  mapping = require("mappings._nvim_cmp"),
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
      -- require("luasnip").lsp_expand(args.body)
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp", max_item_count = 30 },
    { name = "path" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "vsnip" },
    { name = "latex_symbols" },
    { name = "tmux" },
    -- { name = "treesitter" },
    -- { name = "cmp_tabnine" },
    -- { name = "tags" },
    -- { name = "luasnip" },
    -- { name = "ultisnips" },
    -- { name = "zsh" },
    -- { name = "pandoc_references" },
    -- { name = "dictionary", keyword_length = 2 },
    -- { name = "look", keyword_length = 2 },
    -- { name = "nuspell" },
    -- { name = "spell" },
  },
}
