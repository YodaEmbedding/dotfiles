if not _G.plugin_loaded("indent-blankline.nvim") then
  do return end
end

vim.cmd [[let g:indentLine_char = '│']]
vim.cmd [[let g:indent_blankline_show_first_indent_level = v:false]]
-- vim.cmd [[let g:indent_blankline_use_treesitter = v:true]]
