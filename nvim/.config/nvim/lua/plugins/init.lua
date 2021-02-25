vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost **/nvim/lua/plugins/init.lua PackerCompile]]

local packer = require("packer")
local util = require("packer.util")

function packer_spec()
  -- Plugin manager
  use {"wbthomason/"        .. "packer.nvim", opt = true}

  -- Libraries
  use {"nvim-lua/"          .. "plenary.nvim"           }
  use {"svermeulen/"        .. "vimpeccable"            } -- nvim lua config
  use {"tpope/"             .. "vim-repeat"             } -- repairs .

  -- Functional
  use {"tpope/"             .. "vim-surround"           } -- change surrounding
--use {"9mm/"               .. "vim-closer"             } -- closes brackets
  use {"b3nj5m1n/"          .. "kommentary"             } -- commenting
  use {"junegunn/"          .. "fzf.vim"                } -- search
  use {"tweekmonster/"      .. "fzf-filemru"            } -- search
--use {"vijaymarupudi/"     .. "nvim-fzf"               } -- search
--use {"nvim-telescope/"    .. "telescope.nvim"         } -- search
  use {"SirVer/"            .. "ultisnips"              } -- snippets (engine)
  use {"honza/"             .. "vim-snippets"           } -- snippets (snippets)
  use {"wellle/"            .. "targets.vim"            } -- text objects
  use {"tpope/"             .. "vim-eunuch"             } -- unix mv/rm/rename
  use {"nelstrom/"          .. "vim-visual-star-search" } -- visual mode *

  -- Tools
  use {"sheerun/"           .. "vim-polyglot"           } -- language packs
  use {"lervag/"            .. "vimtex"                 } -- LaTeX
  use {"hrsh7th/"           .. "nvim-compe"             } -- LSP completion
  use {"neovim/"            .. "nvim-lspconfig"         } -- LSP config
  use {"ojroques/"          .. "nvim-lspfuzzy"          } -- LSP fzf

  -- Treesitter
  use {"nvim-treesitter/"   .. "nvim-treesitter", run = ":TSUpdate"}
  use {"nvim-treesitter/"   .. "nvim-treesitter-textobjects"}

  -- Tweaks
  use {"editorconfig/"      .. "editorconfig-vim"       } -- editorconfig
  use {"farmergreg/"        .. "vim-lastplace"          } -- remember cursor

  -- Visual
  use {"tyrannicaltoucan/"  .. "vim-quantum"            } -- colorscheme
  use {"bronson/"           .. "vim-trailing-whitespace"} -- hint whitespace
  use {"unblevable/"        .. "quick-scope"            } -- hint unique chars
  use {"junegunn/"          .. "vim-peekaboo"           } -- register " preview
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
