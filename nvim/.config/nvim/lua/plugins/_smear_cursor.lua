return {
  "sphamba/smear-cursor.nvim",

  opts = {
    -- Smear cursor when switching buffers
    smear_between_buffers = false,

    -- Smear cursor when moving within line or to neighbor lines
    -- smear_between_neighbor_lines = true,

    -- Use floating windows to display smears outside buffers.
    -- May have performance issues with other plugins.
    -- use_floating_windows = true,

    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    -- legacy_computing_symbols_support = false,

    -- Attempt to hide the real cursor when smearing.
    -- hide_target_hack = true,
  },
}
