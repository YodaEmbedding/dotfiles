return {
  "pogyomo/submode.nvim",

  config = function()
    local submode = require("submode")

    submode.create("WinMove", {
      mode = "n",
      enter = "<space>w",
      leave = { "q", "<ESC>" },
      default = function(register)
        register("+", "<C-w>+")
        register("-", "<C-w>-")
        register("=", "<C-w>=")
        register(",", "5<C-w><lt>")
        register(".", "5<C-w>>")
        register("<", "<C-w><lt>")
        register(">", "<C-w>>")
        register("_", "<C-w>_")
        register("c", "<C-w>c")
        register("h", "<C-w>h")
        register("j", "<C-w>j")
        register("k", "<C-w>k")
        register("l", "<C-w>l")
        register("s", "<C-w>s")
        register("v", "<C-w>v")
        register("w", "<C-w>w")
        register("|", "<C-w>|")
      end
    })
  end
}
