vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost **/nvim/lua/plugins/init.lua PackerCompile]]

local packer = require("packer")
local util = require("packer.util")

local function packer_spec()
  local use = use;

  -- Plugin manager
  use {"wbthomason/"        .. "packer.nvim", opt = true}

  -- Performance
  use {"lewis6991/"         .. "impatient.nvim"         } -- cache lua modules

  -- Libraries
  use {"nvim-lua/"          .. "plenary.nvim"           }
  use {"nvim-lua/"          .. "popup.nvim"             }
  use {"svermeulen/"        .. "vimpeccable"            } -- nvim lua config
  use {"tpope/"             .. "vim-repeat"             } -- repairs .
  use {"tami5/"             .. "sqlite.lua"             } -- sql

  -- Functional
  use {"windwp/"            .. "nvim-autopairs"         } -- auto-pairs
--use {"ThePrimeagen/"      .. "harpoon"                } -- bookmarks
--use {"brandoncc/"         .. "telescope-harpoon.nvim" } -- bookmarks
  use {"tpope/"             .. "vim-surround"           } -- change surrounding
--use {"9mm/"               .. "vim-closer"             } -- closes brackets
  use {"b3nj5m1n/"          .. "kommentary"             } -- commenting
  use {"ggandor/"           .. "lightspeed.nvim"        } -- motion
--use {"junegunn/"          .. "fzf.vim"                } -- search
--use {"tweekmonster/"      .. "fzf-filemru"            } -- search
--use {"vijaymarupudi/"     .. "nvim-fzf"               } -- search
  use {"camspiers/"         .. "snap", rocks = {"fzy"}  } -- search
--use {"SirVer/"            .. "ultisnips"              } -- snippets (engine)
  use {"hrsh7th/"           .. "vim-vsnip"              } -- snippets (engine)
--use {"L3MON4D3/"          .. "LuaSnip"                } -- snippets (engine)
--use {"SirVer/"            .. "ultisnips"              } -- snippets (engine)
  use {"rafamadriz/"        .. "friendly-snippets"      } -- snippets (snippets)
--use {"honza/"             .. "vim-snippets"           } -- snippets (snippets)
  use {"wellle/"            .. "targets.vim"            } -- text objects
  use {"tpope/"             .. "vim-eunuch"             } -- unix mv/rm/rename
  use {"nelstrom/"          .. "vim-visual-star-search" } -- visual mode *

  -- Telescope
  use {"nvim-telescope/"    .. "telescope.nvim"         }
--use {"nvim-telescope/"    .. "telescope-frecency.nvim",
--  config = function()
--    require("telescope").load_extension("frecency")
--  end,
--  requires = {"tami5/sqlite.lua"},
--}

  -- Tools
  use {"tpope/"             .. "vim-fugitive"           } -- git
  use {"sheerun/"           .. "vim-polyglot"           } -- language packs
  use {"lervag/"            .. "vimtex"                 } -- LaTeX
--use {"hrsh7th/"           .. "nvim-compe"             } -- LSP completion
  use {"neovim/"            .. "nvim-lspconfig"         } -- LSP config
--use {"ojroques/"          .. "nvim-lspfuzzy"          } -- LSP fzf
  use {"jpalardy/"          .. "vim-slime"              } -- REPL

  -- Coq
--use {"ms-jpq/"            .. "coq_nvim",
--  branch = "coq",
--}
--use {"ms-jpq/"            .. "coq.artifacts",
--  branch = "artifacts",
--}

  -- nvim-cmp
  use {"hrsh7th/"           .. "nvim-cmp"               } -- completion
  use {"hrsh7th/"           .. "cmp-buffer"             } -- source
--use {"uga-rosa/"          .. "cmp-dictionary"         } -- source
  use {"kdheepak/"          .. "cmp-latex-symbols"      } -- source
--use {"octaltree/"         .. "cmp-look"               } -- source
--use {"saadparwaiz1/"      .. "cmp_luasnip"            } -- source
--use {"f3fora/"            .. "cmp-nuspell"
--  rocks = { "lua-nuspell" },
--} -- source
  use {"hrsh7th/"           .. "cmp-nvim-lsp"           } -- source
--use {"quangnguyen30192/"  .. "cmp-nvim-tags"          } -- source
--use {"quangnguyen30192/"  .. "cmp-nvim-ultisnips"     } -- source
--use {"jc-doyle/"          .. "cmp-pandoc-reference"   } -- source
  use {"hrsh7th/"           .. "cmp-path"               } -- source
--use {"f3fora/"            .. "cmp-spell"              } -- source
  use {"ray-x/"             .. "cmp-treesitter"         } -- source
  use {"hrsh7th/"           .. "cmp-vsnip"              } -- source
  use {"tamago324/"         .. "cmp-zsh"                } -- source
  use {"andersevenrud/"     .. "compe-tmux",
    branch = "cmp",
  } -- source

  -- Treesitter
  use {"nvim-treesitter/"   .. "nvim-treesitter",
    run = ":TSUpdate",
    commit = "c6d46504ba72a25b41a74397b1728a3677f8bb89",
  }
  use {"nvim-treesitter/"   .. "nvim-treesitter-textobjects",
    commit = "7c6b5fe0926f52854f193d058cd98d2e74c3d483",
  }

  -- Tweaks
  use {"editorconfig/"      .. "editorconfig-vim"       } -- editorconfig
  use {"farmergreg/"        .. "vim-lastplace"          } -- remember cursor

  -- Visual
  use {"lukas-reineke/"     .. "virt-column.nvim"       } -- colorcolumn line
--use {"mastertinner/"      .. "nvim-quantum"           } -- colorscheme
  use {"folke/"             .. "tokyonight.nvim"        } -- colorscheme
--use {"tyrannicaltoucan/"  .. "vim-quantum"            } -- colorscheme
--use {"romainl/"           .. "vim-cool"               } -- highlight smarter
  use {"bronson/"           .. "vim-trailing-whitespace"} -- hint whitespace
  use {"unblevable/"        .. "quick-scope"            } -- hint unique chars
  use {"lukas-reineke/"     .. "indent-blankline.nvim"  } -- indentation guides
  use {"onsails/"           .. "lspkind-nvim"           } -- LSP pictograms
--use {"ray-x/"             .. "lsp_signature.nvim"     } -- LSP signature
  use {"gennaro-tedesco/"   .. "nvim-peekup"            } -- register " preview
--use {"junegunn/"          .. "vim-peekaboo"           } -- register " preview
  use {"petertriho/"        .. "nvim-scrollbar"         } -- scrollbar
--use {"dstein64/"          .. "nvim-scrollview"        } -- scrollbar
  use {"lewis6991/"         .. "gitsigns.nvim"          } -- signs for git
  use {"kshenoy/"           .. "vim-signature"          } -- signs for marks
end

local compile_path = util.join_paths(
  vim.fn.stdpath("config"), "generated", "packer_compiled.vim"
)

local packer_config = {
  compile_path = compile_path,
}

packer.startup {
  packer_spec,
  config = packer_config
}

vim.cmd("source " .. compile_path)

function _G.plugin_loaded(plugin_name)
  local p = _G.packer_plugins
  return p ~= nil and p[plugin_name] ~= nil and p[plugin_name].loaded
end

require("plugins.init_require")
