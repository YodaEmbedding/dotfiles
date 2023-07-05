return {
  "xiyaowong/nvim-transparent",

  enabled = false,

  config = function()
    require("transparent").setup {
      enable = true,
      extra_groups = {},
      exclude = {},
    }
  end,
}
