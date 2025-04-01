local utils = {}

local api = vim.api
local bind_buf = api.nvim_buf_set_keymap

---@param filename string
function utils.read_file(filename)
  local file = io.open(filename, "r")
  if file == nil then
    return nil
  end
  local content = file:read("*a")
  file:close()
  return content
end

function utils.load_local_settings()
  local filename = vim.fn.stdpath("config") .. "/local_settings.json"
  local content = utils.read_file(filename)
  local local_settings = {}
  if content ~= nil then
    local_settings = vim.fn.json_decode(content)
  end
  _G.local_settings = local_settings
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

function utils.set_buffer_local_mappings(mappings, bufnr)
  local mappings_buf = vim.deepcopy(mappings)
  if _G.plugin_loaded("which-key.nvim") then
    for _, m in ipairs(mappings_buf) do
      m.buffer = bufnr
      m.mode = m[3] or "n"
      m[3] = nil
    end
    require("which-key").add(mappings_buf)
  else
    for _, m in ipairs(mappings_buf) do
      m.opts = m.opts or {}
      m.opts.buffer = bufnr
      local mode = m[3] or "n"
      vim.keymap.set(mode, m[1], m[2], m.opts)
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

-- From https://stackoverflow.com/questions/13848429/window-navigation-wrap-around-in-vim/73612761#73612761
local function try_jump_window(direction, count)
  local prev_win_nr = vim.fn.winnr()
  vim.cmd(count .. "wincmd " .. direction)
  return vim.fn.winnr() ~= prev_win_nr
end

-- From https://stackoverflow.com/questions/13848429/window-navigation-wrap-around-in-vim/73612761#73612761
function utils.jump_window_with_wrap(direction, opposite)
  return function()
    if not try_jump_window(direction, vim.v.count1) then
      try_jump_window(opposite, 999)
    end
  end
end

return utils
