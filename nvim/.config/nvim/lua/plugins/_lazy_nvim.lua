local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
  vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" })
end

vim.opt.rtp:prepend(lazypath)

local plugins = require("plugins.enabled")

local opts = {
  defaults = {
    -- version = "*",
  },
}

local plugin_names = {}

-- Initialize plugin_names with loaded plugins.
-- Set each plugin's lazy.nvim config function to import plugins.<plugin_name>.
local function config_plugins(plugins, plugin_names)
  for i, plugin_spec in ipairs(plugins) do
    local short_url = plugin_spec[1]
    local plugin_name = string.match(short_url, "^[^/]*/(.*)$")
    local plugin_name_slug = string.gsub(plugin_name, "[-\\.]", "_")
    local config_path = "plugins._" .. plugin_name_slug

    -- Indicate that plugin will be loaded.
    table.insert(plugin_names, plugin_name)

    -- Set plugin's options for lazy.nvim.
    local ok, module_spec = pcall(require, config_path)
    if ok then
      for k, v in pairs(module_spec) do
        if k ~= "_" then
          plugin_spec[k] = v
        end
      end
    end
  end
end

function _G.plugin_loaded(plugin_name)
  return vim.tbl_contains(plugin_names, plugin_name)
end

config_plugins(plugins, plugin_names)

require("lazy").setup(plugins, opts)
