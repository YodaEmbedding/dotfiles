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
  },

  -- Actions
  { "<leader>hs", function() require("gitsigns").stage_hunk() end },
  { "<leader>hr", function() require("gitsigns").reset_hunk() end },
  { "<leader>hs", function() require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") } end, "v" },
  { "<leader>hr", function() require("gitsigns").reset_hunk { vim.fn.line("."), vim.fn.line("v") } end, "v" },
  { "<leader>hS", function() require("gitsigns").stage_buffer() end },
  { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end },
  { "<leader>hR", function() require("gitsigns").reset_buffer() end },
  { "<leader>hp", function() require("gitsigns").preview_hunk() end },
  { "<leader>hb", function() require("gitsigns").blame_line { full = true } end },
  { "<leader>tb", function() require("gitsigns").toggle_current_line_blame() end },
  { "<leader>hd", function() require("gitsigns").diffthis() end },
  { "<leader>hD", function() require("gitsigns").diffthis("~") end },
  { "<leader>td", function() require("gitsigns").toggle_deleted() end },

  -- Text object
  { "ih",         ":<C-U>Gitsigns select_hunk<CR>",                                                     { "o", "x" } },

}


-- See https://github.com/lewis6991/gitsigns.nvim?tab=readme-ov-file#keymaps
function _M.on_attach(bufnr)
  for _, mapping in ipairs(mappings) do
    mapping.opts = mapping.opts or {}
    mapping.opts.buffer = bufnr
    vim.keymap.set(mapping[3] or "n", mapping[1], mapping[2], mapping.opts)
  end
end

return _M
