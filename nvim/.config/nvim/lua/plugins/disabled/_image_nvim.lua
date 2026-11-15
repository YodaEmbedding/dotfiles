return {
  "3rd/image.nvim",

  -- This seems to work sometimes, but we don't really need it, so let's disable it for now.
  enabled = false,

  opts = {
    -- backend = "kitty",
    -- backend = "sixel",
    -- backend = "ueberzug",
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = true,
        filetypes = { "markdown", "vimwiki" },
      },
    },
    -- max_width = 100,
    -- max_height = 12,
    -- max_height_window_percentage = math.huge,
    -- max_width_window_percentage = math.huge,
    window_overlap_clear_enabled = false,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  },

  config = function(_, opts)
    if os.getenv("TMUX") then
      vim.fn.system { "tmux", "set-option", "-gq", "allow-passthrough", "on" }
    end
    require("image").setup(opts)
  end,
}
