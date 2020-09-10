" LanguageClient-neovim {{{1
let g:LanguageClient_autoStart = 1
let g:LanguageClient_settingsPath = expand('~/.local/share/nvim/settings.json')
let g:LanguageClient_serverCommands = {
    \ 'clojure': ['bash', '-c', 'clojure-lsp'],
    \ 'fortran': ['fortls', '--symbol_skip_mem', '--incrmental_sync', '--autocomplete_no_prefix'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'beta', 'rls'],
    \ }
    " \ 'python': ['dotnet', 'exec', '~/.local/share/microsoft-python-language-server/Microsoft.Python.LanguageServer.dll'],

" nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K    :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd   :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" tcomment_vim {{{1
let g:tcomment_mapleader1 = ''
let g:tcomment_types = {'c': '// %s'}

" vim-gutentags {{{1
let g:gutentags_file_list_command = 'rg --files'

" vim-peekaboo {{{1
" let g:peekaboo_window = 'vertical botright 60new'

" vim-polyglot {{{1
let g:polyglot_disabled = ['latex', 'python-ident', 'tex']

" vim-slime {{{1
let g:slime_target = "tmux"
" let g:slime_python_ipython = 1

" vimtex {{{1
" let g:vimtex_compiler_latexmk = {
"     \ 'build_dir': 'out'
"     \ }

let g:tex_flavor = 'latex'
let g:vimtex_quickfix_method = 'pplatex'
