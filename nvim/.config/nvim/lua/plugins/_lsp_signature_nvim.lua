if not _G.plugin_loaded("lsp_signature.nvim") then
  do return end
end

require("lsp_signature").on_attach {
  --fix_pos = true,
  max_width = 80,
}
