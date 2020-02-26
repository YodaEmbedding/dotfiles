" Plugin bindings {{{1

" coc.nvim {{{2
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
        \ ":call coc#util#float_hide()<CR>" :
        \ coc#util#has_float() ?
        \     ":call coc#util#float_jump()<CR>" :
        \     ":call CocDocumentation()<CR>")

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

" Denite {{{2
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

" fzf {{{2
if PlugLoaded('fzf.vim')
    nnoremap <Tab>     :Buffers<CR>
    nnoremap ,         :SmartFiles<CR>
    nnoremap <Leader>s :LocateFiles .<CR>
    nnoremap <Leader>f :Files<CR>
    nnoremap <Leader>F :Files %:h<CR>
    nnoremap <Leader>g :GFiles --cached --others --exclude-standard<CR>
    nnoremap <Leader>h :History<CR>
    nnoremap <Leader>l :Lines<CR>
    nnoremap <Leader>a :Ag!<CR>
    nnoremap <Leader>r :Rg!<CR>
    nnoremap <Leader>m :Marks<CR>
    nnoremap <Leader>t :Tags<CR>
endif

" vim-easy-align {{{2
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Leader {{{1

" Strip trailing whitespace {{{2
nnoremap <Leader><Space> :FixWhitespace<CR>

" Word wrap, up/down visually {{{2
noremap <Leader>w :call ToggleWrap()<CR>

" Navigation {{{1

" Motion overrides {{{2
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

" Navigate buffers {{{2
nnoremap <S-Tab> :b#<CR>
nnoremap gb      :ls<CR>:b<Space>

" Navigate jumpstack {{{2
nnoremap <C-P> <C-I>

" Scroll {{{2
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

" Miscellaneous {{{1

" Black hole delete {{{2
nnoremap <Backspace> "_dd
vnoremap <Backspace> "_dd

" Black hole paste (in visual mode) {{{2
xnoremap <silent> p p:let @"=@0<CR>

" Clipboard paste {{{2
inoremap <C-v> <C-o>"+p

" Close location list {{{2
autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>

" Folding {{{2
" nnoremap <Space> zA
" vnoremap <Space> zA

" nnoremap <C-Space> za
" vnoremap <C-Space> za

" Kill buffer {{{2
nnoremap <C-x> :bd<CR>

" Macro {{{2
nnoremap <silent> <F2> @q
nnoremap <silent> <F3> @@

" Paste mode toggle {{{2
set pastetoggle=<F4>

" Quit {{{2
nnoremap zx :qa<CR>
nnoremap zX :qa!<CR>

" Save {{{2
nnoremap <C-s> :w<CR>

" Save as sudo {{{2
" TODO RARELYUSED
cmap w!! w !sudo tee > /dev/null %
cmap x!! x !sudo tee > /dev/null %

" Save jump for up/down {{{2
nnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'
vnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'

nnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'
vnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'

" Search for visually selected text {{{2
" TODO RARELYUSED
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Search for whole word {{{2
nnoremap <C-_> /\<\><Left><Left>

" Sort {{{2
nnoremap gs vip:sort<CR>
vnoremap gs :sort<CR>

" Visual selection apply dot {{{2
vnoremap <silent> . :normal .<CR>

" Visual selection apply macro {{{2
vnoremap <silent> <F2> :normal @q<CR>
vnoremap <silent> <F3> :normal @@<CR>
