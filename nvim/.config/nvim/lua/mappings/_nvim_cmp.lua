local cmp = require("cmp")

local confirm = cmp.mapping.confirm({
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
})

local function __confirm(fallback)
  local ok, copilot_suggestion = pcall(require, "copilot.suggestion")
  if ok and copilot_suggestion.is_visible() then
    copilot_suggestion.accept()
  elseif cmp.visible() then
    cmp.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
    -- cmp.complete()
  else
    fallback()
  end
end

return {
  ["<C-n>"] = cmp.mapping.select_next_item(),
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<Tab>"] = cmp.mapping.select_next_item(),
  ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<C-e>"] = confirm,
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
