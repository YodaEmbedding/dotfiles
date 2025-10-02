return {
  "petertriho/nvim-scrollbar",

  opts = {
    handle = {
      -- color = "#5C4561",
      color = "#6C5571",
    },
    marks = {
      Info = { text = { "" } },
      Hint = { text = { "" } },
      Misc = { text = { "" } },
    },
  },

  config = function(_, opts)
    require("scrollbar").setup(opts)
    require("scrollbar.handlers.gitsigns").setup()

    require("scrollbar.handlers").register("marksmarks", function(bufnr)
      local excluded_marks = ""  -- e.g., "z"
      local marks = vim.fn.getmarklist(bufnr) ---@diagnostic disable-line: param-type-mismatch
      local out = {}
      for _, markObj in pairs(marks) do
        local mark = markObj.mark:sub(2, 2)
        local isLetter = mark:lower() ~= mark:upper()
        if isLetter and not (excluded_marks:find(mark)) then
          table.insert(out, {
            line = markObj.pos[2],
            text = mark,
            type = "Info",
            level = 0,
          })
        end
      end
      return out
    end)
  end,
}
