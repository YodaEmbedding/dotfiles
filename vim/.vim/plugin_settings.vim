" coc.nvim
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-git',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-rls',
    \ 'coc-texlab',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ ]
    " \ 'coc-python',
    " \ 'coc-vimtex',

" nvim-scrollview
let g:scrollview_base = 'buffer'
let g:scrollview_column = 80

" tcomment_vim
let g:tcomment_mapleader1 = ''
let g:tcomment_types = {'c': '// %s'}

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" vim-gutentags
let g:gutentags_file_list_command = 'rg --files'

" vim-peekaboo
let g:peekaboo_window = 'call CreateCenteredFloatingWindow()'

" vim-polyglot
let g:polyglot_disabled = ['latex', 'python-ident', 'tex']

" vim-slime
let g:slime_target = "tmux"
" let g:slime_python_ipython = 1

" vimtex
" let g:vimtex_compiler_latexmk = {'build_dir': 'out'}
let g:tex_flavor = 'latex'
let g:vimtex_quickfix_method = 'pplatex'

" Language: Fortran
let fortran_do_enddo=1
let fortran_free_source=1
