return {
  "petertriho/nvim-scrollbar",
  branch = "refactor/v2",

  opts = {
    providers = {
      gitsigns = true,
    },

    marks = {
      Mark = { highlight = "DiagnosticVirtualTextInfo" },
      Info = false,
      Hint = false,
      Misc = false,
    },

    scrollbar = {
      thumb = {
        highlight = { bg = "#6C5571" },
      },
    },
  },
}
