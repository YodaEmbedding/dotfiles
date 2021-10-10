local cmp = require("cmp")

return {
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.close(),
  ["<C-h>"] = cmp.mapping.confirm({ select = true }),
  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<PageUp>"] = function(fallback)
    for i = 1, 8 do
      cmp.mapping.select_prev_item()(nil)
    end
  end,
  ["<PageDown>"] = function(fallback)
    for i = 1, 8 do
      cmp.mapping.select_next_item()(nil)
    end
  end,
}
