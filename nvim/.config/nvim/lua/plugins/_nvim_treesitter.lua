return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})
    ts.install({ "rust", "javascript", "zig" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "rust", "javascript", "zig" },
      callback = function(event)
        vim.treesitter.start(event.buf)
        vim.bo[event.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
