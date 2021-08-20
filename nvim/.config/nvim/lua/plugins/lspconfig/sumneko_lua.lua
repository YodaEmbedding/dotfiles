local nvim_lsp = require("lspconfig")

local root_path = "/usr/lib/lua-language-server"
local binary_path = "/usr/bin/lua-language-server"

local config = {
  cmd = {binary_path, "-E", root_path .. "/main.lua"},
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        globals = {"vim"},
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
        },
      },
    },
  },
}

local function setup(args)
  config.on_attach = args.on_attach
  nvim_lsp.sumneko_lua.setup(config)
end

return setup
