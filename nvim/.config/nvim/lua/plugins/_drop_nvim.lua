return {
  event = "VimEnter",

  config = function()
    math.randomseed(os.time())

    require("drop").setup({
      theme = "snow",
      screensaver = false,
      interval = 500,
      max = 8,
    })
  end,
}
