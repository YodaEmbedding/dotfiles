" coc.nvim {{{1
if PlugLoaded('coc.nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <silent><expr> <c-k> CocActionAsync('showSignatureHelp')
    " nnoremap <silent> K :call CocDocumentation()<CR>
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gt <Plug>(coc-type-definition)
    nmap <leader>=  <Plug>(coc-format-selected)
    xmap <leader>=  <Plug>(coc-format-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>ac <Plug>(coc-codeaction)
    nmap <leader>qf <Plug>(coc-fix-current)
    nmap <leader>rn <Plug>(coc-rename)

    nnoremap <silent> <expr> K (exists('w:float') ?
        \ ":call coc#float#close_all()<CR>" :
        \ coc#float#has_float() ?
        \     ":call coc#float#jump()<CR>" :
        \     ":call CocDocumentation()<CR>")

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

    function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    nnoremap <silent> <space><space> :<C-u>CocList<CR>
    nnoremap <silent> <C-space>      :<C-u>CocListResume<CR>

    nnoremap <silent> <space>a  :<C-u>CocList actions<CR>
    nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
    nnoremap <silent> <space>d  :<C-u>CocList diagnostics<CR>
    nnoremap <silent> <space>m  :<C-u>CocList marks<CR>
    nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
    nnoremap <silent> <space>q  :<C-u>CocList quickfix<CR>
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
    nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
endif

" Denite {{{1
if PlugLoaded('denite.nvim')
    " <Tab>         List buffers
    " ,             List files in current directory recursively (using fd)
    " <Leader>f     List files in current directory recursively
    " <Leader>d     List files in current directory
    " <Leader>s     Search current directory
    " <Leader>j     Search current directory for occurences of word under cursor
    nnoremap <Tab>     :Denite buffer     <CR>
    nnoremap ,         :Denite file/rec/fd<CR>
    nnoremap <Leader>f :Denite file/rec   <CR>
    nnoremap <Leader>d :Denite file       <CR>
    nnoremap <Leader>s :<C-u>Denite grep:. -no-empty -mode=normal<CR>
    nnoremap <Leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

    call denite#custom#alias('source', 'file/rec/fd', 'file/rec')
    call denite#custom#var('file/rec/fd', 'command',
        \ ['fd', '--type=f', '--follow', '--hidden', '--full-path', '--color=never', '--exclude=.git', ''])

    let s:denite_options = {'default' : {
        \ 'auto_resize': 1,
        \ 'highlight_matched_char': 'Function',
        \ 'highlight_matched_range': 'Normal',
        \ 'prompt': 'λ:',
        \ 'prompt_highlight': 'Function',
        \ }}

    call denite_profile(s:denite_options)
endif

" fzf {{{1
if PlugLoaded('fzf.vim')
    nnoremap <Tab>     :Buffers<CR>
    nnoremap ,         :SmartFiles<CR>
    nnoremap <Leader>s :LocateFiles .<CR>
    nnoremap <Leader>f :FilesMru<CR>
    nnoremap <Leader>F :Files %:h<CR>
    nnoremap <Leader>g :GFiles --cached --others --exclude-standard<CR>
    nnoremap <Leader>h :History<CR>
    nnoremap <Leader>l :Lines<CR>
    nnoremap <Leader>a :Ag!<CR>
    nnoremap <Leader>r :Rg!<CR>
    nnoremap <Leader>m :Marks<CR>
    nnoremap <Leader>t :Tags<CR>
    nnoremap gl :Rg<CR>
endif

" vim-easy-align {{{1
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
