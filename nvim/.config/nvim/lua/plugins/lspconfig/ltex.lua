local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
  table.insert(words, word)
end

return {
  settings = {
    ltex = {
      enabled = {
        "bib",
        "gitcommit",
        "markdown",
        "org",
        "plaintex",
        "rst",
        "rnoweb",
        "tex",
        "pandoc",
        "quarto",
        "rmd",
        "context",
        -- "html",
        -- "xhtml",
        "mail",
        "text",
      },
      dictionary = {
        ["en-US"] = words,
        ["en-GB"] = words,
      },
    },
  },

  on_attach = function(client, bufnr)
    require("plugins._nvim_lspconfig")._.on_attach(client, bufnr)
    if _G.plugin_loaded("ltex-utils.nvim") then
      require("ltex-utils").on_attach(bufnr)
    end
  end,
}
