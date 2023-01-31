math.randomseed(os.time())

require("drop").setup({
  theme = ({ "stars", "snow", "xmas" })[math.random(1, 3)],
  screensaver = false,
})
