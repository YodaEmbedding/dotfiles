return {
  "b3nj5m1n/kommentary",

  enabled = false,

  keys = {
    { "gcc", nil, "n" },
    { "gc",  nil, "n" },
    { "gc",  nil, "v" },

    -- For reference, the default mappings are:
    -- { "gcc", "<Plug>kommentary_line_default",        "n" },
    -- { "gc",  "<Plug>kommentary_motion_default",      "n" },
    -- { "gc",  "<Plug>kommentary_visual_default<C-c>", "v" },
  },

  config = function()
    require("kommentary.config").configure_language("default", {
      ignore_whitespace = false,
      prefer_single_line_comments = true,
      use_consistent_indentation = true,
    })
  end,
}
