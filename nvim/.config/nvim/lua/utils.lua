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

-- Copies all search matches
function utils.copy_matches(register)
  if register == nil or string.len(register) ~= 1 then
    return
  end

  vim.cmd([[
    let register = ]] .. ("%q"):format(register) .. [[

    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(register) ? '+' : register
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
  ]])
end

-- Formats the current buffer
function utils.format()
  local whitelist = { "python", "rust" }
  if vim.tbl_contains(whitelist, vim.bo.filetype) then
    vim.lsp.buf.format()
  end
end

-- Removes old swap files for current buffer, not including current swap file.
function utils.buf_remove_old_swap()
  local filepath = vim.fn.swapname(vim.fn.bufnr())
  local len = string.len(filepath)
  local prefix = string.sub(filepath, 1, len - 4)
  local extension = string.sub(filepath, len - 3, len)

  -- NOTE: Technically, .swp, .swo, .swn, .swm, .swl, ..., .sac, .sab, .saa
  for _, ext in ipairs({ ".swp", ".swo", ".swn", ".swm" }) do
    if extension ~= ext then
      os.remove(prefix .. ext)
    end
  end
end

function utils.toggle_wrap()
  vim.wo.wrap = true
  vim.wo.linebreak = true
  vim.wo.list = false
  vim.o.virtualedit = ""
  bind_buf(0, "n", "j", "gj", { noremap = true, silent = true })
  bind_buf(0, "n", "k", "gk", { noremap = true, silent = true })
end

-- Wipes all registers
function utils.wipe_registers()
  for i = 34, 122 do
    vim.cmd('silent! call setreg(nr2char(' .. tostring(i) .. '), " ")')
    -- fn.setreg(string.char(i), buf, " ")
  end
end

return utils
