return {
  "nvim-focus/focus.nvim",

  config = function()
    require("focus").setup {
      autoresize = {
        minwidth = 20,
        minheight = 0,
        height_quickfix = 10,
      },
      ui = {
        signcolumn = false,
      },
    }

    local ignore_filetypes = {
      "^blame$",
      "^DiffviewFiles$",
      "^gitsigns-blame$",
      "^neo-tree$",
      "^NvimTree$",
      -- "^NvimTree_\\d*$",
      "^trouble$",
    }

    local ignore_buftypes = {
      "nofile",
      "prompt",
      "popup",
    }

    local augroup = vim.api.nvim_create_augroup("FocusDisable", { clear = true })

    vim.api.nvim_create_autocmd("WinEnter", {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
        then
          vim.w.focus_disable = true
        else
          vim.w.focus_disable = false
        end
      end,
      desc = "Disable focus autoresize for BufType",
    })

    vim.api.nvim_create_autocmd("FileType", {
      group = augroup,
      callback = function(_)
        local disable = false
        for _, pattern in ipairs(ignore_filetypes) do
          if vim.fn.matchstr(vim.bo.filetype, pattern) ~= "" then
            disable = true
            break
          end
        end
        vim.b.focus_disable = disable
      end,
      desc = "Disable focus autoresize for FileType",
    })

  end,
}
