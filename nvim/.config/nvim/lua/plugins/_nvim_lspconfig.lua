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
      "cmake",
      "cssls",
      "diagnosticls",
      "efm",
      "html",
      "jsonls",
      "ltex",
      "lua_ls",
      "pyright",
      "ruff_lsp",
      "rust_analyzer",
      "texlab",
      "tsserver",
      "vimls",
      "yamlls",

      -- "clojure_lsp",
      -- "hls",
      -- "jdtls",
      -- "kotlin_language_server",
      -- "metals",
      -- "pylyzer",
      -- "rnix",
    }

    local function setup_servers(servers, configs, config_defaults, on_attach)
      for _, lsp in ipairs(servers) do
        local config = configs[lsp] or {}
        config.on_attach = on_attach
        config = vim.tbl_extend("keep", config, config_defaults)
        require("lspconfig")[lsp].setup(config)
      end
    end

    local function on_attach(client, bufnr)
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

    -- Load all server configs in plugins/lspconfig/ directory automatically.
    local function load_configs()
      local configs = {}
      local curr_script_dir = vim.fs.dirname(debug.getinfo(2, "S").source:sub(2))
      local files = vim.split(vim.fn.glob(curr_script_dir .. "/lspconfig/*", true), "\n")
      for _, file in ipairs(files) do
        local basename = string.match(vim.fs.basename(file), "(.*).lua$")
        if basename ~= nil and basename ~= "init" then
          local config_path = "plugins.lspconfig." .. basename
          local ok, module_config = pcall(require, config_path)
          if ok then
            configs[basename] = module_config
          end
        end
      end
      return configs
    end

    -- server-specific configs
    local configs = load_configs()

    -- config that is common across servers
    local config_defaults = {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
    }

    require("plugins._neodev_nvim")._.on_lspconfig_load()
    require("plugins._nvim_cmp")._.on_lspconfig_load()

    setup_servers(servers, configs, config_defaults, on_attach)
  end,
}
