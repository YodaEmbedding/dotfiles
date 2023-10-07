return {
  "skwee357/nvim-prose",

  config = function()
    require("nvim-prose").setup {
      filetypes = {
        "asciidoc",
        "markdown",
        "tex",
      },
    }
  end,
}
