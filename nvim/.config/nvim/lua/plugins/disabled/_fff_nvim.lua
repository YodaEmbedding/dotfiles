return {
  "dmtrKovalenko/fff.nvim",

  enabled = false,

  build = "cargo build --release",

  opts = {

  },

  keys = {
    {
      "<leader>ff",
      function()
        require("fff").toggle()
      end,
      desc = "FFF",
    },
  },
}
