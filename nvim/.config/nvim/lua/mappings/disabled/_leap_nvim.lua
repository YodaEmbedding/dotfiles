local leap = require("leap")


---@format disable


-- DEFAULT MAPPINGS

-- https://github.com/ggandor/leap.nvim/blob/main/fnl/leap/user.fnl
-- [[[:n :x :o] "s"  "<Plug>(leap-forward-to)" "Leap forward to"]
--   [[:n :x :o] "S"  "<Plug>(leap-backward-to)" "Leap backward to"]
--   [   [:x :o] "x"  "<Plug>(leap-forward-till)" "Leap forward till"]
--   [   [:x :o] "X"  "<Plug>(leap-backward-till)" "Leap backward till"]
--   [[:n :x :o] "gs" "<Plug>(leap-from-window)" "Leap from window"]
--   [[:n :x :o] "gs" "<Plug>(leap-cross-window)" "Leap from window"]  ; deprecated

-- n ("s",  "<Plug>(leap-forward)")
-- x ("s",  "<Plug>(leap-forward)")
-- o ("s",  "<Plug>(leap-forward)")
-- -- o ("z",  "<Plug>(leap-forward)")
-- n ("S",  "<Plug>(leap-backward)")
-- x ("S",  "<Plug>(leap-backward)")
-- o ("S",  "<Plug>(leap-backward)")
-- -- o ("Z",  "<Plug>(leap-backward)")
-- x ("x",  "<Plug>(leap-forward-x)")
-- o ("x",  "<Plug>(leap-forward-x)")
-- x ("X",  "<Plug>(leap-backward-x)")
-- o ("X",  "<Plug>(leap-backward-x)")
-- n ("gs", "<Plug>(leap-from-window)")
-- x ("gs", "<Plug>(leap-from-window)")
-- o ("gs", "<Plug>(leap-from-window)")


-- CUSTOM MAPPINGS

-- Unidirectional
-- n ("s",  "<Plug>(leap-forward)")
-- x ("s",  "<Plug>(leap-forward)")
-- x ("z",  "<Plug>(leap-forward)")
-- o ("s",  "<Plug>(leap-forward)")
-- n ("S",  "<Plug>(leap-backward)")
-- -- x ("S",  "<Plug>(leap-backward)")  -- NOTE: overridden by vim-surround
-- x ("Z",  "<Plug>(leap-backward)")
-- o ("S",  "<Plug>(leap-backward)")
-- x ("x",  "<Plug>(leap-forward-x)")
-- o ("x",  "<Plug>(leap-forward-x)")
-- x ("X",  "<Plug>(leap-backward-x)")
-- o ("X",  "<Plug>(leap-backward-x)")

-- Bidirectional
vim.keymap.set({"n", "x", "o"}, "s", function ()
  local current_window = vim.fn.win_getid()
  require("leap").leap { target_windows = { current_window } }
end)
