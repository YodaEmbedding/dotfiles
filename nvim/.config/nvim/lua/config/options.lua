---@format disable-next
local options = {

  -- Completion
  -- completeopt = "menuone,noinsert,noselect",

  -- Indenting, tabs, spacing
  expandtab = true,                   -- Spaces for indent
  joinspaces = false,                 -- Join sentences with single space
  shiftround = true,                  -- Round >> to nearest shiftwidth multiple
  shiftwidth = 4,                     -- Spaces for >>
  softtabstop = 4,                    -- Spaces for tab
  tabstop = 4,                        -- Tab display width

  -- Miscellaneous
  hidden = true,                      -- Allow hiding unsaved buffers
  mouse = "a",                        -- Mouse interactivity
  title = true,                       -- Set terminal title
  -- titlestring = "%t",              -- Set current file as terminal title
  wildmenu = true,                    -- Enhanced command-line completion
  wildmode = "longest,list,full",     -- Command-line completion behavior
  updatetime = 500,                   -- ms until CursorHold fires and swap save

  -- Search
  hlsearch = true,                    -- Highlight search results
  ignorecase = true,                  -- Ignore case
  inccommand = "split",               -- Incremental highlight during :%s
  smartcase = true,                   -- Ignore case if lower

  -- Undo
  undofile = true,                    -- Undo history

  -- Visual
  colorcolumn = "80",                 -- Column guide
  cursorline = true,                  -- Highlight current line
  laststatus = 2,                     -- Status line
  linebreak = true,                   -- Wrap on word breaks
  numberwidth = 2,                    -- Numbering column width
  relativenumber = true,              -- Relative line numbers
  scrolloff = 2,                      -- Always display lines around cursor
  signcolumn = "auto:1-3",            -- Sign column

  statusline = table.concat({
    " ",                              -- -
    -- "%t",                          -- Tail of the filename
    -- " ",                           -- -
    -- "∈",                           -- ∈
    -- " ",                           -- -
    -- "%{expand('%:~:.:h')}",        -- Parents till cwd
    "%{expand('%:~:.')}",             -- Relative filepath
    "%h",                             -- Help file flag
    "%r",                             -- Read only flag
    "%m",                             -- Modified flag
    "%=",                             -- Left/right separator
    " ",                              -- -
    "  ",                             -- --
    "%{&filetype}",                   -- Filetype
    " ",                              -- -
    "%{&ff}",                         -- File format
    " ",                              -- -
    "%{&expandtab?\"sp\":\"tab\"}-",  -- Indent settings
    "%{&shiftwidth}",                 -- Indent settings
    "  ",                             -- --
    "%2v",                            -- Cursor column (virtual)
    "  ",                             -- --
    "(%l / %L)",                      -- Cursor line/total lines
    " ",                              -- -
  }),

}

---@format disable-next
if vim.fn.exists("+termguicolors") then
  options.termguicolors = true        -- True color (24-bit)
end

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Indenting (python)
vim.g.python_indent = {
  continue = "shiftwidth()",
  nested_paren = "shiftwidth()",
  open_paren = "shiftwidth()",
  close_paren = "shiftwidth() * -1",
  -- close_paren = "0",
  closed_paren_align_last_line = false,
}
