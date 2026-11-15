vim.cmd [[let g:python3_host_prog = '~/.local/state/uv/virtualenvs/default/bin/python3']]

-- Load "${XDG_CONFIG_HOME}/nvim/local_settings.json" to _G.local_settings:
require("utils").load_local_settings()

require("config.options")
require("plugins")
require("mappings")
require("config.colors")
require("config.autocmds")
require("config.commands")
