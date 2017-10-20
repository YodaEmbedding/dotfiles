" Installation: Please install vim-plug then simply copy this to ~/.vimrc
" Author: Mateen Ulhaq <mulhaq2005@gmail.com>


" VIM-PLUG {{{1

" Begin {{{2
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Enabled {{{2
Plug 'gkjgh/cobalt'                         " Theme
Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy search/open files within directory
Plug 'othree/eregex.vim'                    " PCRE style regex (use :%S// to search and \/ to toggle / replacement on/off)
Plug 'Konfekt/FastFold'                     " Speed up lag caused by unnecessary evaluation of folding expressions/etc
Plug 'Yggdroot/indentLine'                  " Indent guides
Plug 'scrooloose/nerdcommenter'             " Commenting blocks i.e. \cb
Plug 'Houl/repmo-vim'                       " Repeat last motion using ; or ,
Plug 'majutsushi/tagbar'                    " (NEW) ctags; bound to \t
Plug 'vim-airline/vim-airline'              " Theme
Plug 'vim-airline/vim-airline-themes'       " Theme
Plug 'kristijanhusak/vim-hybrid-material'   " Theme
Plug 'farmergreg/vim-lastplace'             " Reopen file last position
Plug 'justinmk/vim-sneak'                   " Use two character find (mapped to 's')
Plug 'tpope/vim-sleuth'                     " Automatically detect indent settings from file
Plug 'bronson/vim-trailing-whitespace'      " Highlight trailing and :FixWhitespace
Plug 'Valloric/YouCompleteMe'               " Autocompletion

" Disabled {{{2

"Plug 'PotatoesMaster/i3-vim-syntax'        " Syntax highlighting (i3)
"Plug 'python-mode/python-mode', {'for': 'python'}
"Plug 'easymotion/vim-easymotion'
"Plug 'terryma/vim-expand-region'           " Expand selection region using + and _
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'terryma/vim-multiple-cursors'        " Multiple cursors WITH REGEX?! OMG
"Plug 'goldfeld/vim-seek'                   " Use two character find (mapped to 's')
"Plug 'tpope/vim-surround'
"Plug 'lervag/vimtex'                       " vim latex
"Plug 'altercation/vim-colors-solarized'    " Theme

" Untried {{{2

" A bunch of cool stuff here:
"https://www.reddit.com/r/vim/comments/76z4ux/vim_after_15_years/doj0qb6/

"Plug 'wincent/command-t'
"Plug 'davidhalter/jedi-vim'
"Plug 'scrooloose/nerdtree'
"Plug 'Xuyuanp/nerdtree-git-plugin'
"Plug 'chrisbra/NrrwRgn'                    " oooh this is cool (extract buffer)
"Plug 'wincent/scalpel'                     " SublimeText-like word replace?
"Plug 'AndrewRadev/sideways.vim'            " Parameter swapping
"Plug 'tmhedberg/SimpylFold'                " Python folding
"Plug 'ervandew/supertab'
"Plug 'vim-syntastic/syntastic'             " Syntax (compile) checking
"Plug 'mbbill/undotree'
"Plug 'justinmk/vim-dirvish'                " Directory viewer
"Plug 'junegunn/vim-easy-align'
"Plug 'mhinz/vim-grepper'
"Plug 'ludovicchabant/vim-gutentags'        " Fast ctagging?
"Plug 'tpope/vim-repeat'
"Plug 'justinmk/vim-syntax-extra'           " More syntax highlighting
"Plug 'thaerkh/vim-workspace'
"Plug 'jreybert/vimagit'                    " vim git magic!!!
"Plug 'benmills/vimux'
"Plug 'kkoenig/wimproved.vim'               " For Windows

" Autocompletion
"Plug 'SirVer/ultisnips'                    " Snippet completion
"Plug 'Shougo/neocomplete.vim'              "
"Plug 'lifepillar/vim-mucomplete'           "

" End {{{2
call plug#end()

" PLUGIN SETTINGS {{{1

" ctrlp {{{2
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'min:4,max:72'
let g:ctrlp_working_path_mode = 'r'

if executable('ag')
    " Use silver searcher (ag)
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" indentLine {{{2
let g:indentLine_char = '│'

" vim-airline {{{2
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" COLOR SCHEMES {{{1

"set t_Co=256        " Force 256-colors
set background=dark  " Dark background

"color desert
"colorscheme cobalt
"colorscheme hybrid_reverse
colorscheme hybrid_material
"colorscheme solarized

" Custom colors
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
hi Normal guifg=PapayaWhip ctermfg=255

" Transparent background
hi Normal guibg=NONE ctermbg=NONE

" Bold font
"let g:enable_bold_font = 1

" https://github.com/vim-airline/vim-airline/wiki/Screenshots
" Change using :Airline Theme
" base16, base16_ashes, base16_default, hybrid, jellybeans, lucius
let g:airline_theme = "base16"

" OPTIONS {{{1

" Indenting and Tabs {{{2
"set autoindent         "
"set expandtab          " Spaces
"set noexpandtab        " Tabs
set shiftwidth=4        " Indent/outdent by four columns
"set smartindent        "
set smarttab            "
set softtabstop=4       "
set tabstop=4           " Indentation levels every four columns

" Search {{{2
set hlsearch            " Highlight search results
set ignorecase          " Ignore case
"set magic              " Escape like regular regexes; use \V to revert
set smartcase           " Ignore case if lower

" Visual {{{2
set colorcolumn=80      " Column guide
"set cursorline         " Highlight current line (disabled because it causes cursor lag)
set laststatus=2        " Show status line
set mouse=a             " Mouse interactivity
set number              " Line numbers

" Undo {{{2
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Conceal {{{2
set conceallevel=0
let g:tex_conceal = ""

" Miscellaneous {{{2
set hidden              " Allow switching buffers with unwritten changes
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.pyc  " Do not list

" Performance {{{2
"set lazyredraw
"set nocul               " disable highlight current line
"set ttyfast             " speeds up page up/down?

" GUI {{{2
if has("gui_running")
    "set guioptions +=e     " Use GUI tabs
    "set guioptions -=m     " Remove menubar
    set guioptions -=T      " Remove toolbar
    "set guitablabel=%N\ %t\ %M  " GUI tab labels
endif

" AUTOCMDS {{{1

" Disable continue comment on new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Remove trailing whitespace on file save
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Folding
"autocmd FileType * setlocal foldcolumn=3 foldmethod=indent
autocmd FileType conf setlocal foldcolumn=3 foldmethod=expr foldexpr=FoldConfig()
autocmd FileType markdown setlocal foldcolumn=3 foldmethod=expr foldexpr=FoldMarkdown()
autocmd FileType vim setlocal foldcolumn=3 foldmethod=marker

" FUNCTIONS {{{1

" Copy search matches {{{2
function! CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Strip trailing white spaces {{{2
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Swap lines {{{2
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

" Word wrap {{{2
function ToggleWrap()
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
endfunction

" Folding {{{2
function! FoldConfig()
    let thisline = getline(v:lnum)
    let matchline = matchstr(thisline, '^#\+.\+#\+$')
    let match = matchstr(matchline, '^#*')
    let level = strlen(match)

    if level > 0
        "return ">" . string(level)
        return ">1"
    endif

    return "="
endfunction

function! FoldMarkdown()
    let thisline = getline(v:lnum)
    let match = matchstr(thisline, '^#*')
    let level = strlen(match)

    if level > 0
        return ">" . string(level)
    endif

    return "="
endfunction

" KEYBOARD MAPPINGS {{{1

" Repeat motion bindings {{{2
if !empty(glob('$HOME/.vim/plugged/repmo-vim'))
    map <expr> ; repmo#LastKey(';')|sunmap ;
    map <expr> , repmo#LastRevKey(',')|sunmap ,

    noremap <expr> h repmo#SelfKey('h', 'l')|sunmap h
    noremap <expr> l repmo#SelfKey('l', 'h')|sunmap l

    noremap <expr> j repmo#Key('j', 'k')|sunmap j
    noremap <expr> k repmo#Key('k', 'j')|sunmap k

    noremap <expr> b repmo#Key('b', 'w')|sunmap b
    noremap <expr> B repmo#Key('B', 'W')|sunmap B
    noremap <expr> e repmo#Key('e', 'b')|sunmap e
    noremap <expr> E repmo#Key('E', 'B')|sunmap E
    noremap <expr> w repmo#Key('w', 'b')|sunmap w
    noremap <expr> W repmo#Key('W', 'B')|sunmap W

    noremap <expr> f repmo#ZapKey('f')|sunmap f
    noremap <expr> F repmo#ZapKey('F')|sunmap F
    noremap <expr> t repmo#ZapKey('t')|sunmap t
    noremap <expr> T repmo#ZapKey('T')|sunmap T
endif

" Swap lines {{{2
noremap <silent> <C-S-Up>   :call <SID>swap_up()<CR>
noremap <silent> <C-S-Down> :call <SID>swap_down()<CR>
noremap <silent> <C-k>      :call <SID>swap_up()<CR>
noremap <silent> <C-j>      :call <SID>swap_down()<CR>

" eregex toggle {{{2
nnoremap <Leader>/ :call eregex#toggle()<CR>

" ctags toggle {{{2
noremap <Leader>t :TagbarToggle<CR>

" Word wrap, up/down visually {{{2
noremap <Leader>w :call ToggleWrap()<CR>

" Relative numbering {{{2
nnoremap <Leader>r :set relativenumber!<CR>

" Black hole delete {{{2
nnoremap <Backspace> "_dd
vnoremap <Backspace> "_dd
nnoremap <Leader>d   "_d
vnoremap <Leader>d   "_d
nnoremap <Leader>x   "_x
vnoremap <Leader>x   "_x

"Black hole paste (in visual mode) {{{2
xnoremap <silent> p p:let @"=@0<CR>

" Clipboard (copy/paste) {{{2
nmap <silent> <Leader>p :set paste<CR>"+p:set nopaste<CR>
nmap <silent> <Leader>P :set paste<CR>"+P:set nopaste<CR>
map  <silent> <Leader>y "+y
map  <silent> <Leader>Y "+Y

" Spell checker {{{2
" toggle, next, previous, add, correct
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sc z=

" New line without insert mode (uses q register to mark) {{{2
nnoremap <CR> mqo<Esc>`q

" Macro {{{2
nmap <silent> <F2> @q
nmap <silent> <F3> @@

" Search for visually selected text {{{2
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Buffer navigation {{{2
nnoremap <Tab>   :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <A-n>   :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p>   :bprevious<CR>:redraw<CR>:ls<CR>

" Navigate up/down in wrapped text {{{2
nnoremap <Down> gj
nnoremap <Up>   gk
inoremap <Down> <C-o>gj
inoremap <Up>   <C-o>gk

" Navigate 5 lines up/down {{{2
noremap <C-Down> 5<C-e>
noremap <C-Up>   5<C-y>

" Navigate screen up/down {{{2
noremap <S-Down> <C-e>
noremap <S-Up>   <C-y>

" Folding {{{2
nnoremap <Space> za
vnoremap <Space> za

" Save as sudo {{{2
cmap w!! w !sudo tee > /dev/null %

" TODO {{{1
" Compton transparency causes laggy page up/down
" Cycle through colorschemes (NextColors() function)

" Free bindings:
" <S-d> <S-x> <S-s>

