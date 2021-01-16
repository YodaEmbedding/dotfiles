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

-- coc.nvim
inoremap({"silent", "expr"}, "<C-space>", "coc#refresh()")
inoremap({"silent", "expr"}, "<C-k>", "CocActionAsync('showSignatureHelp')")
nnoremap({"silent"}, "[c", "<Plug>(coc-diagnostic-prev)")
nnoremap({"silent"}, "]c", "<Plug>(coc-diagnostic-next)")
nnoremap({"silent"}, "gd", "<Plug>(coc-definition)")
nnoremap({"silent"}, "gi", "<Plug>(coc-implementation)")
nnoremap({"silent"}, "gr", "<Plug>(coc-references)")
nnoremap({"silent"}, "gt", "<Plug>(coc-type-definition)")
nnoremap("<Leader>=", "<Plug>(coc-format-selected)")
xnoremap("<Leader>=", "<Plug>(coc-format-selected)")
nnoremap("<Leader>aa", "<Plug>(coc-codeaction-selected)")
xnoremap("<Leader>aa", "<Plug>(coc-codeaction-selected)")
nnoremap("<Leader>ac", "<Plug>(coc-codeaction)")
nnoremap("<Leader>qf", "<Plug>(coc-fix-current)")
nnoremap("<Leader>rn", "<Plug>(coc-rename)")

-- TODO use lua functions rather than weird vimscript
nnoremap({"silent", "expr"}, "K",
  "(coc#float#has_float() "
  .. "? ':call coc#float#close_all()<CR>' "
  .. ": ':lua require(\"utils\").coc_documentation()<CR>')"
)
nnoremap({"silent", "expr"}, "<C-k>",
  "(exists('w:float') "
  .. "? ':call coc#float#close_all()<CR>' "
  .. ": coc#float#has_float() "
  .. "? ':call coc#float#jump()<CR>' "
  .. ": ':lua require(\"utils\").coc_documentation()<CR>')"
)

inoremap({"silent", "expr"}, "<Tab>",
  [[pumvisible() ? '\<C-n>' : ]] ..
  [[luaeval('require("utils").check_backspace()') ? '\<Tab>' : ]] ..
  [[coc#refresh()]]
)
inoremap({"expr"}, "<S-Tab>", [[pumvisible() ? '\<C-p>' : '\<C-h>']])

-- CocList
nnoremap({"silent"}, "<space><space>", ":<C-u>CocList<CR>")
nnoremap({"silent"}, "<C-space>", ":<C-u>CocListResume<CR>")
nnoremap({"silent"}, "<space>a", ":<C-u>CocList actions<CR>")
nnoremap({"silent"}, "<space>c", ":<C-u>CocList commands<CR>")
nnoremap({"silent"}, "<space>d", ":<C-u>CocList diagnostics<CR>")
nnoremap({"silent"}, "<space>m", ":<C-u>CocList marks<CR>")
nnoremap({"silent"}, "<space>o", ":<C-u>CocList outline<CR>")
nnoremap({"silent"}, "<space>q", ":<C-u>CocList quickfix<CR>")
nnoremap({"silent"}, "<space>s", ":<C-u>CocList -I symbols<CR>")
nnoremap({"silent"}, "<space>y", ":<C-u>CocList -A --normal yank<CR>")

-- fzf
nnoremap("<Tab>", ":Buffers<CR>")
nnoremap(",", ":SmartFiles<CR>")
nnoremap("<Leader>s", ":LocateFiles .<CR>")
nnoremap("<Leader>f", ":FilesMru<CR>")
nnoremap("<Leader>F", ":Files %:h<CR>")
nnoremap("<Leader>g", ":GFiles --cached --others --exclude-standard<CR>")
nnoremap("<Leader>h", ":History<CR>")
nnoremap("<Leader>l", ":Lines<CR>")
nnoremap("<Leader>ag", ":Ag!<CR>")
nnoremap("<Leader>rg", ":Rg!<CR>")
nnoremap("<Leader>m", ":Marks<CR>")
nnoremap("<Leader>t", ":Tags<CR>")
nnoremap("gl", ":Rg<CR>")
