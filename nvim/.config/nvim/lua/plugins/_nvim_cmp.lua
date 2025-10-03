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

      local function copilot_suggestion_accept()
        local copilot_suggestion = require("utils").try_require("copilot.suggestion")
        if copilot_suggestion and copilot_suggestion.is_visible() then
          copilot_suggestion.accept()
          return true
        else
          return false
        end
      end

      local complete = cmp.mapping.complete()

      local __confirm = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })

      local function confirm(fallback)
        -- if copilot_suggestion_accept() then
        --   return
        -- end
        if cmp.visible() then
          cmp.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          })
          -- cmp.complete()
        else
        end
      end

      -- i = insert, c = command, s = select
      local mappings = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        ["<C-Space>"] = cmp.mapping(copilot_suggestion_accept, { "i", "c" }),
        ["<C-c>"] = cmp.mapping(copilot_suggestion_accept, { "i", "c" }),
        ["<C-x>"] = cmp.mapping(complete, { "i", "c" }),
        ["<C-e>"] = cmp.mapping(confirm, { "i", "s" }),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<PageUp>"] = function(fallback)
          for i = 1, 8 do
            cmp.mapping.select_prev_item()(nil)
          end
        end,
        ["<PageDown>"] = function(fallback)
          for i = 1, 8 do
            cmp.mapping.select_next_item()(nil)
          end
        end,
      }

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
        mapping = mappings,
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

      cmp.setup.filetype("namu_prompt", { enabled = false })
      cmp.setup.filetype("namu_sidebar", { enabled = false })
    end,
  },
}
