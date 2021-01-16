" Dot repeat
xnoremap <silent> . :normal .<CR>

" Format width (72-char)
xnoremap gq <Esc>:let tw=&tw<CR>:set tw=72<CR>gvgq:let &tw=tw<CR>

" Format width
nnoremap <F6> :set textwidth=72<CR>
nnoremap <F7> :set textwidth=79<CR>

" Kill buffer
nnoremap <C-x> :bd<CR>

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

" Quit
nnoremap zx :qa<CR>
nnoremap zX :qa!<CR>

" Save
nnoremap <C-s> :w<CR>

" Save as sudo
cnoremap w!! w !sudo tee > /dev/null %
cnoremap x!! x !sudo tee > /dev/null %

" Search selection
xnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Search whole word
nnoremap <C-_> /\<\><Left><Left>

" Sort
nnoremap gs vip:sort<CR>
xnoremap gs :sort<CR>

" Strip trailing whitespace
nnoremap <Leader><Space> :FixWhitespace<CR>

" Toggle wrap
nnoremap <Leader>w :call ToggleWrap()<CR>
