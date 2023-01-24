---@format disable-next
_G.plugin_config_paths = {
  ["neoclide/"          .. "coc.nvim"               ] = "plugins._coc_nvim",
  ["nvim-lua/"          .. "completion-nvim"        ] = "plugins._completion_nvim",
  ["ms-jpq/"            .. "coq_nvim"               ] = "plugins._coq_nvim",
  ["lewis6991/"         .. "gitsigns.nvim"          ] = "plugins._gitsigns_nvim",
  ["lukas-reineke/"     .. "indent-blankline.nvim"  ] = "plugins._indent_blankline_nvim",
  ["b3nj5m1n/"          .. "kommentary"             ] = "plugins._kommentary",
  ["ggandor/"           .. "leap.nvim"              ] = "plugins._leap_nvim",
  ["ggandor/"           .. "lightspeed.nvim"        ] = "plugins._lightspeed_nvim",
  ["windwp/"            .. "nvim-autopairs"         ] = "plugins._nvim_autopairs",
  ["hrsh7th/"           .. "nvim-compe"             ] = "plugins._nvim_compe",
  ["neovim/"            .. "nvim-lspconfig"         ] = "plugins._nvim_lspconfig",
  ["ojroques/"          .. "nvim-lspfuzzy"          ] = "plugins._nvim_lspfuzzy",
  ["mastertinner/"      .. "nvim-quantum"           ] = "plugins._nvim_quantum",
  ["petertriho/"        .. "nvim-scrollbar"         ] = "plugins._nvim_scrollbar",
  ["dstein64/"          .. "nvim-scrollview"        ] = "plugins._nvim_scrollview",
  ["nvim-treesitter/"   .. "nvim-treesitter"        ] = "plugins._nvim_treesitter",
  ["tomtom/"            .. "tcomment_vim"           ] = "plugins._tcomment_vim",
  ["nvim-telescope/"    .. "telescope.nvim"         ] = "plugins._telescope_nvim",
  ["SirVer/"            .. "ultisnips"              ] = "plugins._ultisnips",
  ["ludovicchabant/"    .. "vim-gutentags"          ] = "plugins._vim_gutentags",
  ["junegunn/"          .. "vim-peekaboo"           ] = "plugins._vim_peekaboo",
  ["sheerun/"           .. "vim-polyglot"           ] = "plugins._vim_polyglot",
  ["jpalardy/"          .. "vim-slime"              ] = "plugins._vim_slime",
  ["hrsh7th/"           .. "vim-vsnip"              ] = "plugins._vim_vsnip",
  ["lervag/"            .. "vimtex"                 ] = "plugins._vimtex",
  ["lukas-reineke/"     .. "virt-column.nvim"       ] = "plugins._virt_column_nvim",
}

require("plugins._lazy_nvim")

do return end


require("plugins._packer")

require("plugins._impatient_nvim")
require("plugins._filetype_nvim")

require("plugins._coc_nvim")
require("plugins._completion_nvim")
require("plugins._coq_nvim")
require("plugins._gitsigns_nvim")
require("plugins._indent_blankline_nvim")
require("plugins._kommentary")
require("plugins._leap_nvim")
require("plugins._lightspeed_nvim")
require("plugins._nvim_autopairs")
require("plugins._nvim_compe")
require("plugins._nvim_lspconfig")
require("plugins._nvim_lspfuzzy")
require("plugins._nvim_quantum")
require("plugins._nvim_scrollbar")
require("plugins._nvim_scrollview")
require("plugins._nvim_treesitter")
require("plugins._tcomment_vim")
require("plugins._telescope_nvim")
require("plugins._ultisnips")
require("plugins._vim_gutentags")
require("plugins._vim_peekaboo")
require("plugins._vim_polyglot")
require("plugins._vim_slime")
require("plugins._vim_vsnip")
require("plugins._vimtex")
require("plugins._virt_column_nvim")
