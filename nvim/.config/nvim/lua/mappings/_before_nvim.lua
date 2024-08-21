return {
  { "<C-o>", function() require("before").jump_to_last_edit() end, "n" },
  { "<C-p>", function() require("before").jump_to_next_edit() end, "n" },
}
