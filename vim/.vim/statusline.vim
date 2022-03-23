if !exists("g:pluginUpdateStatus")
    let g:pluginUpdateStatus = ""
endif

set statusline=                                 " Clear
set statusline+=\                               " -
" set statusline+=%t                            " Tail of the filename
" set statusline+=\                             " -
" set statusline+=∈                             " ∈
" set statusline+=\                             " -
" set statusline+=%{expand('%:~:.:h')}          " Parents till cwd
set statusline+=%{expand('%:~:.')}              " Relative filepath
set statusline+=%h                              " Help file flag
set statusline+=%r                              " Read only flag
set statusline+=%m                              " Modified flag
set statusline+=%=                              " Left/right separator
set statusline+=\                               " -
set statusline+=%{g:pluginUpdateStatus}         " Up to date plugins
set statusline+=\ \                             " --
set statusline+=%{&filetype}                    " Filetype
set statusline+=\                               " -
set statusline+=%{&fenc}                        " File encoding
set statusline+=\                               " -
set statusline+=%{&ff}                          " File format
set statusline+=\                               " -
set statusline+=                                " Indent settings: begin
set statusline+=%{&expandtab?\"sp\":\"tab\"}-   " Indent settings
set statusline+=%{&shiftwidth}                  " Indent settings
set statusline+=                                " Indent settings: end
set statusline+=\ \                             " --
set statusline+=%2v                             " Cursor column (virtual)
set statusline+=\ \                             " --
set statusline+=(%l\ /\ %L)                     " Cursor line/total lines
set statusline+=\                               " -
