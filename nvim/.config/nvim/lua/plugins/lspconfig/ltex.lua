local path = vim.fn.stdpath("config") .. "/spell/en.utf-8.add"
local words = {}

for word in io.open(path, "r"):lines() do
  table.insert(words, word)
end

return {
  settings = {
    ltex = {
      dictionary = {
        ["en-US"] = words,
        ["en-GB"] = words,
      },
    },
  },
}
