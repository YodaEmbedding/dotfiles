local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

---@format disable-next
local plugins = {
  -- Plugin manager
--use {"wbthomason/"        .. "packer.nvim", opt = true}

  -- Performance
--{"lewis6991/"         .. "impatient.nvim"         }, -- cache lua modules
--{"nathom/"            .. "filetype.nvim"          }, -- lua filetype.vim

  -- Libraries
  {"nvim-lua/"          .. "plenary.nvim"           },
  {"nvim-lua/"          .. "popup.nvim"             },
  {"svermeulen/"        .. "vimpeccable"            }, -- nvim lua config
  {"tpope/"             .. "vim-repeat"             }, -- repairs .
  {"tami5/"             .. "sqlite.lua"             }, -- sql

  -- Functional
  {"windwp/"            .. "nvim-autopairs"         }, -- auto-pairs
  {"tpope/"             .. "vim-surround"           }, -- change surrounding
  {"b3nj5m1n/"          .. "kommentary"             }, -- commenting
--{"ggandor/"           .. "leap.nvim"              }, -- motion
  {"ggandor/"           .. "lightspeed.nvim"        }, -- motion
  {"camspiers/"         .. "snap", rocks = {"fzy"}  }, -- search
  {"hrsh7th/"           .. "vim-vsnip"              }, -- snippets (engine)
  {"rafamadriz/"        .. "friendly-snippets"      }, -- snippets (snippets)
  {"wellle/"            .. "targets.vim"            }, -- text objects
  {"tpope/"             .. "vim-eunuch"             }, -- unix mv/rm/rename
  {"nelstrom/"          .. "vim-visual-star-search" }, -- visual mode *
--{"ThePrimeagen/"      .. "harpoon"                }, -- bookmarks
--{"9mm/"               .. "vim-closer"             }, -- closes brackets
--{"junegunn/"          .. "fzf.vim"                }, -- search
--{"tweekmonster/"      .. "fzf-filemru"            }, -- search
--{"vijaymarupudi/"     .. "nvim-fzf"               }, -- search
--{"SirVer/"            .. "ultisnips"              }, -- snippets (engine)
--{"L3MON4D3/"          .. "LuaSnip"                }, -- snippets (engine)
--{"SirVer/"            .. "ultisnips"              }, -- snippets (engine)
--{"honza/"             .. "vim-snippets"           }, -- snippets (snippets)

  -- Telescope
  {"nvim-telescope/"    .. "telescope.nvim"         },
--{"nvim-telescope/"    .. "telescope-frecency.nvim",
--  config = function()
--    require("telescope").load_extension("frecency")
--  end,
--  requires = {"tami5/sqlite.lua"},
--},
--{"brandoncc/"         .. "telescope-harpoon.nvim" }, -- bookmarks

  -- Tools
  {"tpope/"             .. "vim-fugitive"           }, -- git
  {"lervag/"            .. "vimtex"                 }, -- LaTeX
  {"neovim/"            .. "nvim-lspconfig"         }, -- LSP config
  {"williamboman/"      .. "nvim-lsp-installer"     }, -- LSP installer
  {"jpalardy/"          .. "vim-slime"              }, -- REPL
--{"sheerun/"           .. "vim-polyglot"           }, -- language packs
--{"hrsh7th/"           .. "nvim-compe"             }, -- LSP completion
--{"ojroques/"          .. "nvim-lspfuzzy"          }, -- LSP fzf

  -- Coq
--{"ms-jpq/"            .. "coq_nvim",
--  branch = "coq",
--},
--{"ms-jpq/"            .. "coq.artifacts",
--  branch = "artifacts",
--},

  -- nvim-cmp
  {"hrsh7th/"           .. "nvim-cmp"               },
  {"hrsh7th/"           .. "cmp-buffer"             },
  {"kdheepak/"          .. "cmp-latex-symbols"      },
  {"hrsh7th/"           .. "cmp-nvim-lsp"           },
  {"hrsh7th/"           .. "cmp-path"               },
  {"andersevenrud/"     .. "cmp-tmux"               },
  {"ray-x/"             .. "cmp-treesitter"         },
  {"hrsh7th/"           .. "cmp-vsnip"              },
  {"tamago324/"         .. "cmp-zsh"                },
--{"uga-rosa/"          .. "cmp-dictionary"         },
--{"octaltree/"         .. "cmp-look"               },
--{"saadparwaiz1/"      .. "cmp_luasnip"            },
--{"f3fora/"            .. "cmp-nuspell"
--  rocks = { "lua-nuspell" },
--}, -- source
--{"quangnguyen30192/"  .. "cmp-nvim-tags"          },
--{"quangnguyen30192/"  .. "cmp-nvim-ultisnips"     },
--{"jc-doyle/"          .. "cmp-pandoc-reference"   },
--{"f3fora/"            .. "cmp-spell"              },

  -- Treesitter
  {"nvim-treesitter/"   .. "nvim-treesitter",
    run = ":TSUpdate",
    -- commit = "c6d46504ba72a25b41a74397b1728a3677f8bb89",
  },
  {"nvim-treesitter/"   .. "nvim-treesitter-textobjects",
    -- commit = "7c6b5fe0926f52854f193d058cd98d2e74c3d483",
  },

  -- Tweaks
  {"editorconfig/"      .. "editorconfig-vim"       }, -- editorconfig
  {"farmergreg/"        .. "vim-lastplace"          }, -- remember cursor

  -- Visual
  {"lukas-reineke/"     .. "virt-column.nvim"       }, -- colorcolumn line
  {"folke/"             .. "tokyonight.nvim"        }, -- colorscheme
  {"Mofiqul/"           .. "trld.nvim"              }, -- diagnostics corner
  {"bronson/"           .. "vim-trailing-whitespace"}, -- hint whitespace
  {"unblevable/"        .. "quick-scope"            }, -- hint unique chars
  {"lukas-reineke/"     .. "indent-blankline.nvim"  }, -- indentation guides
  {"onsails/"           .. "lspkind-nvim"           }, -- LSP pictograms
  {"gennaro-tedesco/"   .. "nvim-peekup"            }, -- register " preview
  {"petertriho/"        .. "nvim-scrollbar"         }, -- scrollbar
  {"lewis6991/"         .. "gitsigns.nvim"          }, -- signs for git
  {"kshenoy/"           .. "vim-signature"          }, -- signs for marks
--{"mastertinner/"      .. "nvim-quantum"           }, -- colorscheme
--{"tyrannicaltoucan/"  .. "vim-quantum"            }, -- colorscheme
--{"romainl/"           .. "vim-cool"               }, -- highlight smarter
--{"ray-x/"             .. "lsp_signature.nvim"     }, -- LSP signature
--{"junegunn/"          .. "vim-peekaboo"           }, -- register " preview
--{"dstein64/"          .. "nvim-scrollview"        }, -- scrollbar

}

for i, plugin_spec in ipairs(plugins) do
  local short_url = plugin_spec[1]
  if _G.plugin_config_paths[short_url] ~= nil then
    local config_path = _G.plugin_config_paths[short_url]
    plugin_spec["config"] = function()
      require(config_path)
    end
  end
end

local opts = {

}

-- TODO Reorganize to avoid this manual hack.
function _G.plugin_loaded(plugin_name)
  local exclude_list = {
    "coc.nvim",
    "completion-nvim",
    "coq",
    "coq_nvim",
    "fzf.vim",
    "harpoon",
    "lsp_signature.nvim",
    "nvim-compe",
    "nvim-quantum",
    "tcomment_vim",
    "telescope-harpoon.nvim",
    "vim-quantum",
  }
  if vim.tbl_contains(exclude_list, plugin_name) then
    return false
  end
  return true
end

vim.g.lightspeed_no_default_keymaps = true

require("lazy").setup(plugins, opts)
