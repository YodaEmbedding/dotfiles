return {
  enabled = false,

  config = function()
    require("nvim-autopairs").setup {
      ignored_next_char = "[%w%.]"
    }
  end,
}
