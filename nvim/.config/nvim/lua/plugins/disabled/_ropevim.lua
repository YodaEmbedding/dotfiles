return {
  "python-rope/ropevim",

  enabled = false,

  ft = "python",

  init = function()
    vim.g.ropevim_guess_project = 1
  end,
}
