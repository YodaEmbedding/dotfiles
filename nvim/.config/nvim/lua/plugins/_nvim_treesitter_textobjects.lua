-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  version = false,

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },

  config = function()
    require("nvim-treesitter-textobjects").setup {
      select = {
        lookahead = false,
        lookbehind = false,
        selection_modes = {},
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    }

    local function attach(buf)
      if not vim.api.nvim_buf_is_loaded(buf) then
        return
      end
      local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
      if not lang or not vim.treesitter.get_parser(buf, lang) then
        return
      end
      if not vim.treesitter.query.get(lang, "textobjects") then
        return
      end

      local function map(mode, key, callback)
        vim.keymap.set(mode, key, callback, { buffer = buf })
      end

      map({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end)
      map({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end)
      map({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end)
      map({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end)

      map("n", "g>>", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
      end)
      map("n", "g<<", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
      end)
      map("n", "g>f", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@function.outer")
      end)
      map("n", "g<f", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@function.outer")
      end)
      map("n", "g>c", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@class.outer")
      end)
      map("n", "g<c", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@class.outer")
      end)

      map({ "n", "x", "o" }, "]m", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "]]", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "]M", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "][", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[m", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[[", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[M", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[]", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
      end)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("DotfilesTreesitterTextobjects", { clear = true }),
      callback = function(event)
        -- Buffer-local mappings take precedence after built-in ftplugins run.
        vim.schedule(function()
          attach(event.buf)
        end)
      end,
    })
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      vim.schedule(function()
        attach(buf)
      end)
    end
  end,
}
