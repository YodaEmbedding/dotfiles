if not _G.plugin_loaded("lightspeed.nvim") then
  do return end
end


local lightspeed = require("lightspeed")
local vimp = require("vimp")

local n = vimp.nmap
local x = vimp.vmap
local o = vimp.omap

local function repeat_ft(reverse)
  lightspeed.ft["instant-repeat?"] = true
  lightspeed.ft:to(reverse, lightspeed.ft["prev-t-like?"])
end


-- DEFAULT MAPPINGS

-- n ("s", "<Plug>Lightspeed_s")
-- n ("S", "<Plug>Lightspeed_S")
-- x ("s", "<Plug>Lightspeed_s")
-- x ("S", "<Plug>Lightspeed_S")
-- o ("z", "<Plug>Lightspeed_s")
-- o ("Z", "<Plug>Lightspeed_S")

-- n ("gs", "<Plug>Lightspeed_gs")
-- n ("gS", "<Plug>Lightspeed_gS")

o ("x", "<Plug>Lightspeed_x")
o ("X", "<Plug>Lightspeed_X")

-- n ("f", "<Plug>Lightspeed_f")
-- n ("F", "<Plug>Lightspeed_F")
-- x ("f", "<Plug>Lightspeed_f")
-- x ("F", "<Plug>Lightspeed_F")
-- o ("f", "<Plug>Lightspeed_f")
-- o ("F", "<Plug>Lightspeed_F")

-- n ("t", "<Plug>Lightspeed_t")
-- n ("T", "<Plug>Lightspeed_T")
-- x ("t", "<Plug>Lightspeed_t")
-- x ("T", "<Plug>Lightspeed_T")
-- o ("t", "<Plug>Lightspeed_t")
-- o ("T", "<Plug>Lightspeed_T")

-- n (";", "<Plug>Lightspeed_;_ft")
-- x (";", "<Plug>Lightspeed_;_ft")
-- o (";", "<Plug>Lightspeed_;_ft")

-- n (",", "<Plug>Lightspeed_,_ft")
-- x (",", "<Plug>Lightspeed_,_ft")
-- o (",", "<Plug>Lightspeed_,_ft")


-- CUSTOM OVERRIDES

n ("s", "<Plug>Lightspeed_omni_s")
x ("s", "<Plug>Lightspeed_omni_s")
o ("z", "<Plug>Lightspeed_omni_s")

-- n ({"silent", "override"}, ";", function () repeat_ft(false) end)
-- x ({"silent", "override"}, ";", function () repeat_ft(false) end)
--
-- -- n ({"silent", "override"}, ",", function () repeat_ft(true) end)
-- x ({"silent", "override"}, ",", function () repeat_ft(true) end)
