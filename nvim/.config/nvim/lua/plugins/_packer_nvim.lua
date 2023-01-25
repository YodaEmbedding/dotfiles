vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost **/nvim/lua/plugins/init.lua PackerCompile]]

local packer = require("packer")
local util = require("packer.util")

---@format disable-next
local plugins = {
  -- Plugin manager
  {"wbthomason/"        .. "packer.nvim", opt = true},

  -- Performance
  {"lewis6991/"         .. "impatient.nvim"         }, -- cache lua modules
  {"nathom/"            .. "filetype.nvim"          }, -- lua filetype.vim

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
  {"ggandor/"           .. "lightspeed.nvim",          -- motion
    setup = function()
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
--{"f3fora/"            .. "cmp-nuspell"              -- source
--  rocks = { "lua-nuspell" },
--},
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

local plugin_names = {}

for i, plugin_spec in ipairs(plugins) do
  local short_url = plugin_spec[1]
  local plugin_name = string.match(short_url, "^[^/]*/(.*)$")
  table.insert(plugin_names, plugin_name)
  local plugin_name_slug = string.gsub(plugin_name, "[-\\.]", "_")
  local config_path = "plugins._" .. plugin_name_slug

  if plugin_name ~= "packer.nvim" then
    -- Closures don't work, see:
    -- https://github.com/wbthomason/packer.nvim/issues/655
    --
    -- plugin_spec["config"] = function()
    --   pcall(require, config_path)
    -- end

    -- Workaround:
    -- WARNING: Holy string injection attack!
    -- plugin_spec["config"] = "pcall(require, '" .. config_path .. "' )"

    -- Workaround:
    -- https://github.com/wbthomason/packer.nvim/pull/402
    plugin_spec["config"] = function(plugin_name, plugin)
      local plugin_name_slug = string.gsub(plugin_name, "[-\\.]", "_")
      local config_path = "plugins._" .. plugin_name_slug
      pcall(require, config_path)
    end
  end
end

function _G.plugin_loaded(plugin_name)
  local p = _G.packer_plugins
  return p ~= nil and p[plugin_name] ~= nil and p[plugin_name].loaded
end

local function packer_spec()
  local use = use;
  for _, plugin_spec in ipairs(plugins) do
    use(plugin_spec)
  end
end

local compile_path = util.join_paths(
  vim.fn.stdpath("config"), "generated", "packer_compiled.vim"
)

packer.startup {
  packer_spec,
  config = {
    compile_path = compile_path,
    -- snapshot = util.join_paths(vim.fn.stdpath("config"), "packer-lock.json"),
    -- snapshot_path = vim.fn.stdpath("config"),
  },
}

vim.cmd("source " .. compile_path)
