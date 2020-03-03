" Motion overrides {{{1
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

" Navigate buffers {{{1
nnoremap <S-Tab> :b#<CR>
nnoremap gb      :ls<CR>:b<Space>

" Navigate jumpstack {{{1
nnoremap <C-P> <C-I>

" Scroll {{{1
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>
