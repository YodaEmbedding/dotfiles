return {
  config = function()
    require("transparent").setup {
      enable = true,
      extra_groups = {},
      exclude = {},
    }
  end,
}
