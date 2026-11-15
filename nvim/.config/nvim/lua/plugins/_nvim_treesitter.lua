return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  lazy = false,

  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },

  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})
    local parsers = {
      "asm",
      "bash",
      "bibtex",
      "c",
      "c_sharp",
      "cmake",
      "comment",
      "cpp",
      "css",
      "csv",
      "cuda",
      "d",
      "diff",
      "disassembly",
      "dockerfile",
      "doxygen",
      "editorconfig",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "glsl",
      "go",
      "gpg",
      "graphql",
      "gstlaunch",
      "haskell",
      "hjson",
      "hlsl",
      "html",
      "htmldjango",
      "http",
      "ini",
      "java",
      "javascript",
      "jq",
      "jsdoc",
      "json",
      "json5",
      -- "jsonc", -- JSONC filetypes use the json parser on main.
      "jsonnet",
      "julia",
      "kotlin",
      "latex",
      "llvm",
      "lua",
      "luadoc",
      "luap",
      "make",
      "markdown",
      "markdown_inline",
      "matlab",
      "mermaid",
      "mlir",
      "nix",
      "objdump",
      "perl",
      "php",
      "php_only",
      "printf",
      "proto",
      "python",
      "query",
      "regex",
      "requirements",
      "rst",
      "ruby",
      "rust",
      "scss",
      "sql",
      "ssh_config",
      "strace",
      "svelte",
      -- "tmux", -- Not in the reviewed main parser catalog.
      "toml",
      "tsv",
      "tsx",
      "typescript",
      "udev",
      "vim",
      "vimdoc",
      "vue",
      "xml",
      "yaml",
      -- "zathurarc", -- Not in the reviewed main parser catalog.
    }

    local function attach(buf)
      if not vim.api.nvim_buf_is_loaded(buf) then
        return
      end
      local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
      if not lang or not vim.treesitter.get_parser(buf, lang) then
        return
      end

      if lang ~= "latex" and vim.treesitter.query.get(lang, "highlights") then
        vim.treesitter.start(buf, lang)
      end
      if vim.treesitter.query.get(lang, "indents") then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("DotfilesTreesitter", { clear = true }),
      callback = function(event)
        -- Run after filetype indent scripts have set their defaults.
        vim.schedule(function()
          attach(event.buf)
        end)
      end,
    })
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      vim.schedule(function()
        attach(buf)
      end)
    end

    ts.install(parsers)

    vim.keymap.set("n", "gnn", function()
      vim.treesitter.select("parent", vim.v.count1)
    end)
    vim.keymap.set("x", "grn", function()
      vim.treesitter.select("parent", vim.v.count1)
    end)
    vim.keymap.set("x", "grm", function()
      vim.treesitter.select("child", vim.v.count1)
    end)
  end,
}
