local function ensure_lazy_nvim_installed()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    -- Download and install lazy.nvim if missing...
    vim.fn.system {
      "git", "clone", "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
    }
    vim.fn.system { "git", "-C", lazypath, "checkout", "tags/stable" }
  end
  vim.opt.rtp:prepend(lazypath)
end


local function load_plugin_specs()
  local specs = {}
  local loaded = {}
  local plugins_dir = vim.fs.dirname(debug.getinfo(2, "S").source:sub(2))
  local files = vim.split(vim.fn.glob(plugins_dir .. "/*", true), "\n")

  for _, file in ipairs(files) do
    local basename = vim.fs.basename(file):match("(_.*).lua$")

    if basename and basename ~= "init" then
      ---@type LazyPluginSpec
      local spec = {}
      for k, v in pairs(require("plugins." .. basename)) do
        if k ~= "_" then -- Skip private fields.
          spec[k] = v
        end
      end

      table.insert(specs, spec)
      local short_url = spec[1]
      local name = short_url and short_url:match("^[^/]*/([^/]*)$")
      assert(name, "Could not determine name for " .. file)
      loaded[name] = spec.enabled ~= false
    end
  end

  function _G.plugin_loaded(name)
    return loaded[name] or false
  end

  return specs
end


ensure_lazy_nvim_installed()

require("lazy").setup {
  spec = load_plugin_specs(),
  opts = {
    defaults = {
      -- version = "*",
    },
  },
}
