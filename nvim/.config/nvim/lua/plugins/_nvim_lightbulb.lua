return {
  config = function()
    require("nvim-lightbulb").setup {
      autocmd = { enabled = true },
      -- float = { enabled = true },
      -- virtual_text = { enabled = true },
      -- status_text = { enabled = true },
    }
  end,
}
