return {
  "dstein64/nvim-scrollview",

  enabled = false,

  init = function()
    vim.g.scrollview_base = "buffer"
    vim.g.scrollview_column = 80
  end,
}
