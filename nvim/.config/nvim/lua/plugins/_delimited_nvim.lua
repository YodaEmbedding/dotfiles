return {
  "mizlan/delimited.nvim",

  opts = {
  },

  keys = {
    {
      "[d",
      function() require("delimited").goto_prev {} end,
      desc = "Go to previous diagnostic",
    },
    {
      "]d",
      function() require("delimited").goto_next {} end,
      desc = "Go to next diagnostic",
    },
    {
      "[D",
      function() require("delimited").goto_prev { severity = vim.diagnostic.severity.ERROR } end,
      desc = "Go to previous diagnostic",
    },
    {
      "]D",
      function() require("delimited").goto_next { severity = vim.diagnostic.severity.ERROR } end,
      desc = "Go to next diagnostic",
    },
  },
}
