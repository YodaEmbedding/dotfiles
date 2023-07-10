local utils = require("utils")

local c = function(...) vim.keymap.set("c", ...) end
local i = function(...) vim.keymap.set("i", ...) end
local n = function(...) vim.keymap.set("n", ...) end
local x = function(...) vim.keymap.set("x", ...) end

---@format disable

-- Formatting
n("<F8>", ":set textwidth=72<CR>")           -- Format width
n("<F9>", ":set textwidth=79<CR>")           -- Format width
x(
  "gq", "<Esc>:let tw=&tw<CR>:set tw=72<CR>gvgq:let &tw=tw<CR>"
)                                            -- Format width (72-char)
n("gs", "vip:sort i<CR>")                    -- Sort
x("gs", ":sort i<CR>")                       -- Sort
n("<Leader><Space>", ":FixWhitespace<CR>")   -- Strip trailing whitespace

-- Macros
n("<F5>", "@q", {silent = true})             -- Macro run q
n("<F6>", "@@", {silent = true})             -- Macro run previous
x("<F5>", ":normal @q<CR>", {silent = true}) -- Macro run q
x("<F6>", ":normal @@<CR>", {silent = true}) -- Macro run previous

-- Pasting
x("p", 'p:let @"=@0<CR>', {silent = true})   -- Paste blackhole
i("<C-v>", '<C-o>"+p')                       -- Paste clipboard

-- Buffers
n("<S-Tab>", ":e#<CR>")                      -- Previous buffer

-- Save, quit, kill
n("<Space>d", ":bdelete<CR>", {silent = true})  -- Kill buffer
n("zx", ":qa<CR>")                           -- Quit
n("zX", ":qa!<CR>")                          -- Quit
n("<C-s>", ":up<CR>")                        -- Save
n("<Space>s", ":up<CR>")                     -- Save
c("w!!", "w !sudo tee > /dev/null %")        -- Save as sudo
c("x!!", "x !sudo tee > /dev/null %")        -- Save as sudo

-- Search
n("<F3>", [[/\<\><Left><Left>]])             -- Search whole word
x("&", '"hy:%s/<C-r>h//gc<Left><Left><Left>')  -- Substitute selection

-- Misc
x(".", ":normal .<CR>", {silent = true})     -- Dot repeat
n("<Leader>w", utils.toggle_wrap)            -- Toggle wrap
n("<Space><C-e>", ":e %:h/")                 -- Edit file at cwd

-- Automatic marks
-- n("i", "mii")
-- n("I", "miI")
-- n("a", "mia")
-- n("A", "miA")
-- n("o", "mio")
-- n("O", "miO")
-- n("c", "mic")
-- n("C", "miC")

-- Jumplist
n("<C-P>", "<C-I>")                          -- Previous jump in jumplist

-- Add <count>jk motions to jumplist
n("j", "(v:count >= 1 ? 'm`' . v:count : '') . 'j'", {expr = true})
x("j", "(v:count >= 1 ? 'm`' . v:count : '') . 'j'", {expr = true})
n("k", "(v:count >= 1 ? 'm`' . v:count : '') . 'k'", {expr = true})
x("k", "(v:count >= 1 ? 'm`' . v:count : '') . 'k'", {expr = true})

-- Don't add {} motions to jumplist
n("}", ":<C-u>execute 'keepjumps norm! ' . v:count1 . '}'<CR>", {silent = true})
n("{", ":<C-u>execute 'keepjumps norm! ' . v:count1 . '{'<CR>", {silent = true})

-- Windows
n("<C-left>",  "<C-w>h")                     -- Move left
n("<C-down>",  "<C-w>j")                     -- Move down
n("<C-up>",    "<C-w>k")                     -- Move up
n("<C-right>", "<C-w>l")                     -- Move right
n("<C-h>",     "<C-w>h")                     -- Move left
n("<C-j>",     "<C-w>j")                     -- Move down
n("<C-k>",     "<C-w>k")                     -- Move up
n("<C-l>",     "<C-w>l")                     -- Move right
n("<Space>D",  "<C-w>c")                     -- Close window
