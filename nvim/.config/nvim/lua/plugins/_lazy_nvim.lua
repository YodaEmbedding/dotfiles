local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath
  })
  vim.fn.system({ "git", "-C", lazypath, "checkout", "tags/stable" })
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
--{"antoinemadec/"      .. "FixCursorHold.nvim"     }, -- temporary workaround
  {"MunifTanjim/"       .. "nui.nvim"               }, -- UI component library

  -- Functional
--{"windwp/"            .. "nvim-autopairs"         }, -- auto-pairs
  {"tpope/"             .. "vim-surround"           }, -- change surrounding
  {"b3nj5m1n/"          .. "kommentary"             }, -- commenting
--{"ggandor/"           .. "leap.nvim"              }, -- motion
  {"ggandor/"           .. "lightspeed.nvim",          -- motion
    init = function()
      vim.g.lightspeed_no_default_keymaps = true
    end
  },
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
  {"prochri/"           .. "telescope-all-recent.nvim",
    dependencies = { "tami5/sqlite.lua", "nvim-telescope/telescope.nvim" },
  },
--{"nvim-telescope/"    .. "telescope-frecency.nvim",
--  dependencies = { "tami5/sqlite.lua" },
--},
--{"brandoncc/"         .. "telescope-harpoon.nvim" }, -- bookmarks

  -- Tools
--{"jcdickinson/"       .. "codeium.nvim"           }, -- AI completion
--{"github/"            .. "copilot.vim"            }, -- AI completion
  {"zbirenbaum/"        .. "copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  }, -- AI completion
  {"tpope/"             .. "vim-fugitive"           }, -- git
  {"lervag/"            .. "vimtex"                 }, -- LaTeX
  {"aznhe21/"           .. "actions-preview.nvim"   }, -- LSP code actions preview
  {"neovim/"            .. "nvim-lspconfig"         }, -- LSP config
  {"folke/"             .. "trouble.nvim"           }, -- LSP diagnostics list
--{"rmagatti/"          .. "goto-preview"           }, -- LSP goto preview
--{"williamboman/"      .. "nvim-lsp-installer"     }, -- LSP installer
  {"williamboman/"      .. "mason.nvim"             }, -- LSP installer
  {"williamboman/"      .. "mason-lspconfig.nvim"   }, -- LSP installer
--{"jpalardy/"          .. "vim-slime"              }, -- REPL
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
--{"hrsh7th/"           .. "cmp-copilot"            },
  {"kdheepak/"          .. "cmp-latex-symbols"      },
  {"hrsh7th/"           .. "cmp-nvim-lsp"           },
  {"hrsh7th/"           .. "cmp-path"               },
  {"andersevenrud/"     .. "cmp-tmux"               },
  {"ray-x/"             .. "cmp-treesitter"         },
  {"hrsh7th/"           .. "cmp-vsnip"              },
  {"tamago324/"         .. "cmp-zsh"                },
  {"zbirenbaum/"        .. "copilot-cmp",
    dependencies = {"zbirenbaum/copilot.lua" },
    -- event = "InsertEnter",
  },
--{"uga-rosa/"          .. "cmp-dictionary"         },
--{"octaltree/"         .. "cmp-look"               },
--{"saadparwaiz1/"      .. "cmp_luasnip"            },
--{"f3fora/"            .. "cmp-nuspell"              -- source
--  rocks = { "lua-nuspell" },
--},
--{"quangnguyen30192/"  .. "cmp-nvim-tags"          },
--{"quangnguyen30192/"  .. "cmp-nvim-ultisnips"     },
--{"jc-doyle/"          .. "cmp-pandoc-reference"   },
--{"f3fora/"            .. "cmp-spell"              },

  -- Treesitter
  {"nvim-treesitter/"   .. "nvim-treesitter",
    build = ":TSUpdate",
  },
  {"nvim-treesitter/"   .. "nvim-treesitter-textobjects",
  },

  -- Tweaks
  {"farmergreg/"        .. "vim-lastplace"          }, -- remember cursor

  -- Visual
--{"xiyaowong/"         .. "nvim-transparent"       }, -- background transparency
--{"kosayoda/"          .. "nvim-lightbulb"         }, -- code actions; deps = FixCursorHold.nvim
  {"lukas-reineke/"     .. "virt-column.nvim"       }, -- colorcolumn line
  {"folke/"             .. "tokyonight.nvim"        }, -- colorscheme
--{"Mofiqul/"           .. "trld.nvim"              }, -- diagnostics corner
  {"bronson/"           .. "vim-trailing-whitespace"}, -- hint whitespace
  {"unblevable/"        .. "quick-scope"            }, -- hint unique chars
  {"nvim-tree/"         .. "nvim-web-devicons"      }, -- icons
  {"lukas-reineke/"     .. "indent-blankline.nvim"  }, -- indentation guides
  {"onsails/"           .. "lspkind-nvim"           }, -- LSP pictograms
--{"gennaro-tedesco/"   .. "nvim-peekup"            }, -- register " preview
--{"folke/"             .. "drop.nvim",                -- screensaver (e.g. falling snow)
--  event = "VimEnter",
--},
  {"petertriho/"        .. "nvim-scrollbar"         }, -- scrollbar
  {"lewis6991/"         .. "gitsigns.nvim"          }, -- signs for git
  {"kshenoy/"           .. "vim-signature"          }, -- signs for marks
  {"goolord/"           .. "alpha-nvim",               -- startup screen
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {"nvim-neo-tree/"     .. "neo-tree.nvim",            -- tree; deps: nui.nvim, plenary.nvim
    branch = "v2.x",
  },
--{"mastertinner/"      .. "nvim-quantum"           }, -- colorscheme
--{"tyrannicaltoucan/"  .. "vim-quantum"            }, -- colorscheme
--{"romainl/"           .. "vim-cool"               }, -- highlight smarter
--{"ray-x/"             .. "lsp_signature.nvim"     }, -- LSP signature
--{"junegunn/"          .. "vim-peekaboo"           }, -- register " preview
--{"dstein64/"          .. "nvim-scrollview"        }, -- scrollbar

}

local opts = {
  defaults = {
    version = "*",
  },
}

local plugin_names = {}

local exclude_list = {
  "nvim-cmp",
}

for i, plugin_spec in ipairs(plugins) do
  local short_url = plugin_spec[1]
  local plugin_name = string.match(short_url, "^[^/]*/(.*)$")
  table.insert(plugin_names, plugin_name)
  local plugin_name_slug = string.gsub(plugin_name, "[-\\.]", "_")
  local config_path = "plugins._" .. plugin_name_slug
  plugin_spec["config"] = function()
    if vim.tbl_contains(exclude_list, plugin_name) then
      return
    end
    pcall(require, config_path)
  end
end

function _G.plugin_loaded(plugin_name)
  return vim.tbl_contains(plugin_names, plugin_name)
end

require("lazy").setup(plugins, opts)
