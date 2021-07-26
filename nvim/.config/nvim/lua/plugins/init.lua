vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost **/nvim/lua/plugins/init.lua PackerCompile]]

local packer = require("packer")
local util = require("packer.util")

local function packer_spec()
  local use = use;

  -- Plugin manager
  use {"wbthomason/"        .. "packer.nvim", opt = true}

  -- Libraries
  use {"nvim-lua/"          .. "plenary.nvim"           }
  use {"nvim-lua/"          .. "popup.nvim"             }
  use {"svermeulen/"        .. "vimpeccable"            } -- nvim lua config
  use {"tpope/"             .. "vim-repeat"             } -- repairs .
  use {"tami5/"             .. "sql.nvim"               } -- sql

  -- Functional
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
  use {"SirVer/"            .. "ultisnips"              } -- snippets (engine)
  use {"honza/"             .. "vim-snippets"           } -- snippets (snippets)
  use {"wellle/"            .. "targets.vim"            } -- text objects
  use {"tpope/"             .. "vim-eunuch"             } -- unix mv/rm/rename
  use {"nelstrom/"          .. "vim-visual-star-search" } -- visual mode *

  -- Telescope
  use {"nvim-telescope/"    .. "telescope.nvim"         }
  use {"nvim-telescope/"    .. "telescope-frecency.nvim",
    config = function()
      require("telescope").load_extension("frecency")
    end,
  }

  -- Tools
  use {"tpope/"             .. "vim-fugitive"           } -- git
  use {"sheerun/"           .. "vim-polyglot"           } -- language packs
  use {"lervag/"            .. "vimtex"                 } -- LaTeX
  use {"hrsh7th/"           .. "nvim-compe"             } -- LSP completion
  use {"neovim/"            .. "nvim-lspconfig"         } -- LSP config
--use {"ojroques/"          .. "nvim-lspfuzzy"          } -- LSP fzf

  -- Treesitter
  use {"nvim-treesitter/"   .. "nvim-treesitter",
    branch = "0.5-compat",
    run = ":TSUpdate",
  }
  use {"nvim-treesitter/"   .. "nvim-treesitter-textobjects",
    branch = "0.5-compat",
  }

  -- Tweaks
  use {"editorconfig/"      .. "editorconfig-vim"       } -- editorconfig
  use {"farmergreg/"        .. "vim-lastplace"          } -- remember cursor

  -- Visual
  use {"folke/"             .. "tokyonight.nvim"        } -- colorscheme
  use {"tyrannicaltoucan/"  .. "vim-quantum"            } -- colorscheme
--use {"romainl/"           .. "vim-cool"               } -- highlight smarter
  use {"bronson/"           .. "vim-trailing-whitespace"} -- hint whitespace
  use {"unblevable/"        .. "quick-scope"            } -- hint unique chars
  use {"lukas-reineke/"     .. "indent-blankline.nvim"  } -- indentation guides
  use {"onsails/"           .. "lspkind-nvim"           } -- LSP pictograms
  use {"ray-x/"             .. "lsp_signature.nvim"     } -- LSP signature
--use {"junegunn/"          .. "vim-peekaboo"           } -- register " preview
  use {"dstein64/"          .. "nvim-scrollview"        } -- scrollbar
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
