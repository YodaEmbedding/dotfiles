local _M = {}

function _M.on_attach()
  if not _G.plugin_loaded("lsp_signature.nvim") then
    do return end
  end

  require("lsp_signature").on_attach {
    --fix_pos = true,
    max_width = 80,
  }
end

return _M
