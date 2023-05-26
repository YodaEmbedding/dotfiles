return {
  config = function()
    require("copilot").setup {
      -- auto_trigger = false,
      suggestion = { enabled = false },
      panel = { enabled = false },
    }
  end,
}
