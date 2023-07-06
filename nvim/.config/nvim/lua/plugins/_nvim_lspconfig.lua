return {
  "neovim/nvim-lspconfig",

  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "folke/neodev.nvim",
    -- "ray-x/lsp_signature.nvim",
    -- "onsails/lspkind-nvim",
    -- "SmiteshP/nvim-navic",
  },

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
      "lua_ls",
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

    local function require_maybe(name)
      local ok, module = pcall(require, name)
      return ok and module or nil
    end

    local function setup_servers(servers, configs, config_defaults, on_attach)
      for _, lsp in ipairs(servers) do
        local config = configs[lsp] or {}
        config.on_attach = on_attach
        config = vim.tbl_extend("keep", config, config_defaults)
        require("lspconfig")[lsp].setup(config)
      end
    end

    local function setup_nvim_cmp(config_defaults)
      require("plugins._nvim_cmp")._.on_lspconfig_load()

      if not _G.plugin_loaded("cmp-nvim-lsp") then
        return
      end

      config_defaults = vim.tbl_extend("error", config_defaults, {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      return config_defaults
    end

    local function on_attach(client, bufnr)
      -- print(string.format("LSP: on_attach() buffer=%d client=%s.", bufnr, client["name"]))

      -- For built-in LSP omnifunc:
      vim.api.nvim_buf_set_option(bufnr, "completefunc", "v:lua.vim.lsp.omnifunc")
      vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

      if not vim.b._lsp_on_attach_lock then
        vim.b._lsp_on_attach_lock = true

        require("plugins._lspkind_nvim")._.on_attach()
        require("plugins._lsp_signature_nvim")._.on_attach()
        require("mappings._nvim_lsp").on_attach()
      end

      require("plugins._nvim_navic")._.on_attach(client, bufnr)
    end

    local configs = {
      diagnosticls = require("plugins.lspconfig.diagnosticls"),
      efm = require("plugins.lspconfig.efm"),
      matlab = require("plugins.lspconfig.matlab"),
      pyright = require_maybe("plugins.lspconfig.pyright") or {},
    }

    local config_defaults = {}

    require("plugins._neodev_nvim")._.on_lspconfig_load()
    config_defaults = setup_nvim_cmp(config_defaults)
    setup_servers(servers, configs, config_defaults, on_attach)
  end,
}
