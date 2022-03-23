" Add <count>jk motions to jumplist
nnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'
xnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'
nnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'
xnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'

" Don't add {} motions to jumplist
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>

" Previous buffer
nnoremap <S-Tab> :e#<CR>

" Previous jump in jumplist
nnoremap <C-P> <C-I>

" Switch buffer
nnoremap gb :ls<CR>:b<Space>
