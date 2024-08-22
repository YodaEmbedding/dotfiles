return {
  "FabijanZulj/blame.nvim",

  cmd = { "BlameToggle" },

  keys = require("mappings._blame_nvim"),

  opts = {
    date_format = "%Y-%m-%d",
    -- commit_detail_view = "current",
  },

  config = function(_, opts)
    require("blame").setup(opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "BlameViewOpened",
      callback = function(event)
        local blame_type = event.data
        if blame_type == "window" then
          vim.cmd [[
            execute "LspLensOff"
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
