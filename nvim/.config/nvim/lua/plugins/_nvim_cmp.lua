return {
  "hrsh7th/nvim-cmp",

  dependencies = {
    "hrsh7th/vim-vsnip", -- snippets (engine)
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-vsnip",
    "kdheepak/cmp-latex-symbols",
    "andersevenrud/cmp-tmux",
    "zbirenbaum/copilot-cmp",
  },

  config = function()
    -- Skip lazy.nvim require().
  end,

  _ = {
    on_lspconfig_load = function()
      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      local lspkind_symbols = require("utils.lspkind_symbols")._

      cmp.setup {
        experimental = {
          native_menu = false,
          -- NOTE: Ghost text disabled since copilot.lua already creates ghost text.
          -- ghost_text = true,
        },
        formatting = {
          fields = {
            "kind",
            "abbr",
            "menu",
          },
          format = function(entry, vim_item)
            local max_len = 40
            if string.len(vim_item.abbr) > max_len then
              vim_item.abbr = string.sub(vim_item.abbr, 1, max_len - 2) .. "··"
            end
            vim_item.kind = lspkind_symbols.kind_map[vim_item.kind]
            vim_item.menu = lspkind_symbols.source_map[entry.source.name]
            return vim_item
          end,
        },
        mapping = require("mappings._nvim_cmp"),
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sorting = {
          priority_weight = 2,
          comparators = {
            require("copilot_cmp.comparators").prioritize,
            compare.offset,
            compare.exact,
            compare.recently_used,
            compare.score,
            compare.scopes,
            compare.locality,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        sources = {
          { name = "copilot" },
          { name = "nvim_lsp", max_item_count = 128 },
          { name = "nvim_lsp_signature_help" },
          { name = "path" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "vsnip" },
          { name = "latex_symbols" },
          { name = "tmux" },
          { name = "lazydev", group_index = 0 },
        },
        window = {
          completion = {
            col_offset = -3,
          },
          documentation = {
            -- border = "single",
          },
        },
      }
    end,
  },
}
