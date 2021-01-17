local utils = require("utils")
local vimp = require("vimp")

local cnoremap = vimp.cnoremap
local inoremap = vimp.inoremap
local nnoremap = vimp.nnoremap
local xnoremap = vimp.xnoremap

xnoremap({"silent"}, ". :normal .<CR>")             -- Dot repeat
nnoremap("<F6>", ":set textwidth=72<CR>")           -- Format width
nnoremap("<F7>", ":set textwidth=79<CR>")           -- Format width
xnoremap(
  "gq", "<Esc>:let tw=&tw<CR>:set tw=72<CR>gvgq:let &tw=tw<CR>"
)                                                   -- Format width (72-char)
nnoremap("<C-x>", ":bd<CR>")                        -- Kill buffer
nnoremap({"silent"}, "<F2>", "@q")                  -- Macro
nnoremap({"silent"}, "<F3>", "@@")                  -- Macro
xnoremap({"silent"}, "<F2>", ":normal @q<CR>")      -- Macro
xnoremap({"silent"}, "<F3>", ":normal @@<CR>")      -- Macro
xnoremap({"silent"}, "p", 'p:let @"=@0<CR>')        -- Paste blackhole
inoremap("<C-v>", '<C-o>"+p')                       -- Paste clipboard
nnoremap("<Backspace>", '"+p"')                     -- Paste clipboard
nnoremap("<S-Tab>", ":e#<CR>")                      -- Previous buffer
nnoremap("<C-P>", "<C-I>")                          -- Previous jump in jumplist
nnoremap("zx", ":qa<CR>")                           -- Quit
nnoremap("zX", ":qa!<CR>")                          -- Quit
nnoremap("<C-s>", ":w<CR>")                         -- Save
cnoremap("w!!", "w !sudo tee > /dev/null %")        -- Save as sudo
cnoremap("x!!", "x !sudo tee > /dev/null %")        -- Save as sudo
xnoremap("<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>')    -- Search selection
nnoremap("<C-_>", [[/\<\><Left><Left>]])            -- Search whole word
nnoremap("gs", "vip:sort<CR>")                      -- Sort
xnoremap("gs", ":sort<CR>")                         -- Sort
nnoremap("<Leader><Space>", ":FixWhitespace<CR>")   -- Strip trailing whitespace
nnoremap("gb", "     :ls<CR>:b<Space>")             -- Switch buffer
nnoremap("<Leader>w", utils.toggle_wrap)            -- Toggle wrap

-- Add <count>jk motions to jumplist
nnoremap({"expr"}, "j", "(v:count >= 1 ? 'm`' . v:count : '') . 'j'")
xnoremap({"expr"}, "j", "(v:count >= 1 ? 'm`' . v:count : '') . 'j'")
nnoremap({"expr"}, "k", "(v:count >= 1 ? 'm`' . v:count : '') . 'k'")
xnoremap({"expr"}, "k", "(v:count >= 1 ? 'm`' . v:count : '') . 'k'")

-- Don't add {} motions to jumplist
nnoremap({"silent"}, "}", ":<C-u>execute 'keepjumps norm! ' . v:count1 . '}'<CR>")
nnoremap({"silent"}, "{", ":<C-u>execute 'keepjumps norm! ' . v:count1 . '{'<CR>")
