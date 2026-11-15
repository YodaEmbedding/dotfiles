return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  dependencies = {
    "williamboman/mason.nvim",
  },

  opts = {
    ensure_installed = { "tree-sitter-cli" },
    run_on_start = false,
  },

  config = function(_, opts)
    require("mason-tool-installer").setup(opts)

    if vim.fn.executable("tree-sitter") == 0 then
      vim.cmd.MasonToolsInstallSync()
    end
  end,
}
