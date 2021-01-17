local vimp = require("vimp")

local nnoremap = vimp.nnoremap

nnoremap("<Tab>", ":Buffers<CR>")
nnoremap(",", ":SmartFiles<CR>")
nnoremap("<Leader>s", ":LocateFiles .<CR>")
nnoremap("<Leader>f", ":FilesMru<CR>")
nnoremap("<Leader>F", ":Files %:h<CR>")
nnoremap("<Leader>g", ":GFiles --cached --others --exclude-standard<CR>")
nnoremap("<Leader>h", ":History<CR>")
nnoremap("<Leader>l", ":Lines<CR>")
nnoremap("<Leader>ag", ":Ag!<CR>")
nnoremap("<Leader>rg", ":Rg!<CR>")
nnoremap("<Leader>m", ":Marks<CR>")
nnoremap("<Leader>t", ":Tags<CR>")
nnoremap("gl", ":Rg<CR>")
