return {
  init = function()
    vim.g.tex_flavor = "latex"
    -- vim.g.vimtex_compiler_latexmk = { build_dir = "out" }
    vim.g.vimtex_quickfix_method = "pplatex"
  end,
}
