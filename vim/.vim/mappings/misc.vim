" Dot repeat
xnoremap <silent> . :normal .<CR>

" Format width (72-char)
xnoremap gq <Esc>:let tw=&tw<CR>:set tw=72<CR>gvgq:let &tw=tw<CR>

" Format width
nnoremap <F6> :set textwidth=72<CR>
nnoremap <F7> :set textwidth=79<CR>

" Kill buffer
nnoremap <Space>d :bd<CR>

" Macro
nnoremap <silent> <F2> @q
nnoremap <silent> <F3> @@
xnoremap <silent> <F2> :normal @q<CR>
xnoremap <silent> <F3> :normal @@<CR>

" Paste blackhole
xnoremap <silent> p p:let @"=@0<CR>

" Paste clipboard
inoremap <C-v> <C-o>"+p
nnoremap <Backspace> "+p

" Previous buffer
nnoremap <S-Tab> :e#<CR>

" Previous jump in jumplist
nnoremap <C-P> <C-I>

" Quit
nnoremap zx :qa<CR>
nnoremap zX :qa!<CR>

" Save
nnoremap <C-s> :up<CR>
nnoremap <Space>s :up<CR>

" Save as sudo
cnoremap w!! w !sudo tee > /dev/null %
cnoremap x!! x !sudo tee > /dev/null %

" Search selection
xnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Search whole word
nnoremap <C-_> /\<\><Left><Left>

" Sort
nnoremap gs vip:sort i<CR>
xnoremap gs :sort i<CR>

" Strip trailing whitespace
nnoremap <Leader><Space> :FixWhitespace<CR>

" Switch buffer
nnoremap gb :ls<CR>:b<Space>

" Toggle wrap
nnoremap <Leader>w :call ToggleWrap()<CR>

" Add <count>jk motions to jumplist
nnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'
xnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'
nnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'
xnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'

" Don't add {} motions to jumplist
nnoremap <silent> } :<C-u>execute "keepjumps norm! " . v:count1 . "}"<CR>
nnoremap <silent> { :<C-u>execute "keepjumps norm! " . v:count1 . "{"<CR>
