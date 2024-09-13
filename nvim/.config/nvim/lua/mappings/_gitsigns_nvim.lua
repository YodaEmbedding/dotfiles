local _M = {}

local mappings = {

  -- Navigation
  {
    "]c",
    function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        require("gitsigns").nav_hunk("next")
      end
    end,
    desc = "Go to next Git hunk",
  },
  {
    "[c",
    function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        require("gitsigns").nav_hunk("prev")
      end
    end,
    desc = "Go to previous Git hunk",
  },

  -- Actions
  {
    "<space>ghs",
    function() require("gitsigns").stage_hunk() end,
    desc = "Git stage hunk",
  },
  {
    "<space>ghs",
    function() require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
    "v",
    desc = "Git stage hunk",
  },
  {
    "<space>ghr",
    function() require("gitsigns").reset_hunk() end,
    desc = "Git reset hunk",
  },
  {
    "<space>ghr",
    function() require("gitsigns").reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
    "v",
    desc = "Git reset hunk",
  },
  {
    "<space>ghS",
    function() require("gitsigns").stage_buffer() end,
    desc = "Git stage buffer",
  },
  {
    "<space>ghu",
    function() require("gitsigns").undo_stage_hunk() end,
    desc = "Git undo stage hunk",
  },
  {
    "<space>ghR",
    function() require("gitsigns").reset_buffer() end,
    desc = "Git reset buffer",
  },
  {
    "<space>ghp",
    function() require("gitsigns").preview_hunk() end,
    desc = "Git preview hunk",
  },
  {
    "<space>ghb",
    function() require("gitsigns").blame_line { full = true } end,
    desc = "Git blame line",
  },
  {
    "<space>gtb",
    function() require("gitsigns").toggle_current_line_blame() end,
    desc = "Git blame current line toggle",
  },
  {
    "<space>gdh",
    function() require("gitsigns").diffthis() end,
    desc = "Git diff",
  },
  {
    "<space>gd~",
    function() require("gitsigns").diffthis("~") end,
    desc = "Git diff (HEAD~)",
  },
  {
    "<space>gtd",
    function() require("gitsigns").toggle_deleted() end,
    desc = "Git toggle deleted",
  },

  -- Text object
  {
    "ih",
    ":<C-U>Gitsigns select_hunk<CR>",
    { "o", "x" },
    desc = "Git select hunk",
  },

}


local function set_buffer_local_mappings(mappings_, bufnr)
  if _G.plugin_loaded("which-key.nvim") then
    local mappings_buf = vim.deepcopy(mappings_)
    for _, m in ipairs(mappings_buf) do
      m.buffer = bufnr
      m.mode = m[3] or "n"
      m[3] = nil
    end
    require("which-key").add(mappings_buf)
  else
    local mappings_buf = vim.deepcopy(mappings_)
    for _, m in ipairs(mappings_buf) do
      m.opts = m.opts or {}
      m.opts.buffer = bufnr
      vim.keymap.set(m[3] or "n", m[1], m[2], m.opts)
    end
  end
end


-- See https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#keymaps
function _M.on_attach(bufnr)
  set_buffer_local_mappings(mappings, bufnr)
end

return _M
