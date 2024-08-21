return {
  "FabijanZulj/blame.nvim",

  cmd = { "BlameToggle" },

  init = function()
    -- Since we load lazily upon cmd, set up the mappings in init, not config.
    require("mappings._blame_nvim")
  end,

  config = function()
    require("blame").setup {
      date_format = "%Y-%m-%d",
      -- commit_detail_view = "current",
    }

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlameViewOpened",
      callback = function(event)
        local blame_type = event.data
        if blame_type == "window" then
          vim.cmd [[
            execute "LspLensOff"
            call feedkeys("\<C-w>h")
          ]]
        end
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlameViewClosed",
      callback = function(event)
        local blame_type = event.data
        if blame_type == "window" then
          vim.cmd [[
            execute "LspLensOn"
          ]]
        end
      end,
    })
  end
}
