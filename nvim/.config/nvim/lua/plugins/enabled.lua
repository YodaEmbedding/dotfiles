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
  "kwkarlwang/"        .. "bufresize.nvim"         , -- maintain buffer sizes on terminal resize
  "ggandor/"           .. "leap.nvim"              , -- motion
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

  -- Tools: LSP
  "aznhe21/"           .. "actions-preview.nvim"   , -- code actions telescope
  "neovim/"            .. "nvim-lspconfig"         , -- config
  "folke/"             .. "trouble.nvim"           , -- diagnostics list
  "williamboman/"      .. "mason.nvim"             , -- installer
  "williamboman/"      .. "mason-lspconfig.nvim"   , -- installer
  "folke/"             .. "neodev.nvim"            , -- neovim dev
  "onsails/"           .. "lspkind-nvim"           , -- pictograms
  "utilyre/"           .. "barbecue.nvim"          , -- winbar code context
  "SmiteshP/"          .. "nvim-navic"             , -- winbar code context

  -- Completion: nvim-cmp
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
  "petertriho/"        .. "nvim-scrollbar"         , -- scrollbar
  "lewis6991/"         .. "gitsigns.nvim"          , -- signs for git
  "kshenoy/"           .. "vim-signature"          , -- signs for marks
  "goolord/"           .. "alpha-nvim"             , -- startup screen
  "nvim-neo-tree/"     .. "neo-tree.nvim"          , -- tree

  -- Visual: colorschemes
  "folke/"             .. "tokyonight.nvim"        ,

}
