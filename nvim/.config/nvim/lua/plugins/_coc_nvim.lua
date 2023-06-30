return {
  init = function()
    vim.g.coc_global_extensions = {
      "coc-css",
      "coc-git",
      "coc-highlight",
      "coc-html",
      "coc-java",
      "coc-json",
      "coc-lists",
      "coc-lua",
      "coc-pyright",
      "coc-rls",
      "coc-texlab",
      "coc-tsserver",
      "coc-vimlsp",
      -- "coc-vimtex",
      "coc-yaml",
    }
  end,

  config = function()
    require("mappings._coc_nvim")
  end,
}
