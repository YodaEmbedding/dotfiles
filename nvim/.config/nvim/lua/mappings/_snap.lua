if not _G.plugin_loaded("snap") then
  do return end
end

local snap = require("snap")

local git_file = snap.get"producer.git.file".args {
  "--cached",
  "--others",
  "--exclude-standard",
}

local smart_file = snap.get"consumer.try"(
  git_file,
  snap.get"producer.fd.file"
)

-- Defaults
local function create(config)
  return snap.create(config, {
    reverse = true,
    mappings = {
      ["next-page"] = {"<C-f>", "<PageDown>"},
      ["prev-page"] = {"<C-b>", "<PageUp>"},
    },
  })
end

-- Buffers
-- snap.register.map("n", "<Tab>", create(function ()
--   return {
--     producer = snap.get"consumer.fzy"(snap.get"producer.vim.buffer"),
--     select = snap.get"select.file".select,
--     multiselect = snap.get"select.file".multiselect,
--     views = {snap.get"preview.file"},
--   }
-- end))

-- Files
snap.register.map("n", ",", create(function ()
  return {
    producer = snap.get"consumer.fzy"(smart_file),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = {snap.get"preview.file"},
  }
end))

-- Files
snap.register.map("n", "<Space>f", create(function ()
  return {
    producer = snap.get"consumer.fzy"(snap.get"producer.fd.file"),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = {snap.get"preview.file"},
  }
end))

-- Git files
snap.register.map("n", "<Space>g", create(function ()
  return {
    producer = snap.get"consumer.fzy"(smart_file),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = {snap.get"preview.file"},
  }
end))

-- Old files
snap.register.map("n", "<Space>o", create(function ()
  return {
    producer = snap.get"consumer.fzy"(snap.get"producer.vim.oldfile"),
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = {snap.get"preview.file"},
  }
end))

-- Grep
snap.register.map("n", "<Space>l", create(function ()
  return {
    producer = snap.get"consumer.limit"(10000,
      snap.get"producer.ripgrep.vimgrep"
    ),
    select = snap.get"select.vimgrep".select,
    multiselect = snap.get"select.vimgrep".multiselect,
    views = {snap.get"preview.vimgrep"},
  }
end))

-- Grep with post-filtering
snap.register.map("n", "<Space>L", create(function ()
  return {
    producer = snap.get"consumer.limit"(10000,
      snap.get"producer.ripgrep.vimgrep"
    ),
    steps = {{
      consumer = snap.get"consumer.fzf",
      config = {prompt = "FZF>"}
    }},
    select = snap.get"select.file".select,
    multiselect = snap.get"select.file".multiselect,
    views = {snap.get"preview.file"},
  }
end))

-- Vim help
snap.register.map("n", "<Space>h", create(function ()
  return {
    prompt = "Help>",
    producer = snap.get"consumer.fzy"(snap.get"producer.vim.help"),
    select = snap.get"select.help".select,
    views = {snap.get"preview.help"},
  }
end))
