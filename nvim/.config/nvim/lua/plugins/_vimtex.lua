return {
  "lervag/vimtex",

  init = function()
    vim.g.tex_flavor = "latex"
    -- vim.g.vimtex_compiler_latexmk = { build_dir = "out" }
    -- vim.g.vimtex_quickfix_enabled = 0
    vim.g.vimtex_quickfix_method = (
      (vim.fn.executable("pplatex") == 1 and "pplatex") or
      "latexlog"
    )
    vim.g.vimtex_quickfix_mode = 0
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      spacing = 0,
      greek = 1,
      math_bounds = 1,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 0,
      styles = 1,
    }
    -- Also helps with synctex:
    vim.g.vimtex_view_method = (
      (vim.fn.executable("zathura") == 1 and "zathura") or
      (vim.fn.executable("skim") == 1 and "skim") or
      nil
    )
  end,
}
