vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
  use {"wbthomason/"        .. "packer.nvim", opt = true} -- Plugin manager

  use {"tpope/"             .. "vim-surround"           } -- Functional: Change surrounding parenthesis, e.g. cs([
  use {"tomtom/"            .. "tcomment_vim"           } -- Functional: Commenting
  use {"tpope/"             .. "vim-repeat"             } -- Functional: Repairs dot key for certain plugins (e.g. vim-sneak)
  use {"junegunn/"          .. "fzf",                     -- Functional: Search
    run = vim.fn["fzf#install"],
  }
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
  use {"airblade/"          .. "vim-gitgutter"          } -- Visual: Git gutter
  use {"bronson/"           .. "vim-trailing-whitespace"} -- Visual: Highlight trailing and :FixWhitespace
  use {"unblevable/"        .. "quick-scope"            } -- Visual: Highlight unique characters per word in line (for find)
  use {"kshenoy/"           .. "vim-signature"          } -- Visual: Mark navigation
  use {"dstein64/"          .. "nvim-scrollview"        } -- Visual: Scrollbar
  use {"junegunn/"          .. "vim-peekaboo"           } -- Visual: Show registers during \", @, and <C-R>

  use {"neoclide/"          .. "coc.nvim",                -- Tools: LSP
    branch = "release",
  }

  use {"svermeulen/"        .. "vimpeccable"            } -- Miscellaneous: nvim lua config

  -- use {"nvim-lua/"          .. "completion-nvim"        } -- Tools: LSP completion
  -- use {"neovim/"            .. "nvim-lspconfig"         } -- Tools: LSP
  -- use {"ojroques/"          .. "nvim-lspfuzzy"          } -- Tools: LSP FZF

  -- use {"nvim-telescope/"    .. "telescope.nvim"         } -- Functional: Search
  -- use {"vijaymarupudi/"     .. "nvim-fzf"               } -- Functional: Search

  -- use {"nvim-treesitter/"   .. "nvim-treesitter"        } -- Tools: Language
  -- use {"shougo/"            .. "deoplete-lsp"           }
  -- use {"shougo/"            .. "deoplete.nvim",
  --   run = fn["remote#host#UpdateRemotePlugins"],
  -- }

  -- use "9mm/vim-closer"
end)
