local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
  vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" })
end

vim.opt.rtp:prepend(lazypath)

local short_urls = require("plugins.enabled")

local opts = {
  defaults = {
    -- version = "*",
  },
}

local plugin_names = {}

-- Initialize plugin_names with loaded plugins.
-- Set each plugin's lazy.nvim config function to import plugins.<plugin_name>.
local function build_plugin_specs(short_urls, plugin_names)
  local plugin_specs = {}

  for i, short_url in ipairs(short_urls) do
    local plugin_name = string.match(short_url, "^[^/]*/(.*)$")
    local plugin_name_slug = string.gsub(plugin_name, "[-\\.]", "_")
    local config_path = "plugins._" .. plugin_name_slug

    -- Indicate that plugin will be loaded.
    table.insert(plugin_names, plugin_name)

    -- Build plugin spec.
    local plugin_spec = {} -- {short_url}
    plugin_specs[i] = plugin_spec

    local ok, module_spec = pcall(require, config_path)
    if ok then
      for k, v in pairs(module_spec) do
        if k ~= "_" then
          plugin_spec[k] = v
        end
      end
    end
  end

  return plugin_specs
end

function _G.plugin_loaded(plugin_name)
  return vim.tbl_contains(plugin_names, plugin_name)
end

local plugin_specs = build_plugin_specs(short_urls, plugin_names)

require("lazy").setup(plugin_specs, opts)
