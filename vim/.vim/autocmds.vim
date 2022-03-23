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

" Miscellaneous: Check up to date plugins
autocmd VimEnter * call CheckForUpdates()

" Plugin: coc.nvim
if PlugLoaded('coc.nvim')
    set updatetime=50
    autocmd CursorHold * silent     call CocActionAsync('highlight')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    " autocmd FileType python let b:coc_root_patterns = ['.env', '.git']
endif
