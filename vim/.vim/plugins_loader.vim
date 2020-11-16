" Installation {{{1
if has('nvim')
    if has('win32') | let plug_path = expand('~/AppData/Local/nvim/autoload/plug.vim')
    else            | let plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
    endif
else
    if has('win32') | let plug_path = expand('~/vimfiles/autoload/plug.vim')
    else            | let plug_path = expand('~/.vim/autoload/plug.vim')
    endif
endif

if empty(glob(plug_path))
    let plug_remote = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    silent execute "!curl -fLo " . plug_path . " --create-dirs " . plug_remote
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif


" Begin {{{1
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif


" Check if plugin loaded {{{1
function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&runtimepath, trim(g:plugs[a:name].dir, "/")) >= 0)
endfunction


" Load plugins {{{1
source ~/.vim/plugins.vim


" End {{{1
call plug#end()
