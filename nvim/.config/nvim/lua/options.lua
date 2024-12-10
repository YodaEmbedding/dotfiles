local g = vim.g
local o = vim.opt

---@format disable

-- Colors
if vim.fn.exists("+termguicolors") then
  o.termguicolors = true              -- True color (24-bit)
end

-- Completion
-- o.completeopt = "menuone,noinsert,noselect"
-- vim.o.shortmess = vim.o.shortmess .. "c"

-- Indenting, tabs, spacing
o.expandtab = true                    -- Spaces for indent
o.joinspaces = false                  -- Join sentences with single space
o.shiftround = true                   -- Round >> to nearest shiftwidth multiple
o.shiftwidth = 4                      -- Spaces for >>
o.softtabstop = 4                     -- Spaces for tab
o.tabstop = 4                         -- Tab display width

-- Indenting (python)
g.python_indent = {
  continue = "shiftwidth()",
  nested_paren = "shiftwidth()",
  open_paren = "shiftwidth()",
  close_paren = "shiftwidth() * -1",
  -- close_paren = "0",
  closed_paren_align_last_line = false,
}

-- Miscellaneous
o.hidden = true                       -- Allow hiding unsaved buffers
o.mouse = "a"                         -- Mouse interactivity
o.title = true                        -- Set terminal title
-- o.titlestring = "%t"                  -- Set current file as terminal title
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
o.signcolumn = "auto:1-3"             -- Sign column
