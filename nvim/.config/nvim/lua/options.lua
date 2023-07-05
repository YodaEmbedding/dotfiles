local g = vim.g
local o = vim.opt

---@format disable

-- Completion
o.completeopt = "menuone,noinsert,noselect"
vim.o.shortmess = vim.o.shortmess .. "c"

-- Indenting, tabs, spacing
o.expandtab = true                    -- Spaces for indent
o.joinspaces = false                  -- Join sentences with single space
o.shiftround = true                   -- Round >> to nearest shiftwidth multiple
o.shiftwidth = 4                      -- Spaces for >>
o.softtabstop = 4                     -- Spaces for tab
o.tabstop = 4                         -- Tab display width

-- Indenting (python)
g.pyindent_continue     = "&sw"
g.pyindent_nested_paren = "&sw"
g.pyindent_open_paren   = "&sw"

-- Miscellaneous
o.hidden = true                       -- Allow hiding unsaved buffers
o.mouse = "a"                         -- Mouse interactivity
o.wildmenu = true                     -- Enhanced command-line completion
o.wildmode = "longest,list,full"      -- Command-line completion behavior
o.updatetime = 500                    -- ms until CursorHold fires and swap save

-- Search
o.hlsearch = true                     -- Highlight search results
o.ignorecase = true                   -- Ignore case
o.inccommand = "split"                -- Incremental highlight during :%s
o.smartcase = true                    -- Ignore case if lower

-- Undo
o.undofile = true                     -- Undo history

-- Visual
o.colorcolumn = "80"                  -- Column guide
o.cursorline = true                   -- Highlight current line
o.laststatus = 2                      -- Status line
o.linebreak = true                    -- Wrap on word breaks
o.numberwidth = 2                     -- Numbering column width
o.relativenumber = true               -- Relative line numbers
o.scrolloff = 2                       -- Always display lines around cursor
