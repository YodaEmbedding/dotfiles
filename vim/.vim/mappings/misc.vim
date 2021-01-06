" Black hole paste (in visual mode) {{{1
xnoremap <silent> p p:let @"=@0<CR>

" Clipboard paste {{{1
inoremap <C-v> <C-o>"+p
nnoremap <Backspace> "+p

" Close location list {{{1
autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>

" Folding {{{1
" nnoremap <Space> zA
" vnoremap <Space> zA

" nnoremap <C-Space> za
" vnoremap <C-Space> za

" Format 72-character width docstring {{{1
vnoremap gq <Esc>:let tw=&tw<CR>:set tw=72<CR>gvgq:let &tw=tw<CR>

" Format width {{{1
nnoremap <F6> :set textwidth=72<CR>
nnoremap <F7> :set textwidth=79<CR>

" Kill buffer {{{1
nnoremap <C-x> :bd<CR>

" Macro {{{1
nnoremap <silent> <F2> @q
nnoremap <silent> <F3> @@

" Paste mode toggle {{{1
set pastetoggle=<F4>

" Quit {{{1
nnoremap zx :qa<CR>
nnoremap zX :qa!<CR>

" Regex very magic {{{1
" nnoremap / /\v
" cnoremap %s/ %s/\v
" cnoremap s/ s/\v
" vnoremap s/ :s/\v

" Save {{{1
nnoremap <C-s> :w<CR>

" Save as sudo {{{1
" TODO RARELYUSED
cmap w!! w !sudo tee > /dev/null %
cmap x!! x !sudo tee > /dev/null %

" Save jump for up/down {{{1
nnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'
vnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'

nnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'
vnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'

" Search for visually selected text {{{1
" TODO RARELYUSED
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Search for whole word {{{1
nnoremap <C-_> /\<\><Left><Left>

" Sort {{{1
nnoremap gs vip:sort<CR>
vnoremap gs :sort<CR>

" Visual selection apply dot {{{1
vnoremap <silent> . :normal .<CR>

" Visual selection apply macro {{{1
vnoremap <silent> <F2> :normal @q<CR>
vnoremap <silent> <F3> :normal @@<CR>
