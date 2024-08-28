return {
  {
    "<C-o>",
    function() require("before").jump_to_last_edit() end,
    desc = "Jump to last edit",
  },
  {
    "<C-p>",
    function() require("before").jump_to_next_edit() end,
    desc = "Jump to next edit",
  },
}
