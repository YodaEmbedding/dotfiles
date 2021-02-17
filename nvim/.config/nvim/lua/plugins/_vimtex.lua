if not _G.plugin_loaded("vimtex") then
  do return end
end

vim.g.tex_flavor = "latex"
-- vim.g.vimtex_compiler_latexmk = { build_dir = "out" }
vim.g.vimtex_quickfix_method = "pplatex"
