return {
  config = function()
    -- Skip lazy.nvim require().
  end,
  _ = {
    on_lspconfig_load = function()
      local cmp = require("cmp")
      local compare = require('cmp.config.compare')
      local lspkind_symbols = require("plugins._lspkind_symbols")._

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
            -- require("luasnip").lsp_expand(args.body)
            -- vim.fn["UltiSnips#Anon"](args.body)
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
            -- compare.recently_used,
            -- compare.score,
            compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        sources = {
          -- { name = "codeium" },
          { name = "copilot" },
          { name = "nvim_lsp", max_item_count = 30 },
          { name = "path" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "vsnip" },
          { name = "latex_symbols" },
          { name = "tmux" },
          -- { name = "treesitter" },
          -- { name = "cmp_tabnine" },
          -- { name = "tags" },
          -- { name = "luasnip" },
          -- { name = "ultisnips" },
          -- { name = "zsh" },
          -- { name = "pandoc_references" },
          -- { name = "dictionary", keyword_length = 2 },
          -- { name = "look", keyword_length = 2 },
          -- { name = "nuspell" },
          -- { name = "spell" },
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

      _G.cmp_was_setup_first = true

      -- if _G.plugin_loaded("nvim-autopairs") then
      --   local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      --   cmp.event:on(
      --     "confirm_done",
      --     cmp_autopairs.on_confirm_done {
      --       map_char = {
      --         tex = "",
      --       },
      --     }
      --   )
      -- end
    end,
  },
}
