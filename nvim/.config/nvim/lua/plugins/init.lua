vim.cmd [[packadd packer.nvim]]
vim.cmd [[autocmd BufWritePost plugins.lua PackerCompile]]

local packer = require("packer")
local util = require("packer.util")

function packer_spec()
  use {"wbthomason/"        .. "packer.nvim", opt = true} -- Plugin manager

  use {"nvim-lua/"          .. "plenary.nvim"           } -- Library

  use {"tpope/"             .. "vim-surround"           } -- Functional: Change surrounding parenthesis, e.g. cs([
  use {"b3nj5m1n/"          .. "kommentary"             } -- Functional: Commenting
  use {"tpope/"             .. "vim-repeat"             } -- Functional: Repairs dot key for certain plugins (e.g. vim-sneak)
  use {"junegunn/"          .. "fzf.vim"                } -- Functional: Search
  use {"tweekmonster/"      .. "fzf-filemru"            } -- Functional: Search (MRU)
  use {"nelstrom/"          .. "vim-visual-star-search" } -- Functional: Select visually then *
  use {"SirVer/"            .. "ultisnips"              } -- Functional: Snippets (engine)
  use {"honza/"             .. "vim-snippets"           } -- Functional: Snippets (snippets)
  use {"wellle/"            .. "targets.vim"            } -- Functional: Text objects
  use {"bps/"               .. "vim-textobj-python"     } -- Functional: Text objects
  use {"kana/"              .. "vim-textobj-user"       } -- Functional: Text objects
  use {"sheerun/"           .. "vim-polyglot"           } -- Miscellaneous: Language pack
  use {"lervag/"            .. "vimtex"                 } -- Tools: LaTeX
  use {"tpope/"             .. "vim-eunuch"             } -- Tools: UNIX sugars on mv, rm, rename, ...
  use {"editorconfig/"      .. "editorconfig-vim"       } -- Tweak: Apply .editorconfig settings
  use {"farmergreg/"        .. "vim-lastplace"          } -- Tweak: Reopen file last position
  use {"tyrannicaltoucan/"  .. "vim-quantum"            } -- Visual: Colorscheme
  use {"lewis6991/"         .. "gitsigns.nvim"          } -- Visual: Git gutter
  use {"bronson/"           .. "vim-trailing-whitespace"} -- Visual: Highlight trailing and :FixWhitespace
  use {"unblevable/"        .. "quick-scope"            } -- Visual: Highlight unique characters per word in line (for find)
  use {"kshenoy/"           .. "vim-signature"          } -- Visual: Mark navigation
  use {"dstein64/"          .. "nvim-scrollview"        } -- Visual: Scrollbar
  use {"junegunn/"          .. "vim-peekaboo"           } -- Visual: Show registers during \", @, and <C-R>

  use {"svermeulen/"        .. "vimpeccable"            } -- Miscellaneous: nvim lua config

  use {"nvim-lua/"          .. "completion-nvim"        } -- Tools: LSP completion
  use {"neovim/"            .. "nvim-lspconfig"         } -- Tools: LSP config
  use {"ojroques/"          .. "nvim-lspfuzzy"          } -- Tools: LSP FZF
  -- use {"nvim-treesitter/"   .. "nvim-treesitter"        } -- Tools: Language
  -- use {"nvim-telescope/"    .. "telescope.nvim"         } -- Functional: Search
  -- use {"vijaymarupudi/"     .. "nvim-fzf"               } -- Functional: Search

  -- use "9mm/vim-closer"
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

require("plugins.init_require")
