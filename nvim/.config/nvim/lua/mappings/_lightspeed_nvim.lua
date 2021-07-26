if not _G.plugin_loaded("lightspeed.nvim") then
  do return end
end


local lightspeed = require("lightspeed")
local vimp = require("vimp")

local nnoremap = vimp.nnoremap
local xnoremap = vimp.xnoremap

local function repeat_ft(reverse)
  lightspeed.ft["instant-repeat?"] = true
  lightspeed.ft:to(reverse, lightspeed.ft["prev-t-like?"])
end

nnoremap({"silent"}, ";", function () repeat_ft(false) end)
xnoremap({"silent"}, ";", function () repeat_ft(false) end)
-- nnoremap({"silent"}, ",", function () repeat_ft(true) end)
xnoremap({"silent"}, ",", function () repeat_ft(true) end)

nnoremap({"silent", "override"}, "f", "f")
nnoremap({"silent", "override"}, "F", "F")
nnoremap({"silent", "override"}, "t", "t")
nnoremap({"silent", "override"}, "T", "T")

nnoremap({"silent", "override"}, ";", ";")
xnoremap({"silent", "override"}, ";", ";")
-- nnoremap({"silent", "override"}, ",", ",")
xnoremap({"silent", "override"}, ",", ",")
