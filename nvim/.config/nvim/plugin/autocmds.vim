" Buffer: Auto-format on save
" autocmd BufWritePre * lua vim.lsp.buf.format()
autocmd BufWritePre * lua require("utils").format()

" Buffer: Set formatoptions

" t  Auto-wrap text using 'textwidth'.
" c  Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
" r  Automatically insert the current comment leader after hitting <Enter> in Insert mode.
" o  Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.  In case comment is unwanted in a specific place use CTRL-U to quickly delete it. |i_CTRL-U|
" /  When 'o' is included: do not insert the comment leader for a // comment after a statement, only when // is at the start of the line.
" q  Allow formatting of comments with "gq".
" w  Trailing white space indicates a paragraph continues in the next line. A line that ends in a non-white character ends a paragraph.
" a  Automatic formatting of paragraphs.  Every time text is inserted or deleted the paragraph will be reformatted.  See |auto-format|.
" n  When formatting text, recognize numbered lists. e.g. "1."
" 2  When formatting text, use the indent of the second line of a paragraph for the rest of the paragraph, instead of the indent of the first line.
" v  Vi-compatible auto-wrapping in insert mode: Only break a line at a blank that you have entered during the current insert command.
" b  Like 'v', but only auto-wrap if you enter a blank at or before the wrap margin.
" l  Long lines are not broken in insert mode: When a line was longer than 'textwidth' when the insert command started, Vim does not automatically format it.
" m  Also break at a multibyte character above 255.
" M  When joining lines, don't insert a space before or after a multibyte character.
" B  When joining lines, don't insert a space between two multibyte characters.
" 1  Don't break a line after a one-letter word.
" ]  Respect 'textwidth' rigorously.
" j  Where it makes sense, remove a comment leader when joining lines.
"    For example, joining:
"       int i;   // the index
"                // in the list
"     Becomes:
"       int i;   // the index in the list
" p  Don't break lines at single spaces that follow periods.

" Default: tcqj
" Interesting: tcroqnlj
autocmd BufRead,BufNewFile * setlocal formatoptions-=t
autocmd BufRead,BufNewFile * setlocal formatoptions-=c
autocmd BufRead,BufNewFile * setlocal formatoptions-=o
autocmd BufRead,BufNewFile * setlocal formatoptions+=r
" autocmd BufRead,BufNewFile * setlocal formatoptions=rqj

" Miscellaneous: Highlight on yank
" autocmd TextYankPost * lua vim.highlight.on_yank {timeout=500}

" Miscellaneous: Set read-only if swap file exists
autocmd SwapExists * let v:swapchoice = "o"
