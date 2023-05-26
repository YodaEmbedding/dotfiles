return {
  dependencies = {
    "zbirenbaum/copilot.lua",
  },
  -- event = "InsertEnter",

  config = function()
    require("copilot_cmp").setup {}
  end,
}
