---@format disable-next
return {

  -- Libraries
  "nvim-lua/"          .. "plenary.nvim"           ,
  "nvim-lua/"          .. "popup.nvim"             ,
  "svermeulen/"        .. "vimpeccable"            , -- nvim lua config
  "tpope/"             .. "vim-repeat"             , -- repairs .
  "tami5/"             .. "sqlite.lua"             , -- sql
  "MunifTanjim/"       .. "nui.nvim"               , -- UI component library

  -- Functional
  "tpope/"             .. "vim-surround"           , -- change surrounding
  "b3nj5m1n/"          .. "kommentary"             , -- commenting
  "ggandor/"           .. "leap.nvim"              , -- motion
--"ggandor/"           .. "lightspeed.nvim",       , -- motion
  "farmergreg/"        .. "vim-lastplace"          , -- remember cursor
  "camspiers/"         .. "snap"                   , -- search
  "hrsh7th/"           .. "vim-vsnip"              , -- snippets (engine)
  "rafamadriz/"        .. "friendly-snippets"      , -- snippets (snippets)
  "wellle/"            .. "targets.vim"            , -- text objects
  "tpope/"             .. "vim-eunuch"             , -- unix mv/rm/rename
  "nelstrom/"          .. "vim-visual-star-search" , -- visual mode *

  -- Telescope
  "nvim-telescope/"    .. "telescope.nvim"         ,
  "prochri/"           .. "telescope-all-recent.nvim",

  -- Tools
  "zbirenbaum/"        .. "copilot.lua"            , -- AI completion
  "tpope/"             .. "vim-fugitive"           , -- git
  "lervag/"            .. "vimtex"                 , -- LaTeX
  "aznhe21/"           .. "actions-preview.nvim"   , -- LSP code actions preview
  "neovim/"            .. "nvim-lspconfig"         , -- LSP config
  "folke/"             .. "trouble.nvim"           , -- LSP diagnostics list
  "williamboman/"      .. "mason.nvim"             , -- LSP installer
  "williamboman/"      .. "mason-lspconfig.nvim"   , -- LSP installer
  "folke/"             .. "neodev.nvim"            , -- LSP neovim dev

  -- nvim-cmp
  "hrsh7th/"           .. "nvim-cmp"               ,
  "hrsh7th/"           .. "cmp-buffer"             ,
  "kdheepak/"          .. "cmp-latex-symbols"      ,
  "hrsh7th/"           .. "cmp-nvim-lsp"           ,
  "hrsh7th/"           .. "cmp-path"               ,
  "andersevenrud/"     .. "cmp-tmux"               ,
  "ray-x/"             .. "cmp-treesitter"         ,
  "hrsh7th/"           .. "cmp-vsnip"              ,
  "tamago324/"         .. "cmp-zsh"                ,
  "zbirenbaum/"        .. "copilot-cmp"            ,

  -- Treesitter
  "nvim-treesitter/"   .. "nvim-treesitter"        ,
  "nvim-treesitter/"   .. "nvim-treesitter-textobjects",

  -- Visual
  "lukas-reineke/"     .. "virt-column.nvim"       , -- colorcolumn line
  "bronson/"           .. "vim-trailing-whitespace", -- hint whitespace
  "unblevable/"        .. "quick-scope"            , -- hint unique chars
  "nvim-tree/"         .. "nvim-web-devicons"      , -- icons
  "lukas-reineke/"     .. "indent-blankline.nvim"  , -- indentation guides
  "onsails/"           .. "lspkind-nvim"           , -- LSP pictograms
  "SmiteshP/"          .. "nvim-navic"             , -- LSP winbar code context
  "petertriho/"        .. "nvim-scrollbar"         , -- scrollbar
  "lewis6991/"         .. "gitsigns.nvim"          , -- signs for git
  "kshenoy/"           .. "vim-signature"          , -- signs for marks
  "goolord/"           .. "alpha-nvim"             , -- startup screen
  "nvim-neo-tree/"     .. "neo-tree.nvim"          , -- tree

  -- Visual: Colorschemes
  "folke/"             .. "tokyonight.nvim"        ,
--"mastertinner/"      .. "nvim-quantum"           ,
--"tyrannicaltoucan/"  .. "vim-quantum"            ,


  -- OLD

  -- Plugin manager
--"wbthomason/"        .. "packer.nvim"            , -- package manager

  -- Performance
--"lewis6991/"         .. "impatient.nvim"         , -- cache lua modules
--"nathom/"            .. "filetype.nvim"          , -- lua filetype.vim

  -- Libraries
--"antoinemadec/"      .. "FixCursorHold.nvim"     , -- temporary workaround

  -- Functional
--"windwp/"            .. "nvim-autopairs"         , -- auto-pairs
--"ThePrimeagen/"      .. "harpoon"                , -- bookmarks
--"9mm/"               .. "vim-closer"             , -- closes brackets
--"junegunn/"          .. "fzf.vim"                , -- search
--"tweekmonster/"      .. "fzf-filemru"            , -- search
--"vijaymarupudi/"     .. "nvim-fzf"               , -- search
--"SirVer/"            .. "ultisnips"              , -- snippets (engine)
--"L3MON4D3/"          .. "LuaSnip"                , -- snippets (engine)
--"SirVer/"            .. "ultisnips"              , -- snippets (engine)
--"honza/"             .. "vim-snippets"           , -- snippets (snippets)

  -- Telescope
--"nvim-telescope/"    .. "telescope-frecency.nvim",
--"brandoncc/"         .. "telescope-harpoon.nvim" , -- bookmarks

  -- Tools
--"jcdickinson/"       .. "codeium.nvim"           , -- AI completion
--"github/"            .. "copilot.vim"            , -- AI completion
--"sheerun/"           .. "vim-polyglot"           , -- language packs
--"hrsh7th/"           .. "nvim-compe"             , -- LSP completion
--"ojroques/"          .. "nvim-lspfuzzy"          , -- LSP fzf
--"rmagatti/"          .. "goto-preview"           , -- LSP goto preview
--"williamboman/"      .. "nvim-lsp-installer"     , -- LSP installer
--"jpalardy/"          .. "vim-slime"              , -- REPL

  -- nvim-cmp
--"hrsh7th/"           .. "cmp-copilot"            ,
--"uga-rosa/"          .. "cmp-dictionary"         ,
--"octaltree/"         .. "cmp-look"               ,
--"saadparwaiz1/"      .. "cmp_luasnip"            ,
--{"f3fora/"            .. "cmp-nuspell"              -- source
--  rocks = { "lua-nuspell" },
--},
--"quangnguyen30192/"  .. "cmp-nvim-tags"          ,
--"quangnguyen30192/"  .. "cmp-nvim-ultisnips"     ,
--"jc-doyle/"          .. "cmp-pandoc-reference"   ,
--"f3fora/"            .. "cmp-spell"              ,

  -- Coq
--{"ms-jpq/"            .. "coq_nvim"               },
--{"ms-jpq/"            .. "coq.artifacts",
--  branch = "artifacts",
--},

  -- Visual
--"xiyaowong/"         .. "nvim-transparent"       , -- background transparency
--"kosayoda/"          .. "nvim-lightbulb"         , -- code actions
--"Mofiqul/"           .. "trld.nvim"              , -- diagnostics corner
--"romainl/"           .. "vim-cool"               , -- highlight smarter
--"ray-x/"             .. "lsp_signature.nvim"     , -- LSP signature
--"gennaro-tedesco/"   .. "nvim-peekup"            , -- register " preview
--"tversteeg/"         .. "registers.nvim"         , -- register " preview
--"junegunn/"          .. "vim-peekaboo"           , -- register " preview
--"dstein64/"          .. "nvim-scrollview"        , -- scrollbar
--"folke/"             .. "drop.nvim"              , -- screensaver (e.g. falling snow)

}
