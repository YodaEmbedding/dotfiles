return {
  "tyrannicaltoucan/vim-quantum",

  enabled = false,

  init = function()
    vim.g.quantum_black = 1
  end,

  config = function()
    vim.cmd [[ colorscheme quantum ]]
  end,
}
