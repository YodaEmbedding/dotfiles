return {
  branch = "coq",

  init = function()
    vim.g.coq_settings = {
      auto_start = "shut-up",
      ["display.preview.x_max_len"] = 40,
      ["keymap.recommended"] = false,
      ["keymap.repeat"] = "<Space>.",
      ["weights.recency"] = 0.5,
    }
  end,

  config = function()
    require("coq")
    require("mappings._coq_nvim")
  end,
}
