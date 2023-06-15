---@format disable-next
return {

  -- Plugin manager
  "wbthomason/"        .. "packer.nvim"            , -- package manager

  -- Performance
  "lewis6991/"         .. "impatient.nvim"         , -- cache lua modules
  "nathom/"            .. "filetype.nvim"          , -- lua filetype.vim

  -- Libraries
  "antoinemadec/"      .. "FixCursorHold.nvim"     , -- temporary workaround

  -- Functional
  "windwp/"            .. "nvim-autopairs"         , -- auto-pairs
  "ThePrimeagen/"      .. "harpoon"                , -- bookmarks
  "9mm/"               .. "vim-closer"             , -- closes brackets
  "ggandor/"           .. "lightspeed.nvim"        , -- motion
  "junegunn/"          .. "fzf.vim"                , -- search
  "tweekmonster/"      .. "fzf-filemru"            , -- search
  "vijaymarupudi/"     .. "nvim-fzf"               , -- search
  "SirVer/"            .. "ultisnips"              , -- snippets (engine)
  "L3MON4D3/"          .. "LuaSnip"                , -- snippets (engine)
  "SirVer/"            .. "ultisnips"              , -- snippets (engine)
  "honza/"             .. "vim-snippets"           , -- snippets (snippets)

  -- Telescope
  "nvim-telescope/"    .. "telescope-frecency.nvim",
  "brandoncc/"         .. "telescope-harpoon.nvim" , -- bookmarks

  -- Tools
  "jcdickinson/"       .. "codeium.nvim"           , -- AI completion
  "github/"            .. "copilot.vim"            , -- AI completion
  "sheerun/"           .. "vim-polyglot"           , -- language packs
  "jpalardy/"          .. "vim-slime"              , -- REPL

  -- Tools: LSP
  "hrsh7th/"           .. "nvim-compe"             , -- completion (deprecated)
  "ojroques/"          .. "nvim-lspfuzzy"          , -- fzf
  "rmagatti/"          .. "goto-preview"           , -- goto preview
  "williamboman/"      .. "nvim-lsp-installer"     , -- installer
  "ray-x/"             .. "lsp_signature.nvim"     , -- signature

  -- Completion: nvim-cmp
  "hrsh7th/"           .. "cmp-copilot"            ,
  "uga-rosa/"          .. "cmp-dictionary"         ,
  "octaltree/"         .. "cmp-look"               ,
  "saadparwaiz1/"      .. "cmp_luasnip"            ,
  "f3fora/"            .. "cmp-nuspell"            , -- rocks = { "lua-nuspell" },
  "quangnguyen30192/"  .. "cmp-nvim-tags"          ,
  "quangnguyen30192/"  .. "cmp-nvim-ultisnips"     ,
  "jc-doyle/"          .. "cmp-pandoc-reference"   ,
  "f3fora/"            .. "cmp-spell"              ,

  -- Completion: Coq
  "ms-jpq/"            .. "coq_nvim"               ,
  "ms-jpq/"            .. "coq.artifacts"          , -- branch = "artifacts",

  -- Visual
  "xiyaowong/"         .. "nvim-transparent"       , -- background transparency
  "kosayoda/"          .. "nvim-lightbulb"         , -- code actions
  "Mofiqul/"           .. "trld.nvim"              , -- diagnostics corner
  "romainl/"           .. "vim-cool"               , -- highlight smarter
  "gennaro-tedesco/"   .. "nvim-peekup"            , -- register " preview
  "tversteeg/"         .. "registers.nvim"         , -- register " preview
  "junegunn/"          .. "vim-peekaboo"           , -- register " preview
  "dstein64/"          .. "nvim-scrollview"        , -- scrollbar
  "folke/"             .. "drop.nvim"              , -- screensaver (e.g. falling snow)

  -- Visual: colorschemes
  "mastertinner/"      .. "nvim-quantum"           ,
  "tyrannicaltoucan/"  .. "vim-quantum"            ,

}
