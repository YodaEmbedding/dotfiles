return {
  config = function()
    -- Enabled servers:
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

    local configs = {
      diagnosticls = require("plugins.lspconfig.diagnosticls"),
      efm = require("plugins.lspconfig.efm"),
      matlab = require("plugins.lspconfig.matlab"),
    }

    local ok, pyright_config = pcall(require, "plugins.lspconfig.pyright")
    if ok then
      configs["pyright"] = pyright_config
    end

    local config_defaults = {}

    local function setup_nvim_cmp(config_defaults)
      require("plugins._nvim_cmp")._.on_lspconfig_load()

      if not _G.plugin_loaded("cmp-nvim-lsp") then
        return
      end

      if not _G.cmp_was_setup_first then
        print("cmp was not setup yet!")
      end

      config_defaults = vim.tbl_extend("error", config_defaults, {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      return config_defaults
    end

    local function setup_servers(servers, on_attach)
      local coq_ok, coq = pcall(require, "coq")
      for _, lsp in ipairs(servers) do
        local config = configs[lsp] or {}
        config.on_attach = on_attach
        if coq_ok then
          config = coq.lsp_ensure_capabilities(config)
        end
        config = vim.tbl_extend("keep", config, config_defaults)
        require("lspconfig")[lsp].setup(config)
      end
    end

    config_default = setup_nvim_cmp(config_defaults)

    require("neodev").setup {
    }

    setup_servers(servers, on_attach)
  end,
}
