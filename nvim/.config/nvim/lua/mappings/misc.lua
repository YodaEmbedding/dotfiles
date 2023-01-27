local utils = require("utils")
local vimp = require("vimp")

local cnoremap = vimp.cnoremap
local inoremap = vimp.inoremap
local nnoremap = vimp.nnoremap
local xnoremap = vimp.xnoremap

local function n_silent(...)
  nnoremap({ "silent" }, ...)
end

local function x_silent(...)
  xnoremap({ "silent" }, ...)
end

---@format disable

-- Formatting
nnoremap("<F6>", ":set textwidth=72<CR>")           -- Format width
nnoremap("<F7>", ":set textwidth=79<CR>")           -- Format width
xnoremap(
  "gq", "<Esc>:let tw=&tw<CR>:set tw=72<CR>gvgq:let &tw=tw<CR>"
)                                                   -- Format width (72-char)
nnoremap("gs", "vip:sort i<CR>")                    -- Sort
xnoremap("gs", ":sort i<CR>")                       -- Sort
nnoremap("<Leader><Space>", ":FixWhitespace<CR>")   -- Strip trailing whitespace

-- Macros
n_silent("<F2>", "@q")                              -- Macro run q
n_silent("<F3>", "@@")                              -- Macro run previous
x_silent("<F2>", ":normal @q<CR>")                  -- Macro run q
x_silent("<F3>", ":normal @@<CR>")                  -- Macro run previous

-- Pasting
x_silent("p", 'p:let @"=@0<CR>')                    -- Paste blackhole
inoremap("<C-v>", '<C-o>"+p')                       -- Paste clipboard
-- nnoremap("<Backspace>", '"+p')                   -- Paste clipboard

-- Buffers
nnoremap("<S-Tab>", ":e#<CR>")                      -- Previous buffer
nnoremap("gb", "     :ls<CR>:b<Space>")             -- Switch buffer

-- Save, quit, kill
-- n_silent("<Space>d", ":ScrollViewDisable | bd<CR>") -- Kill buffer
n_silent("<Space>d", ":bd<CR>")                     -- Kill buffer
nnoremap("zx", ":qa<CR>")                           -- Quit
nnoremap("zX", ":qa!<CR>")                          -- Quit
nnoremap("<C-s>", ":up<CR>")                        -- Save
nnoremap("<Space>s", ":up<CR>")                     -- Save
cnoremap("w!!", "w !sudo tee > /dev/null %")        -- Save as sudo
cnoremap("x!!", "x !sudo tee > /dev/null %")        -- Save as sudo

-- Search
xnoremap("<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')  -- Search selection
nnoremap("<C-_>", [[/\<\><Left><Left>]])            -- Search whole word

-- Misc
x_silent(".", ":normal .<CR>")                      -- Dot repeat
nnoremap("<Leader>w", utils.toggle_wrap)            -- Toggle wrap

-- Jumplist
nnoremap("<C-P>", "<C-I>")                          -- Previous jump in jumplist

-- Add <count>jk motions to jumplist
nnoremap({"expr"}, "j", "(v:count >= 1 ? 'm`' . v:count : '') . 'j'")
xnoremap({"expr"}, "j", "(v:count >= 1 ? 'm`' . v:count : '') . 'j'")
nnoremap({"expr"}, "k", "(v:count >= 1 ? 'm`' . v:count : '') . 'k'")
xnoremap({"expr"}, "k", "(v:count >= 1 ? 'm`' . v:count : '') . 'k'")

-- Don't add {} motions to jumplist
n_silent("}", ":<C-u>execute 'keepjumps norm! ' . v:count1 . '}'<CR>")
n_silent("{", ":<C-u>execute 'keepjumps norm! ' . v:count1 . '{'<CR>")


-- Frequently used:
-- .  <Space>d  <F2>  <F3>  p  <C-v>  <S-Tab>  zx  zX  <C-s>  gs
-- j  k  {  }

-- Sometimes used:
-- gq  <C-P>  w!!  <C-_>  <Leader><Space>

-- Rarely used:
-- <F6>  <F7>  <Space>s  x!!  <C-r>  gb  <Leader>w
