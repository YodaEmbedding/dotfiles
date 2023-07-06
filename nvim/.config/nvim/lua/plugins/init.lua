local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- Download and install lazy.nvim if missing...
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
  vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" })
end
vim.opt.rtp:prepend(lazypath)


-- Initialize plugin_names with loaded plugins.
-- Set each plugin's lazy.nvim config function to import plugins.<plugin_name>.
local function build_plugin_specs()
  local plugins = {}
  local plugin_specs = {}

  local function build_plugin_spec(module_spec, plugin_name)
    local plugin_spec = {}
    for k, v in pairs(module_spec) do
      if k ~= "_" then
        plugin_spec[k] = v
      end
    end
    table.insert(plugin_specs, plugin_spec)
    plugins[plugin_name] = plugin_spec
  end

  local use_enabled_list = false

  if use_enabled_list then
    -- Load plugins listed in plugins/enabled.lua.
    for _, plugin_name in ipairs(require("plugins.enabled")) do
      local plugin_name_slug = string.gsub(plugin_name, "[-\\.]", "_")
      local config_path = "plugins._" .. plugin_name_slug
      local ok, module_spec = pcall(require, config_path)
      if ok then
        build_plugin_spec(module_spec, plugin_name)
      end
    end
  else
    -- Load all plugins in plugins/ directory automatically.
    local curr_script_dir = vim.fs.dirname(debug.getinfo(2, "S").source:sub(2))
    local files = vim.split(vim.fn.glob(curr_script_dir .. "/*", true), "\n")
    for _, file in ipairs(files) do
      local basename = string.match(vim.fs.basename(file), "(_.*).lua$")
      if basename ~= nil and basename ~= "init" and basename ~= "enabled" then
        local config_path = "plugins." .. basename
        local ok, module_spec = pcall(require, config_path)
        local short_url = module_spec[1]
        local plugin_name = string.match(short_url, "^[^/]*/([^/]*)$")
        if ok then
          build_plugin_spec(module_spec, plugin_name)
        end
      end
    end
  end

  return plugins, plugin_specs
end


local plugins, plugin_specs = build_plugin_specs()

function _G.plugin_loaded(plugin_name)
  return plugins[plugin_name] ~= nil and plugins[plugin_name].enabled ~= false
end

local opts = {
  defaults = {
    -- version = "*",
  },
}

require("lazy").setup(plugin_specs, opts)
