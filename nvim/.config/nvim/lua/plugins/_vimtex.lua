return {
  "lervag/vimtex",

  init = function()
    vim.g.tex_flavor = "latex"
    -- vim.g.vimtex_compiler_latexmk = { build_dir = "out" }
    -- vim.g.vimtex_quickfix_enabled = 0
    vim.g.vimtex_quickfix_method = "pplatex"
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_view_method = "zathura"  -- also helps with synctex
  end,
}
