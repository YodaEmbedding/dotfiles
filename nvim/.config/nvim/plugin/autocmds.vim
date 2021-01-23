" Buffer: Determine filetype based on path
autocmd BufRead,BufNewFile *.cls setlocal filetype=tex
autocmd BufRead,BufNewFile *.nxc setlocal filetype=cpp
autocmd BufRead,BufNewFile *rc setlocal filetype=config
autocmd BufRead,BufNewFile if empty(&filetype) | ~/.config/* setlocal filetype=config | endif
autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/*/.config/* setlocal filetype=config | endif
autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/bash/* setlocal filetype=zsh | endif
autocmd BufRead,BufNewFile if empty(&filetype) | ~/dotfiles/zsh/* setlocal filetype=zsh | endif

" Buffer: Disable continue comment on new line
autocmd BufRead,BufNewFile * setlocal formatoptions-=cro

" Miscellaneous: Auto close preview
autocmd InsertLeave * silent! pclose!

" Miscellaneous: Highlight on yank
autocmd TextYankPost * lua vim.highlight.on_yank {timeout=500}

" Plugin: coc.nvim
" set updatetime=50
" autocmd CursorHold * silent     call CocActionAsync('highlight')
" autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
