return {
  config = function()
    require("marks").setup {
      -- default_mappings = false
      builtin_marks = { ".", "<", ">", "^" },
    }
  end
}
