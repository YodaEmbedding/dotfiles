" Installation: Please install vim-plug then simply copy this to ~/.vimrc
" Author: Mateen Ulhaq <mulhaq2005@gmail.com>


" VIM-PLUG {{{1

" Begin {{{2
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Enabled {{{2
Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy search/open files within directory
Plug 'othree/eregex.vim'                    " PCRE style regex (use :%S// to search and \/ to toggle / replacement on/off)
Plug 'Konfekt/FastFold'                     " Speed up lag caused by unnecessary evaluation of folding expressions/etc
Plug 'Yggdroot/indentLine'                  " Indent guides
Plug 'scrooloose/nerdcommenter'             " Commenting blocks i.e. \cb
Plug 'scrooloose/nerdtree'                  " File explorer
Plug 'Houl/repmo-vim'                       " Repeat last motion using ; or ,
Plug 'tmhedberg/SimpylFold'                 " Python folding
Plug 'majutsushi/tagbar'                    " (NEW) ctags; bound to \t
Plug 'vim-airline/vim-airline'              " Theme
Plug 'vim-airline/vim-airline-themes'       " Theme
Plug 'kristijanhusak/vim-hybrid-material'   " Theme
Plug 'farmergreg/vim-lastplace'             " Reopen file last position
Plug 'tpope/vim-repeat'                     " Repairs dot key for certain plugins (i.e. vim-sneak)
Plug 'justinmk/vim-sneak'                   " Use two character find (mapped to 's')
Plug 'tpope/vim-sleuth'                     " Automatically detect indent settings from file
Plug 'lervag/vimtex'                        " LaTeX
Plug 'matze/vim-tex-fold'                   " LaTeX folding
Plug 'nelstrom/vim-visual-star-search'      " Select visually then *
Plug 'bronson/vim-trailing-whitespace'      " Highlight trailing and :FixWhitespace

" Disabled {{{2

"Plug 'gkjgh/cobalt'                        " Theme
"Plug 'junegunn/fzf.vim'                    " Fuzzy search/open files within directory
"Plug 'PotatoesMaster/i3-vim-syntax'        " Syntax highlighting (i3)
"Plug 'python-mode/python-mode', {'for': 'python'}
"Plug 'altercation/vim-colors-solarized'    " Theme
"Plug 'easymotion/vim-easymotion'           " Motion
"Plug 'terryma/vim-expand-region'           " Expand selection region using + and _
"Plug 'nathanaelkane/vim-indent-guides'     "
"Plug 'terryma/vim-multiple-cursors'        " Multiple cursors WITH REGEX?! OMG
"Plug 'goldfeld/vim-seek'                   " Use two character find (mapped to 's')
"Plug 'tpope/vim-surround'                  "

" Autocompletion {{{2

Plug 'Valloric/YouCompleteMe'               " Autocompletion

"Plug 'davidhalter/jedi-vim'                " Autocompletion (Python)
"Plug 'davidhalter/jedi-vim', {'for': 'python'}
"Plug 'ervandew/supertab'                    " Supertab

"if has('nvim')
"    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"    Plug 'Shougo/deoplete.nvim'
"    Plug 'roxma/nvim-yarp'
"    Plug 'roxma/vim-hug-neovim-rpc'
"endif

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'                 " Autocompletion (Python)
""Plug 'roxma/nvim-yarp'
""Plug 'roxma/vim-hug-neovim-rpc'
""Plug 'roxma/nvim-completion-manager'

"Plug 'Shougo/echodoc.vim'

" Untried {{{2

" A bunch of cool stuff here:
"https://www.reddit.com/r/vim/comments/76z4ux/vim_after_15_years/doj0qb6/

"Plug 'wincent/command-t'                   "
"Plug 'Xuyuanp/nerdtree-git-plugin'         "
"Plug 'chrisbra/NrrwRgn'                    " oooh this is cool (extract buffer)
"Plug 'wincent/scalpel'                     " SublimeText-like word replace?
"Plug 'AndrewRadev/sideways.vim'            " Parameter swapping
"Plug 'ervandew/supertab'                   "
"Plug 'vim-syntastic/syntastic'             " Syntax (compile) checking
"Plug 'mbbill/undotree'                     "
"Plug 'justinmk/vim-dirvish'                " Directory viewer
"Plug 'junegunn/vim-easy-align'             "
"Plug 'svermeulen/vim-easyclip'             " (USEFUL)  Blackhole delete, smart yanking, etc
"Plug 'mhinz/vim-grepper'                   "
"Plug 'ludovicchabant/vim-gutentags'        " Fast ctagging?
"Plug 'tpope/vim-repeat'                    "
"Plug 'justinmk/vim-syntax-extra'           " More syntax highlighting
"Plug 'thaerkh/vim-workspace'               "
"Plug 'jreybert/vimagit'                    " vim git magic!!!
"Plug 'benmills/vimux'                      "
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

" deoplete {{{2

let g:deoplete#enable_at_startup = 1

let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#auto_completion_start_length = 2

let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#show_call_signatures = 0

" echodoc {{{2

 let g:echodoc_enable_at_startup=1

" indentLine {{{2

let g:indentLine_char = '│'

" NERDTree {{{2

"let NERDTreeShowHidden = 1

" vim-airline {{{2

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

" vim-sleuth {{{2

let b:sleuth_mixed_tabstop = 4

" YouCompleteMe {{{2

let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
"let g:ycm_python_binary_path = '/usr/bin/env python3'

" THEMING {{{1

" Color scheme {{{2

" Favorites:
" cobalt, desert, hybrid_reverse, hybrid_material, solarized
colorscheme hybrid_material

" Background {{{2

"set t_Co=256        " Force 256-colors
set background=dark  " Dark background

hi Normal guibg=DarkSlateGray ctermbg=NONE
hi Normal guifg=PapayaWhip ctermfg=249

" Font {{{2

if has("gui_running")
    set guifont=Roboto\ Mono\ 16
endif

" Bold font
"let g:enable_bold_font = 1

" Airline {{{2

" https://github.com/vim-airline/vim-airline/wiki/Screenshots
" Change using :Airline Theme
" base16, base16_ashes, base16_default, hybrid, jellybeans, lucius
let g:airline_theme = "base16"

" Highlight groups {{{2

syn keyword Todo NOTE DEBUG FIXME

" OPTIONS {{{1

" Indenting and Tabs {{{2

"set autoindent         "
"set smartindent        "
"set smarttab           "

"set expandtab          " Tabs to Spaces
set noexpandtab         " Tabs to Tabs

set shiftwidth=4        " Indent/outdent by four columns
"set softtabstop=4      " Indent as if four columns...?
set tabstop=4           " Indentation levels every four columns

" Python indenting
let g:pyindent_continue     = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_open_paren   = '&sw'
" let g:pyindent_continue   = '&sw * 2'

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

" Disable continue comment on new line {{{2

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Remove trailing whitespace on file save {{{2

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Folding {{{2

"autocmd FileType * setlocal foldcolumn=3 foldmethod=indent
autocmd FileType conf setlocal foldcolumn=3 foldmethod=expr foldexpr=FoldConfig()
autocmd FileType markdown setlocal foldcolumn=3 foldmethod=expr foldexpr=FoldMarkdown()
autocmd FileType vim,zsh setlocal foldcolumn=3 foldmethod=marker

" Auto close preview {{{2

"autocmd CompleteDone * silent! pclose!
autocmd InsertLeave * silent! pclose!

" Indenting and Tabs {{{2

autocmd FileType python setlocal tabstop=4

" COMMANDS {{{1

" Copy search matches {{{2
command! -register CopyMatches call <SID>CopyMatches(<q-reg>)

" FUNCTIONS {{{1

" Copy search matches {{{2
function! s:CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

" Check backspace {{{2
function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Strip trailing white spaces {{{2
function! s:StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfunction

" Swap lines {{{2
" Swap lines {{{3
function! s:SwapLines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

" Swap up {{{3
function! s:SwapUp()
    let n = line('.')
    if n == 1
        return
    endif

    call s:SwapLines(n, n - 1)
    exec n - 1
endfunction

" Swap down {{{3
function! s:SwapDown()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:SwapLines(n, n + 1)
    exec n + 1
endfunction

" Word wrap {{{2
function! s:ToggleWrap()
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
endfunction

" Folding {{{2
" Fold config files {{{3
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

" Fold markdown files {{{3
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

" Deoplete bindings {{{2

if match(&runtimepath, 'deoplete.nvim') != -1
    " inoremap <silent><expr> <Tab>
    "     \ pumvisible() ? "\<C-n>" :
    "     \ <SID>CheckBackspace() ? "\<Tab>" :
    "     \ deoplete#mappings#manual_complete()
endif

" Repeat motion bindings {{{2
if match(&runtimepath, 'repmo-vim') != -1
    " Specific mappings if vim-sneak plugin enabled
    if match(&runtimepath, 'vim-sneak') != -1 "{{{3
        map  <expr> ; repmo#LastKey('<Plug>Sneak_;')|sunmap ;
        map  <expr> , repmo#LastRevKey('<Plug>Sneak_,')|sunmap ,

        map  <expr> f repmo#ZapKey('<Plug>Sneak_f')|sunmap f
        map  <expr> F repmo#ZapKey('<Plug>Sneak_F')|sunmap F
        map  <expr> t repmo#ZapKey('<Plug>Sneak_t')|sunmap t
        map  <expr> T repmo#ZapKey('<Plug>Sneak_T')|sunmap T

        map  <expr> s repmo#ZapKey('<Plug>Sneak_s')|ounmap s|sunmap s
        map  <expr> S repmo#ZapKey('<Plug>Sneak_S')|ounmap S|sunmap S
        omap <expr> z repmo#ZapKey('<Plug>Sneak_s')
        omap <expr> Z repmo#ZapKey('<Plug>Sneak_S')
    else "{{{3
        map <expr> ; repmo#LastKey(';')|sunmap ;
        map <expr> , repmo#LastRevKey(',')|sunmap ,

        noremap <expr> f repmo#ZapKey('f')|sunmap f
        noremap <expr> F repmo#ZapKey('F')|sunmap F
        noremap <expr> t repmo#ZapKey('t')|sunmap t
        noremap <expr> T repmo#ZapKey('T')|sunmap T
    endif "}}}

    " Non-specific mappings
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
endif

" fzf bindings {{{2
" TODO: Probably make buffers even more accessible
if match(&runtimepath, 'fzf') != -1
    nmap <Leader>b :Buffers<CR>
    nmap <Leader>f :Files<CR>
    nmap <Leader>t :Tags<CR>
endif

" Nerdtree bindings {{{2

nmap <Leader>f :NERDTreeToggle<CR>

" Swap lines {{{2
noremap <silent> <C-S-Up>   :call <SID>SwapUp()<CR>
noremap <silent> <C-S-Down> :call <SID>SwapDown()<CR>
noremap <silent> <C-k>      :call <SID>SwapUp()<CR>
noremap <silent> <C-j>      :call <SID>SwapDown()<CR>

" eregex toggle {{{2
nnoremap <Leader>/ :call eregex#toggle()<CR>

" ctags toggle {{{2
noremap <Leader>t :TagbarToggle<CR><C-w><C-w>

" Buffer menu {{{2
nnoremap <Leader>b :buffers<CR>:b<Space>

" Register menu {{{2
nnoremap <Leader>r :registers<CR>:put<Space>

" Strip trailing whitespace {{{2
nnoremap <Leader><Space> :call <SID>StripTrailingWhitespaces()<CR>

" Word wrap, up/down visually {{{2
noremap <Leader>w :call <SID>ToggleWrap()<CR>

" Relative numbering {{{2
nnoremap <Leader>n :set relativenumber!<CR>

" Count search matches {{{2
nnoremap <Leader>s :%s///gn<left><left><left><left>
nnoremap <Leader>S :%s/\<lt>\>//gn<left><left><left><left><left><left>

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
"nmap <silent> <Leader><C-p> :set paste<CR>"+p:set nopaste<CR> " TODO paste inline
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

" Window navigation {{{2
map ' <C-w>
map '' <C-w>w

" Navigate up/down in wrapped text {{{2
nnoremap <Down> gj
nnoremap <Up>   gk
inoremap <Down> <C-o>gj
inoremap <Up>   <C-o>gk

" Scroll 5 lines up/down {{{2
noremap <Down> 5<C-d>
noremap <Up>   5<C-u>

" Folding {{{2
nnoremap <Space> za
vnoremap <Space> za

" Save as sudo {{{2
cmap w!! w !sudo tee > /dev/null %

" TODO {{{1

" Free bindings: <S-d> <S-x> <S-s>

" fzf: Probably make buffers even more accessible
" Cycle through colorschemes (NextColors() function)

" Deoplete bindings
" https://vi.stackexchange.com/questions/9468/cant-get-deoplete-plugin-working-in-neovim/9554
" "use <tab> for completion
" function! TabWrap()
"     if pumvisible()
"         return "\<C-N>"
"     elseif strpart( getline('.'), 0, col('.') - 1 ) =~ '^\s*$'
"         return "\<tab>"
"     elseif &omnifunc !~ ''
"         return "\<C-X>\<C-O>"
"     else
"         return "\<C-N>"
"     endif
" endfunction
"
" " power tab
" imap <silent><expr><tab> TabWrap()
"
" " Enter: complete&close popup if visible (so next Enter works); else: break undo
" inoremap <silent><expr> <Cr> pumvisible() ?
"             \ deoplete#mappings#close_popup() : "<C-g>u<Cr>"
"
" " Ctrl-Space: summon FULL (synced) autocompletion
" inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()
"
" " Escape: exit autocompletion, go to Normal mode
" inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

