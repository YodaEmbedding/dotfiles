return {
  config = function()
    local nvim_lsp = require("lspconfig")

    local function on_attach(client, bufnr)
      -- print(string.format("LSP: on_attach() buffer=%d client=%s.", bufnr, client["name"]))

      if _G.plugin_loaded("completion-nvim") then
        -- For completion-nvim:
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "")
        require("completion").on_attach(client)
      else
        -- For built-in LSP omnifunc:
        vim.api.nvim_buf_set_option(bufnr, "completefunc", "v:lua.vim.lsp.omnifunc")
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
      end

      if not vim.b._lsp_on_attach_lock then
        vim.b._lsp_on_attach_lock = true

        require("plugins._lspkind_nvim")._.on_attach()
        require("plugins._lsp_signature_nvim")._.on_attach()
        require("mappings._nvim_lsp").on_attach()
      end
    end

    local servers = {
      "bashls",
      "ccls",
      "clojure_lsp",
      "cmake",
      "cssls",
      "diagnosticls",
      "efm",
      "hls",
      "html",
      "jdtls",
      "jsonls",
      "kotlin_language_server",
      -- "lua_ls",
      -- "matlab",
      "metals",
      "pyright",
      "rnix",
      "rust_analyzer",
      "texlab",
      "tsserver",
      "vimls",
      "yamlls",
    }

    local configs = {
      diagnosticls = require("plugins.lspconfig.diagnosticls"),
      efm = {
        init_options = {
          codeAction = true,
          documentFormatting = true,
        },
        filetypes = { "python" },
        -- filetypes = { "lua", "python" },
        single_file_support = false,
        settings = {
          -- rootMarkers = {".git/"},
          languages = {
            lua = {
              -- { formatCommand = "lua-format -i", formatStdin = true },
            },
            python = {
              { formatCommand = "isort --quiet -", formatStdin = true },
              { formatCommand = "black --quiet -", formatStdin = true },
              -- {
              --   lintCommand = "mypy --show-column-numbers",
              --   lintFormats = {
              --     '%f:%l:%c: %trror: %m',
              --     '%f:%l:%c: %tarning: %m',
              --     '%f:%l:%c: %tote: %m',
              --   },
              --   -- formatStdin = true,
              -- },
            },
          },
        },
      },
    }

    require("plugins.lspconfig.matlab")

    local ok, pyright_config = pcall(require, "plugins.lspconfig.pyright")
    if ok then
      configs["pyright"] = pyright_config
    end

    local config_defaults = {}

    local coq = nil
    if _G.plugin_loaded("coq") then
      coq = require("coq")
    end

    require("plugins._nvim_cmp")._.on_lspconfig_load()

    local cmp_nvim_lsp = nil
    if _G.plugin_loaded("cmp-nvim-lsp") then
      if not _G.cmp_was_setup_first then
        print("cmp was not setup yet!")
      end
      cmp_nvim_lsp = require("cmp_nvim_lsp")
      config_defaults = vim.tbl_extend("error", config_defaults, {
        capabilities = cmp_nvim_lsp.default_capabilities(),
      })
    end

    require("neodev").setup {
    }

    for _, lsp in ipairs(servers) do
      local config = configs[lsp] or {}
      config.on_attach = on_attach
      if coq ~= nil then
        config = coq.lsp_ensure_capabilities(config)
      end
      config = vim.tbl_extend("keep", config, config_defaults)
      nvim_lsp[lsp].setup(config)
    end
  end,
}
