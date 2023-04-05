local home = os.getenv("HOME")
local g = vim.g

-- Workaround until https://github.com/neovim/neovim/pull/13479
local function o(key, value)
  vim.o[key] = value
end

local function b(key, value)
  vim.bo[key] = value
  vim.o[key] = value
end

local function w(key, value)
  vim.wo[key] = value
  vim.o[key] = value
end

---@format disable

-- Completion
o("completeopt", "menuone,noinsert,noselect")
o("shortmess", vim.o.shortmess .. "c")

-- Indenting, tabs, spacing
b("expandtab", true)                  -- Spaces for indent
o("joinspaces", false)                -- Join sentences with single space
o("shiftround", true)                 -- Round >> to nearest shiftwidth multiple
b("shiftwidth", 4)                    -- Spaces for >>
b("softtabstop", 4)                   -- Spaces for tab
b("tabstop", 4)                       -- Tab display width

-- Indenting (python)
g.pyindent_continue     = "&sw"
g.pyindent_nested_paren = "&sw"
g.pyindent_open_paren   = "&sw"

-- Miscellaneous
o("hidden", true)                     -- Allow hiding unsaved buffers
o("mouse", "a")                       -- Mouse interactivity
o("wildmenu", true)                   -- Enhanced command-line completion
o("wildmode", "longest,list,full")    -- Command-line completion behavior

-- Search
o("hlsearch", true)                   -- Highlight search results
o("ignorecase", true)                 -- Ignore case
o("inccommand", "split")              -- Incremental highlight during :%s
o("smartcase", true)                  -- Ignore case if lower

-- Undo
o("undodir", home .. "/.vim_undo")    -- Undo history location
b("undofile", true)                   -- Undo history

-- Visual
w("colorcolumn", "80")                -- Column guide
w("cursorline", true)                 -- Highlight current line
o("laststatus", 2)                    -- Status line
w("linebreak", true)                  -- Wrap on word breaks
w("numberwidth", 2)                   -- Numbering column width
w("relativenumber", true)             -- Relative line numbers
w("scrolloff", 2)                     -- Always display lines around cursor
