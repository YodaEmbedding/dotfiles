return {
  "jpalardy/vim-slime",

  init = function()
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_target = "tmux"
    vim.g.slime_default_config = {
      socket_name = "default",
      target_pane = ":.1",  -- "{last}", ":.1"
    }
  end,
}

-- Related:
-- https://github.com/jpalardy/vim-slime
-- https://github.com/jalvesaq/vimcmdline
-- https://github.com/mtikekar/nvim-send-to-term
-- https://github.com/milanglacier/yarepl.nvim
-- https://github.com/Vigemus/iron.nvim
-- https://gitlab.com/HiPhish/repl.nvim
-- https://github.com/pappasam/nvim-repl
-- https://github.com/geg2102/nvim-python-repl
-- https://github.com/shea-parkes/nvim-ipython-repl
-- https://github.com/chadvoegele/nvim-slime
-- https://github.com/michaelb/sniprun
