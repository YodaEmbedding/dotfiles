if not _G.plugin_loaded("nvim-cmp") then
  do return end
end

local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup {
  formatting = {
    format = lspkind.cmp_format({ with_text = false, maxwidth = 30 }),
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
    { name = "nvim_lsp" },
    { name = "vsnip" },
    -- { name = "luasnip" },
    -- { name = "ultisnips" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "latex_symbols" },
    { name = "buffer" },
    { name = "tmux" },
    { name = "zsh" },
    -- { name = "treesitter" },
    -- { name = "tags" },
    -- { name = "pandoc_references" },
    -- { name = "dictionary", keyword_length = 2 },
    -- { name = "look", keyword_length = 2 },
    -- { name = "nuspell" },
    -- { name = "spell" },
  },
}
