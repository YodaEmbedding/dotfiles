return {
  "folke/flash.nvim",

  event = "VeryLazy",

  ---@type Flash.Config
  opts = {
    modes = {
      search = {
        enabled = false,
      },
      char = {
        enabled = false,
        -- keys = { "f", "F", "t", "T", ";", "," },  [default]
        keys = { "f", "F", "t", "T", ";", "" },
      },
    },
  },

  keys = {
    {
      "s",
      mode = { "n", "x", "o" },
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      "S",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
    {
      "r",
      mode = "o",
      function()
        require("flash").remote()
      end,
      desc = "Remote Flash",
    },
    {
      "R",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Flash Treesitter Search",
    },
    {
      "<c-s>",
      mode = { "c" },
      function()
        require("flash").toggle()
      end,
      desc = "Toggle Flash Search",
    },
  },
}
