local cmp = require("cmp")

return {
  ["<Tab>"] = cmp.mapping.select_next_item(),
  ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<C-e>"] = cmp.mapping.confirm({
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  }),
  ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
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
