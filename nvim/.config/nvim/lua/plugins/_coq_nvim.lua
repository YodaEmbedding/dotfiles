if not _G.plugin_loaded("coq_nvim") then
  do return end
end

vim.g.coq_settings = {
  -- auto_start = true,
  ["display.preview.x_max_len"] = 40,
  ["keymap.recommended"] = false,
  ["weights.recency"] = 0.5,
}

vim.schedule(function()
  vim.cmd [[COQnow -s]]
end)
