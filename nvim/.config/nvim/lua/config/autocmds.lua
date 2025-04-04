-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    local whitelist = { "python", "rust" }
    if vim.tbl_contains(whitelist, vim.bo.filetype) then
      require("utils").format(args.buf)
    end
  end,
})

-- Auto create directory when saving a file (mkdir -p)
vim.api.nvim_create_autocmd("BufWritePre", {
  callback = function(event)
    if event.match:match("^%w%w+:[\\/][\\/]") then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank { timeout = 500 }
  end,
})

-- Set read-only if swap file exists
vim.api.nvim_create_autocmd("SwapExists", {
  pattern = "*",
  callback = function()
    vim.v.swapchoice = "o"
  end,
})

-- Neovim default: tcqj
-- Interesting: tcroqnlj
--
-- t  Auto-wrap text using 'textwidth'.
-- c  Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
-- r  Automatically insert the current comment leader after hitting <Enter> in Insert mode.
-- o  Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.  In case comment is unwanted in a specific place use CTRL-U to quickly delete it. |i_CTRL-U|
-- /  When 'o' is included: do not insert the comment leader for a // comment after a statement, only when // is at the start of the line.
-- q  Allow formatting of comments with "gq".
-- w  Trailing white space indicates a paragraph continues in the next line. A line that ends in a non-white character ends a paragraph.
-- a  Automatic formatting of paragraphs.  Every time text is inserted or deleted the paragraph will be reformatted.  See |auto-format|.
-- n  When formatting text, recognize numbered lists. e.g. "1."
-- 2  When formatting text, use the indent of the second line of a paragraph for the rest of the paragraph, instead of the indent of the first line.
-- v  Vi-compatible auto-wrapping in insert mode: Only break a line at a blank that you have entered during the current insert command.
-- b  Like 'v', but only auto-wrap if you enter a blank at or before the wrap margin.
-- l  Long lines are not broken in insert mode: When a line was longer than 'textwidth' when the insert command started, Vim does not automatically format it.
-- m  Also break at a multibyte character above 255.
-- M  When joining lines, don't insert a space before or after a multibyte character.
-- B  When joining lines, don't insert a space between two multibyte characters.
-- 1  Don't break a line after a one-letter word.
-- ]  Respect 'textwidth' rigorously.
-- j  Where it makes sense, remove a comment leader when joining lines.
--    For example, joining:
--       int i;   // the index
--                // in the list
--     Becomes:
--       int i;   // the index in the list
-- p  Don't break lines at single spaces that follow periods.
--
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*",
  callback = function(args)
    local buf = args.buf
    local fo = vim.api.nvim_buf_get_option(buf, "formatoptions")
    fo = fo:gsub("[tcro]", "") .. "r"
    vim.api.nvim_buf_set_option(buf, "formatoptions", fo)
    -- vim.print(vim.api.nvim_buf_get_option(buf, "formatoptions"))
  end,
})
