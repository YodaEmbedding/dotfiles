local opt = vim.api.nvim_set_option

-- Indenting, tabs, spacing
opt("expandtab", true)              -- Spaces for indent
opt("joinspaces", false)            -- Join sentences with single space
opt("shiftround", true)             -- Round >> to nearest shiftwidth multiple
opt("shiftwidth", 4)                -- Spaces for >>
opt("softtabstop", 4)               -- Spaces for tab
opt("tabstop", 4)                   -- Tab display width

-- Indenting (python)
vim.g.pyindent_continue     = '&sw'
vim.g.pyindent_nested_paren = '&sw'
vim.g.pyindent_open_paren   = '&sw'

-- Miscellaneous
opt("hidden", true)                 -- Allow hiding unsaved buffers
opt("wildmenu", true)               -- Enhanced command-line completion
opt("wildmode", "longest,list,full")

-- Search
opt("hlsearch", true)               -- Highlight search results
opt("ignorecase", true)             -- Ignore case
opt("inccommand", "split")          -- Incremental highlight during :%s
opt("smartcase", true)              -- Ignore case if lower

-- Undo
opt("undodir", "$HOME/.vim/undo")   -- Undo history location
opt("undofile", true)               -- Undo history

-- Visual
opt("colorcolumn", "80")            -- Column guide
opt("cursorline", true)             -- Highlight current line
opt("laststatus", 2)                -- Status line
opt("mouse", "a")                   -- Mouse interactivity
opt("numberwidth", 2)               -- Numbering column width
opt("relativenumber", true)         -- Relative line numbers
opt("scrolloff", 2)                 -- Always display lines around cursor
