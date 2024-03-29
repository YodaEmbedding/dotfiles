local configs = require("lspconfig/configs")
local util = require("lspconfig/util")

local binary_path = "/home/mulhaq/.local/bin/matlab-langserver"

local root_files = {
  ".git",
}

local config = {
  cmd = { "sh", binary_path },
  filetypes = { "octave" },
  root_dir = function(filename)
    return (
      util.root_pattern(unpack(root_files))(filename) or
      util.path.dirname(filename)
    )
  end,
}

return config
