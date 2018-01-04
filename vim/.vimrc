" Installation: Please install vim-plug then simply copy this to ~/.vimrc
" Author: Mateen Ulhaq <mulhaq2005@gmail.com>


" VIM-PLUG {{{1

" Begin {{{2
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Enabled {{{2
Plug 'Shougo/denite.nvim'                   " Fuzzy search/open files within directory
Plug 'Konfekt/FastFold'                     " Speed up lag caused by unnecessary evaluation of folding expressions/etc
Plug 'Yggdroot/indentLine'                  " Indent guides
Plug 'scrooloose/nerdcommenter'             " Commenting blocks i.e. \cb
Plug 'Houl/repmo-vim'                       " Repeat last motion using ; or ,
Plug 'tmhedberg/SimpylFold'                 " Folding (Python)
Plug 'majutsushi/tagbar'                    " (RARELYUSED) ctags; bound to \t
Plug 'vim-airline/vim-airline'              " (REMOVE) Theme
Plug 'vim-airline/vim-airline-themes'       " (REMOVE) Theme
Plug 'airblade/vim-gitgutter'               " Git gutter
Plug 'Twinside/vim-haskellFold'             " Folding (Haskell)
Plug 'kristijanhusak/vim-hybrid-material'   " Theme
Plug 'farmergreg/vim-lastplace'             " Reopen file last position
Plug 'tpope/vim-repeat'                     " Repairs dot key for certain plugins (i.e. vim-sneak)
Plug 'justinmk/vim-sneak'                   " Use two character find (mapped to 's')
Plug 'tpope/vim-sleuth'                     " Automatically detect indent settings from file
Plug 'tpope/vim-surround'                   " (RARELYUSED) Change surrounding parenthesis, i.e. cs([
Plug 'matze/vim-tex-fold'                   " Folding (LaTeX)
Plug 'nelstrom/vim-visual-star-search'      " Select visually then *
Plug 'bronson/vim-trailing-whitespace'      " Highlight trailing and :FixWhitespace

" Disabled {{{2
"Plug 'gkjgh/cobalt'                        " Theme
"Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy search/open files within directory
"Plug 'othree/eregex.vim'                   " PCRE style regex (use :%S// to search and \/ to toggle / replacement on/off)
"Plug '/usr/local/opt/fzf'
"Plug '/usr/bin/fzf'
"Plug 'junegunn/fzf.vim'                    " Fuzzy search/open files within directory
"Plug 'PotatoesMaster/i3-vim-syntax'        " Syntax highlighting (i3)
"Plug 'scrooloose/nerdtree'                 " File explorer
"Plug 'python-mode/python-mode', {'for': 'python'}
"Plug 'pseewald/vim-anyfold'                 " Fold on indent
"Plug 'altercation/vim-colors-solarized'    " Theme
"Plug 'easymotion/vim-easymotion'           " Motion
"Plug 'terryma/vim-expand-region'           " Expand selection region using + and _
"Plug 'nathanaelkane/vim-indent-guides'     "
"Plug 'terryma/vim-multiple-cursors'        " Multiple cursors WITH REGEX?! OMG
"Plug 'goldfeld/vim-seek'                   " Use two character find (mapped to 's')
"Plug 'lervag/vimtex'                       " LaTeX

" Autocompletion {{{2
"Plug 'Valloric/YouCompleteMe'              " Autocompletion

" UNTRIED {{{3
"Plug 'SirVer/ultisnips'                    " Snippet completion
"Plug 'lifepillar/vim-mucomplete'           "
"}}}

"Plug 'davidhalter/jedi-vim'                " Autocompletion (Python)
"Plug 'davidhalter/jedi-vim', {'for': 'python'}
"Plug 'ervandew/supertab'                   " Supertab

"Plug 'ajh17/VimCompletesMe'                " Autocompletion

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
"Plug 'roxma/nvim-completion-manager'

Plug 'zchee/deoplete-jedi'                  " Autocompletion (Python)
Plug 'eagletmt/neco-ghc'                    " Autocompletion (Haskell)

Plug 'fs111/pydoc.vim'                      " Documentation (Python)

"Plug 'Shougo/echodoc.vim'

" Untried {{{2
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
"Plug 'LucHermitte/lh-vim-lib'              " Library of functions for LucHermitte's scripts
"Plug 'LucHermitte/VimFold4C'               " Folding (C++)
"Plug 'mhinz/vim-grepper'                   "
"Plug 'ludovicchabant/vim-gutentags'        " Fast ctagging?
"Plug 'tpope/vim-repeat'                    "
"Plug 'kana/vim-submode'                    " More modes
"Plug 'justinmk/vim-syntax-extra'           " More syntax highlighting
"Plug 'thaerkh/vim-workspace'               "
"Plug 'jreybert/vimagit'                    " vim git magic!!!
"Plug 'benmills/vimux'                      "
"Plug 'kkoenig/wimproved.vim'               " For Windows

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

"let g:deoplete#enable_auto_select = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#auto_completion_start_length = 2

" deoplete-jedi {{{2

let g:deoplete#sources#jedi#server_timeout = 60
"let g:deoplete#sources#jedi#show_docstring = 1

" jedi {{{2

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

" vim-anyfold {{{2

let anyfold_activate=1
"let anyfold_fold_display=0
"let anyfold_motion=0
let anyfold_identify_comments=0
"let anyfold_fold_comments=1
"let anyfold_fold_toplevel=1

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

" Conceal {{{2
set conceallevel=0
let g:tex_conceal = ""
let g:vim_json_syntax_conceal = 0

" Folding {{{2
set fillchars=fold:\ 
set foldnestmax=4
set foldtext=FoldTextStyle()

" GUI {{{2
if has("gui_running")
    "set guioptions +=e     " Use GUI tabs
    "set guioptions -=m     " Remove menubar
    set guioptions -=T      " Remove toolbar
    "set guitablabel=%N\ %t\ %M  " GUI tab labels
endif

" Indenting and Tabs {{{2

"set autoindent         "
"set smartindent        "
"set smarttab           "

"set expandtab          " Tabs to Spaces
set noexpandtab         " Tabs to Tabs

set shiftwidth=4        " Indent/outdent by four columns
"set softtabstop=4      " Indent as if four columns...?
set tabstop=4           " Indentation levels every four columns

" Python indenting {{{3
let g:pyindent_continue     = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_open_paren   = '&sw'
" let g:pyindent_continue   = '&sw * 2'

" Miscellaneous {{{2
set hidden              " Allow switching buffers with unwritten changes
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.pyc  " Do not list

" Performance {{{2
"set lazyredraw
"set nocul               " disable highlight current line
"set ttyfast             " speeds up page up/down?

" Search {{{2
set hlsearch            " Highlight search results
set ignorecase          " Ignore case
set inccommand=nosplit  " Incremental highlight during :%s
"set magic              " Escape like regular regexes; use \V to revert
set smartcase           " Ignore case if lower

" Undo {{{2
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Visual {{{2
set colorcolumn=80      " Column guide
set cursorline          " Highlight current line
set laststatus=2        " Show status line
set mouse=a             " Mouse interactivity
set number              " Line numbers

" AUTOCMDS {{{1

" Auto close preview {{{2

"autocmd CompleteDone * silent! pclose!
autocmd InsertLeave * silent! pclose!

" Conceal level {{{2

autocmd FileType markdown setlocal conceallevel=0
" TODO This isn't working...
"autocmd FileType tex setlocal conceallevel=0

" Disable continue comment on new line {{{2

autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Folding {{{2

autocmd FileType conf,markdown,python,vim,zsh let anyfold_activate=0
autocmd FileType conf,markdown,python,vim,zsh setlocal foldminlines=0

"autocmd FileType *       setlocal foldcolumn=3 foldmethod=indent
autocmd FileType conf     setlocal foldcolumn=3 foldmethod=expr   foldexpr=FoldConfig()
autocmd FileType markdown setlocal foldcolumn=3 foldmethod=expr   foldexpr=FoldMarkdown()
autocmd FileType vim,zsh  setlocal foldcolumn=3 foldmethod=marker

" Indenting and Tabs {{{2

autocmd FileType python setlocal tabstop=4

" Remove trailing whitespace on file save {{{2

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" COMMANDS {{{1

" Copy search matches {{{2
command! -register CopyMatches call <SID>CopyMatches(<q-reg>)

" FUNCTIONS {{{1

" Check backspace {{{2
function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Copy search matches {{{2
function! s:CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
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

" Fold text style {{{3

function! FoldTextStyle()
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 2

    let foldlinecount = v:foldend - v:foldstart
    let posttext = "  " . foldlinecount . " lines   +  ----"

    let spacetab = strpart('         ', 0, &tabstop)
    let line = substitute(line, '\t', spacetab, 'g')
    let line = strpart(line, 0, windowwidth - len(posttext))

    let filltext = repeat(" ", windowwidth - len(line) - len(posttext))

    return line . filltext . posttext
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

" KEYBOARD MAPPINGS {{{1

" Plugin bindings {{{2

" Denite bindings {{{3

nmap <C-p> :Denite -winheight=10 file buffer<CR>

" deoplete bindings {{{3

if match(&runtimepath, 'deoplete.nvim') != -1
    " inoremap <silent><expr> <Tab>
    "     \ pumvisible() ? "\<C-n>" :
    "     \ <SID>CheckBackspace() ? "\<Tab>" :
    "     \ deoplete#mappings#manual_complete()
endif

" fzf bindings {{{3
" TODO: Probably make buffers even more accessible
if match(&runtimepath, 'fzf') != -1
    nmap <Leader>b :Buffers<CR>
    nmap <Leader>f :Files<CR>
    nmap <C-p> :Files<CR>
    nmap <Leader>t :Tags<CR>
endif

" NERDTree bindings {{{3

nmap <Leader>f :NERDTreeToggle<CR>

" repmo-vim bindings {{{3
if match(&runtimepath, 'repmo-vim') != -1
    " Specific mappings if vim-sneak plugin enabled
    if match(&runtimepath, 'vim-sneak') != -1 "{{{4
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
    else "{{{4
        map <expr> ; repmo#LastKey(';')|sunmap ;
        map <expr> , repmo#LastRevKey(',')|sunmap ,

        noremap <expr> f repmo#ZapKey('f')|sunmap f
        noremap <expr> F repmo#ZapKey('F')|sunmap F
        noremap <expr> t repmo#ZapKey('t')|sunmap t
        noremap <expr> T repmo#ZapKey('T')|sunmap T
    endif "}}}

    " Non-specific mappings {{{4
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
    "}}}
endif

" Leader {{{2

" Black hole delete {{{3
nnoremap <Leader>d   "_d
vnoremap <Leader>d   "_d
nnoremap <Leader>x   "_x
vnoremap <Leader>x   "_x
nnoremap <Backspace> "_dd
vnoremap <Backspace> "_dd

" Buffer menu {{{3
nnoremap <Leader>b :buffers<CR>:b<Space>

" Clipboard (copy/paste) {{{3
nmap <silent> <Leader>p :set paste<CR>"+p:set nopaste<CR>
nmap <silent> <Leader>P :set paste<CR>"+P:set nopaste<CR>
"nmap <silent> <Leader><C-p> :set paste<CR>"+p:set nopaste<CR> " TODO paste inline
map  <silent> <Leader>y "+y
map  <silent> <Leader>Y "+Y

" Count search matches {{{3
nnoremap <Leader>s :%s///gn<left><left><left><left>
nnoremap <Leader>S :%s/\<lt>\>//gn<left><left><left><left><left><left>

" ctags toggle {{{3
noremap <Leader>t :TagbarToggle<CR><C-w><C-w>

" Cursor column toggle {{{3

noremap <Leader>v :set cursorcolumn!<CR>

" eregex toggle {{{3
nnoremap <Leader>/ :call eregex#toggle()<CR>

" Register menu {{{3
nnoremap <Leader>r :registers<CR>:put<Space>

" Relative numbering {{{3
nnoremap <Leader>n :set relativenumber!<CR>

" Spell checker {{{3
" toggle, next, previous, add, correct
map <leader>ss :setlocal spell!<CR>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sc z=

" Strip trailing whitespace {{{3
nnoremap <Leader><Space> :call <SID>StripTrailingWhitespaces()<CR>

" Word wrap, up/down visually {{{3
noremap <Leader>w :call <SID>ToggleWrap()<CR>

" Miscellaneous {{{2

"Black hole paste (in visual mode) {{{3
xnoremap <silent> p p:let @"=@0<CR>

" Folding {{{3
nnoremap <Space> za
vnoremap <Space> za

" Macro {{{3
nmap <silent> <F2> @q
nmap <silent> <F3> @@

" Navigate buffer {{{3
nnoremap <Tab>   :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <A-n>   :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p>   :bprevious<CR>:redraw<CR>:ls<CR>

" Navigate scroll 5 lines up/down {{{3
noremap <Down> 5<C-d>
noremap <Up>   5<C-u>

" Navigate up/down in wrapped text {{{3
nnoremap <Down> gj
nnoremap <Up>   gk
inoremap <Down> <C-o>gj
inoremap <Up>   <C-o>gk

" Navigate window {{{3
map ' <C-w>
map '' <C-w>w

" New line without insert mode (uses q register to mark) {{{3
nnoremap <CR> mqo<Esc>`q

" Save as sudo {{{3
cmap w!! w !sudo tee > /dev/null %
cmap x!! x !sudo tee > /dev/null %

" Search for visually selected text {{{3
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Swap lines {{{3
noremap <silent> <C-S-Up>   :call <SID>SwapUp()<CR>
noremap <silent> <C-S-Down> :call <SID>SwapDown()<CR>
noremap <silent> <C-k>      :call <SID>SwapUp()<CR>
noremap <silent> <C-j>      :call <SID>SwapDown()<CR>

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

