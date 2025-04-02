-- Load "${XDG_CONFIG_HOME}/nvim/local_settings.json" to _G.local_settings:
require("utils").load_local_settings()

require("config.options")
require("plugins")
require("mappings")
require("config.commands")
