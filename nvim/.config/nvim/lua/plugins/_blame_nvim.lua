return {
  "FabijanZulj/blame.nvim",

  config = function()
    require("blame").setup {
      date_format = "%Y-%m-%d",
      -- commit_detail_view = "current",
    }

    require("mappings._blame_nvim")
  end
}
