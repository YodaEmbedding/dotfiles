if not _G.plugin_loaded("leap.nvim") then
  do return end
end


local leap = require("leap")
local vimp = require("vimp")

local n = vimp.nmap
local x = vimp.vmap
local o = vimp.omap


---@format disable

-- DEFAULT MAPPINGS

n ("s",  "<Plug>(leap-forward)")
n ("S",  "<Plug>(leap-backward)")
x ("s",  "<Plug>(leap-forward)")
x ("S",  "<Plug>(leap-backward)")
o ("z",  "<Plug>(leap-forward)")
o ("Z",  "<Plug>(leap-backward)")
o ("x",  "<Plug>(leap-forward-x)")
o ("X",  "<Plug>(leap-backward-x)")
n ("gs", "<Plug>(leap-cross-window)")
x ("gs", "<Plug>(leap-cross-window)")
o ("gs", "<Plug>(leap-cross-window)")

-- n ("s", "<Plug>leap_s")
-- n ("S", "<Plug>leap_S")
-- x ("s", "<Plug>leap_s")
-- x ("S", "<Plug>leap_S")
-- o ("z", "<Plug>leap_s")
-- o ("Z", "<Plug>leap_S")

-- [[:n "s"  "<Plug>(leap-forward)"]
--  [:n "S"  "<Plug>(leap-backward)"]
--  [:x "s"  "<Plug>(leap-forward)"]
--  [:x "S"  "<Plug>(leap-backward)"]
--  [:o "z"  "<Plug>(leap-forward)"]
--  [:o "Z"  "<Plug>(leap-backward)"]
--  [:o "x"  "<Plug>(leap-forward-x)"]
--  [:o "X"  "<Plug>(leap-backward-x)"]
--  [:n "gs" "<Plug>(leap-cross-window)"]
--  [:x "gs" "<Plug>(leap-cross-window)"]
--  [:o "gs" "<Plug>(leap-cross-window)"]])]
