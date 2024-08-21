return {
  "jhofscheier/ltex-utils.nvim",

  dependencies = {
    "neovim/nvim-lspconfig",
    "nvim-telescope/telescope.nvim",
    -- "nvim-telescope/telescope-fzf-native.nvim", -- optional
  },

  ft = {
    "bib",
    "markdown",
    "plaintex",
    "rst",
    "tex",
  },

  opts = {
    dictionary = {
      -- path = vim.api.nvim_call_function("stdpath", { "state" }) .. "/ltex/",
      -- path = vim.api.nvim_call_function("stdpath", { "config" }) .. "/spell/",
      path = vim.fn.stdpath("config") .. "/spell/",

      filename = function(lang)
        -- For example:
        -- lang = "en-US"
        -- lang_prefix = "en"
        -- encoding = "utf-8"
        -- filename = "en.utf-8.add"

        local lang_prefix = string.match(lang, "^(%a+)-")
        local encoding = "utf-8"
        -- NOTE: This encoding is evaluated after entering (good) and after leaving (bad) the buffer.
        -- local encoding = vim.api.nvim_buf_get_option(0, "fileencoding")
        local filename = lang_prefix .. "." .. encoding .. ".add"

        -- print(lang, encoding, filename)

        return filename
      end,
    },
  },

  _ = {
    on_attach = function(client, bufnr)
      require("ltex-utils").on_attach(bufnr)
    end,
  },
}
