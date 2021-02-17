if not _G.plugin_loaded("kommentary") then
  do return end
end

require("kommentary.config").configure_language("default", {
  ignore_whitespace = false,
  prefer_single_line_comments = true,
})
