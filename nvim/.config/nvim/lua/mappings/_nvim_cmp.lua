local cmp = require("cmp")

local function copilot_suggestion_accept()
  local ok, copilot_suggestion = pcall(require, "copilot.suggestion")
  if ok and copilot_suggestion.is_visible() then
    copilot_suggestion.accept()
    return true
  else
    return false
  end
end

local complete = cmp.mapping.complete()

local __confirm = cmp.mapping.confirm({
  behavior = cmp.ConfirmBehavior.Replace,
  select = true,
})

local function confirm(fallback)
  -- if copilot_suggestion_accept() then
  --   return
  -- end
  if cmp.visible() then
    cmp.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    })
    -- cmp.complete()
  else
  end
end

-- i = insert, c = command, s = select
return {
  ["<C-n>"] = cmp.mapping.select_next_item(),
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<Tab>"] = cmp.mapping.select_next_item(),
  ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  ["<C-Space>"] = cmp.mapping(copilot_suggestion_accept, { "i", "c" }),
  ["<C-c>"] = cmp.mapping(copilot_suggestion_accept, { "i", "c" }),
  ["<C-e>"] = cmp.mapping(confirm, { "i", "s" }),
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
