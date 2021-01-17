local utils = {}

local api = vim.api
local fn = vim.fn
local bind_buf = api.nvim_buf_set_keymap

-- In insert mode, checks if there is a non-space character before the cursor
function utils.check_backspace()
  local col = api.nvim_win_get_cursor(0)[2]
  local line = api.nvim_get_current_line()
  local result = col == 0 or line:sub(col, col):match("%s")
  return result and true
end

-- Opens either LSP documentation or vim help
function utils.coc_documentation()
  local filetype = vim.bo.filetype
  if filetype == "vim" or filetype == "help" then
    api.nvim_command("h " .. fn.expand("<cword>"))
  elseif fn["coc#rpc#ready"]() then
    fn.CocActionAsync("doHover")
  else
    api.nvim_command("!" .. vim.bo.keywordprg .. " " .. fn.expand("<cword>"))
  end
end

-- vim-peekaboo float
function utils.create_centered_floating_window()
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  local opts = {
    relative = "editor",
    width = width,
    height = height,
    col = math.floor((vim.o.columns - width) / 2),
    row = math.floor((vim.o.lines - height) / 2) - 1,
    style = "minimal",
  }

  local top = "╭" .. string.rep("─", width - 2) .. "╮"
  local mid = "│" .. string.rep(" ", width - 2) .. "│"
  local bot = "╰" .. string.rep("─", width - 2) .. "╯"

  local lines = {top}
  for i = 2, height - 1 do
    lines[i] = mid
  end
  lines[height] = bot

  local buf = api.nvim_create_buf(false, true)
  api.nvim_buf_set_lines(buf, 0, -1, true, lines)
  api.nvim_open_win(buf, true, opts)
  api.nvim_set_option("winhl", "Normal:Floating")

  local opts_new = {
    relative = opts.relative,
    width = opts.width - 4,
    height = opts.height - 2,
    col = opts.col + 2,
    row = opts.row + 1,
    style = opts.style,
  }

  api.nvim_open_win(api.nvim_create_buf(false, true), true, opts_new)
  vim.cmd("au BufWipeout <buffer> execute 'bw " .. tostring(buf) .. "'")
end

function utils.toggle_wrap()
  vim.wo.wrap = true
  vim.wo.linebreak = true
  vim.wo.list = false
  vim.o.virtualedit = ""
  bind_buf(0, "n", "j", "gj", {noremap = true, silent = true})
  bind_buf(0, "n", "k", "gk", {noremap = true, silent = true})
end

-- NOTE this can potentially be replaced with other FZF plugins for lua
-- " fzf.vim {{{1
--
-- function! s:get_git_root()
--     let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
--     return v:shell_error ? '' : root
-- endfunction
--
-- function! SmartFiles(...)
--     let root = s:get_git_root()
--     if empty(root)
--         " return call("fzf#vim#files", a:000)
--         execute ":FilesMru"
--     else
--         " let args = ["--cached --exclude-standard --others"]
--         " return call("fzf#vim#gitfiles", args)
--         execute ":ProjectMru"
--     endif
-- endfunction

return utils
