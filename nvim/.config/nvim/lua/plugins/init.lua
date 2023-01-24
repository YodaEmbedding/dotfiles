---@format disable-next
_G.plugin_config_paths = {
  ["neoclide/"          .. "coc.nvim"               ] = "plugins._coc_nvim",
  ["hrsh7th/"           .. "nvim-compe"             ] = "plugins._compe",
  ["nvim-lua/"          .. "completion-nvim"        ] = "plugins._completion_nvim",
  ["ms-jpq/"            .. "coq_nvim"               ] = "plugins._coq_nvim",
  ["lewis6991/"         .. "gitsigns.nvim"          ] = "plugins._gitsigns",
  ["lukas-reineke/"     .. "indent-blankline.nvim"  ] = "plugins._indent_blankline_nvim",
  ["b3nj5m1n/"          .. "kommentary"             ] = "plugins._kommentary",
  ["ggandor/"           .. "leap.nvim"              ] = "plugins._leap_nvim",
  ["ggandor/"           .. "lightspeed.nvim"        ] = "plugins._lightspeed_nvim",
  ["neovim/"            .. "nvim-lspconfig"         ] = "plugins._lspconfig",
  ["ojroques/"          .. "nvim-lspfuzzy"          ] = "plugins._lspfuzzy",
  ["windwp/"            .. "nvim-autopairs"         ] = "plugins._nvim_autopairs",
  ["mastertinner/"      .. "nvim-quantum"           ] = "plugins._nvim_quantum",
  ["petertriho/"        .. "nvim-scrollbar"         ] = "plugins._nvim_scrollbar",
  ["dstein64/"          .. "nvim-scrollview"        ] = "plugins._nvim_scrollview",
  ["tomtom/"            .. "tcomment_vim"           ] = "plugins._tcomment_vim",
  ["nvim-telescope/"    .. "telescope.nvim"         ] = "plugins._telescope_nvim",
  ["nvim-treesitter/"   .. "nvim-treesitter"        ] = "plugins._treesitter",
  ["SirVer/"            .. "ultisnips"              ] = "plugins._ultisnips",
  ["ludovicchabant/"    .. "vim-gutentags"          ] = "plugins._vim_gutentags",
  ["junegunn/"          .. "vim-peekaboo"           ] = "plugins._vim_peekaboo",
  ["sheerun/"           .. "vim-polyglot"           ] = "plugins._vim_polyglot",
  ["jpalardy/"          .. "vim-slime"              ] = "plugins._vim_slime",
  ["hrsh7th/"           .. "vim-vsnip"              ] = "plugins._vim_vsnip",
  ["lervag/"            .. "vimtex"                 ] = "plugins._vimtex",
  ["lukas-reineke/"     .. "virt-column.nvim"       ] = "plugins._virt_column",
}

require("plugins._lazy")

do return end


require("plugins._packer")

require("plugins._impatient_nvim")
require("plugins._filetype_nvim")

require("plugins._coc_nvim")
require("plugins._compe")
require("plugins._completion_nvim")
require("plugins._coq_nvim")
require("plugins._gitsigns")
require("plugins._indent_blankline_nvim")
require("plugins._kommentary")
require("plugins._leap_nvim")
require("plugins._lightspeed_nvim")
require("plugins._lspconfig")
require("plugins._lspfuzzy")
require("plugins._nvim_autopairs")
require("plugins._nvim_quantum")
require("plugins._nvim_scrollbar")
require("plugins._nvim_scrollview")
require("plugins._tcomment_vim")
require("plugins._telescope_nvim")
require("plugins._treesitter")
require("plugins._ultisnips")
require("plugins._vim_gutentags")
require("plugins._vim_peekaboo")
require("plugins._vim_polyglot")
require("plugins._vim_slime")
require("plugins._vim_vsnip")
require("plugins._vimtex")
require("plugins._virt_column")
