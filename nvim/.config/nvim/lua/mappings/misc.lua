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
n("<Space>d", ":Bdelete<CR>", {silent = true})  -- Kill buffer
n("zx", ":qa<CR>")                           -- Quit
n("zX", ":qa!<CR>")                          -- Quit
n("<C-s>", ":up<CR>")                        -- Save
n("<Space>s", ":up<CR>")                     -- Save
c("w!!", "w !sudo tee > /dev/null %")        -- Save as sudo
c("x!!", "x !sudo tee > /dev/null %")        -- Save as sudo

-- Search
n("<leader>/", [[/\<\><Left><Left>]])          -- Search whole word
x("&", '"hy:%s/<C-r>h//gc<Left><Left><Left>')  -- Substitute selection
n("/", [[/\v]])                                -- Very magic regex
n("?", [[:%s/\v]])                             -- Very magic regex
x("?", [[:s/\v]])                              -- Very magic regex

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
n("<Space>D",  "<C-w>c")                     -- Close window

-- Window selection
local sel = utils.jump_window_with_wrap
local sel_opts = { silent = true, noremap = true }
n("<C-w>h",    sel("h", "l"), sel_opts)      -- Select left
n("<C-w>j",    sel("j", "k"), sel_opts)      -- Select down
n("<C-w>k",    sel("k", "j"), sel_opts)      -- Select up
n("<C-w>l",    sel("l", "h"), sel_opts)      -- Select right

n("<C-left>",  sel("h", "l"), sel_opts)      -- Select left
n("<C-down>",  sel("j", "k"), sel_opts)      -- Select down
n("<C-up>",    sel("k", "j"), sel_opts)      -- Select up
n("<C-right>", sel("l", "h"), sel_opts)      -- Select right

n("<C-h>",     sel("h", "l"), sel_opts)      -- Select left
n("<C-j>",     sel("j", "k"), sel_opts)      -- Select down
n("<C-k>",     sel("k", "j"), sel_opts)      -- Select up
n("<C-l>",     sel("l", "h"), sel_opts)      -- Select right

i("<C-h>",     sel("h", "l"), sel_opts)      -- Select left
i("<C-j>",     sel("j", "k"), sel_opts)      -- Select down
i("<C-k>",     sel("k", "j"), sel_opts)      -- Select up
i("<C-l>",     sel("l", "h"), sel_opts)      -- Select right
