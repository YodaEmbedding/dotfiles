return {
  "b3nj5m1n/kommentary",

  config = function()
    require("kommentary.config").configure_language("default", {
      ignore_whitespace = false,
      prefer_single_line_comments = true,
      use_consistent_indentation = true,
    })
  end,
}
