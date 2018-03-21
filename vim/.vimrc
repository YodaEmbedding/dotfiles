" Installation: Please install vim-plug then simply copy this to ~/.vimrc
" Author: Mateen Ulhaq <mulhaq2005@gmail.com>


" VIM-PLUG {{{1

" Installation {{{2

if has('nvim')
    if has('win32') | let plug_path = expand('~/AppData/Local/nvim/autoload/plug.vim')
    else            | let plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
    endif
else
    if has('win32') | let plug_path = expand('~/vimfiles/autoload/plug.vim')
    else            | let plug_path = expand('~/.vim/autoload/plug.vim')
    endif
endif

let plug_remote = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

if empty(glob(plug_path))
    silent execute "!curl -fLo " . plug_path . " --create-dirs " . plug_remote
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin {{{2
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Enabled {{{2
Plug 'Shougo/denite.nvim'                   " Fuzzy search/open files within directory
Plug 'Konfekt/FastFold'                     " Speed up lag caused by unnecessary evaluation of folding expressions/etc
Plug 'thaerkh/vim-indentguides'             " Indent guides
Plug 'Yggdroot/LeaderF'                     " Fuzzy search/open files within directory
Plug 'scrooloose/nerdcommenter'             " Commenting blocks e.g. \cb
Plug 'tmhedberg/SimpylFold'                 " Folding (Python)
Plug 'majutsushi/tagbar'                    " (RARELYUSED) ctags; bound to \t
Plug 'airblade/vim-gitgutter'               " Git gutter
Plug 'Twinside/vim-haskellFold'             " Folding (Haskell)
Plug 'kristijanhusak/vim-hybrid-material'   " Theme (Colorscheme)
Plug 'farmergreg/vim-lastplace'             " Reopen file last position
Plug 'junegunn/vim-peekaboo'                " Show registers during \", @, and <C-R>
Plug 'tpope/vim-repeat'                     " Repairs dot key for certain plugins (e.g. vim-sneak)
Plug 'justinmk/vim-sneak'                   " Use two character find (mapped to 's')
Plug 'tpope/vim-sleuth'                     " Automatically detect indent settings from file
Plug 'matze/vim-tex-fold'                   " Folding (LaTeX)
Plug 'nelstrom/vim-visual-star-search'      " Select visually then *
Plug 'bronson/vim-trailing-whitespace'      " Highlight trailing and :FixWhitespace

" Autocompletion {{{3
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'zchee/deoplete-jedi'                  " Autocompletion (Python)
Plug 'eagletmt/neco-ghc'                    " Autocompletion (Haskell)
Plug 'fs111/pydoc.vim'                      " Documentation  (Python)

" Disabled {{{2
" Possibly useful {{{3
"Plug 'othree/eregex.vim'                   " PCRE style regex (use :%S// to search and \/ to toggle / replacement on/off)
"Plug 'Houl/repmo-vim'                      " Repeat last motion using ; or ,
"Plug 'pseewald/vim-anyfold'                " Fold on indent
"Plug 'terryma/vim-multiple-cursors'        " Multiple cursors WITH REGEX?! OMG
"Plug 'tpope/vim-surround'                  " Change surrounding parenthesis, i.e. cs([
"Plug 'lervag/vimtex'                       " LaTeX

" Probably useless {{{3
"Plug 'ctrlpvim/ctrlp.vim'                  " Fuzzy search/open files within directory
"Plug '/usr/local/opt/fzf'
"Plug '/usr/bin/fzf'
"Plug 'junegunn/fzf.vim'                    " Fuzzy search/open files within directory
"Plug 'PotatoesMaster/i3-vim-syntax'        " Syntax highlighting (i3)
"Plug 'Yggdroot/indentLine'                 " Indent guides
"Plug 'scrooloose/nerdtree'                 " File explorer
"Plug 'python-mode/python-mode', {'for': 'python'}
"Plug 'vim-airline/vim-airline'             " Theme (statusline)
"Plug 'vim-airline/vim-airline-themes'      " Theme (statusline)
"Plug 'easymotion/vim-easymotion'           " Motion
"Plug 'terryma/vim-expand-region'           " Expand selection region using + and _
"Plug 'nathanaelkane/vim-indent-guides'     "
"Plug 'goldfeld/vim-seek'                   " Use two character find (mapped to 's')

" Autocompletion {{{3
"Plug 'Shougo/echodoc.vim'                  " Documentation in command line
"Plug 'davidhalter/jedi-vim'                " Autocompletion (Python)
"Plug 'ervandew/supertab'                   "
"Plug 'SirVer/ultisnips'                    " Snippet completion
"Plug 'ajh17/VimCompletesMe'                " Autocompletion
"Plug 'lifepillar/vim-mucomplete'           " Autocompletion
"Plug 'Valloric/YouCompleteMe'              " Autocompletion

" Colorscheme {{{3
"Plug 'sjl/badwolf'                         " Theme (Colorscheme)
"Plug 'junegunn/seoul256.vim'               " Theme (Colorscheme)
"Plug 'noahfrederick/vim-noctu'             " Theme (Colorscheme)
"Plug 'gkjgh/cobalt'                        " Theme (Colorscheme)
"Plug 'altercation/vim-colors-solarized'    " Theme (Colorscheme)

" Untried {{{2

" Evaluate next {{{3
"Plug 'maralla/completor.vim'               " Autocompletion
"Plug 'junegunn/vim-easy-align'             " Alignment
"Plug 'tommcdo/vim-lion'                    " Alignment

" Other {{{3
"Plug 'jiangmiao/auto-pairs'                " Auto-insert parens/quotes
"Plug 'chrisbra/NrrwRgn'                    " Oooh this is cool (extract buffer)
"Plug 'wincent/scalpel'                     " SublimeText-like word replace?
"Plug 'AndrewRadev/sideways.vim'            " Parameter swapping
"Plug 'ervandew/supertab'                   "
"Plug 'vim-syntastic/syntastic'             " Syntax (compile) checking
"Plug 'mbbill/undotree'                     "
"Plug 'justinmk/vim-dirvish'                " Directory viewer
"Plug 'svermeulen/vim-easyclip'             " (USEFUL)  Blackhole delete, smart yanking, etc
"Plug 'LucHermitte/lh-vim-lib'              " Library of functions for LucHermitte's scripts
"Plug 'LucHermitte/VimFold4C'               " Folding (C++)
"Plug 'ludovicchabant/vim-gutentags'        " Fast ctagging?
"Plug 'ivanov/vim-ipython'                  "
"Plug 'romainl/vim-qf'                      " Quickfix
"Plug 'romainl/vim-qlist'                   " Quickfix - Definition search
"Plug 'idbrii/vim-ripple'                   " REPL within vim
"Plug 'jpalardy/vim-slime'                  " Emacs like REPL
"Plug 'kana/vim-submode'                    " More modes
"Plug 'justinmk/vim-syntax-extra'           " More syntax highlighting
"Plug 'thaerkh/vim-workspace'               "
"Plug 'jreybert/vimagit'                    " vim git magic!!!
"Plug 'kkoenig/wimproved.vim'               " For Windows

" End {{{2
call plug#end()

" PLUGIN SETTINGS {{{1

" deoplete {{{2
let g:deoplete#enable_at_startup = 1

" deoplete-jedi {{{2
let g:deoplete#sources#jedi#server_timeout = 60

" indentguides {{{2
let g:indentguides_spacechar = '│'

" vim-sleuth {{{2
let b:sleuth_mixed_tabstop = 4

" THEMING {{{1

" Colorscheme {{{2
" Favorites: cobalt, desert, hybrid_reverse, hybrid_material, solarized
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

let g:enable_bold_font = 1

" Statusline {{{2

" Statusline definition {{{3
set statusline=                                 " Clear
set statusline+=%1*\                            " Color -
set statusline+=%t                              " Tail of the filename
set statusline+=%2*                             " Color
set statusline+=%h                              " Help file flag
set statusline+=%r                              " Read only flag
set statusline+=%3*                             " Color
set statusline+=%m                              " Modified flag
set statusline+=%=                              " Left/right separator
set statusline+=%4*\                            " Color -
set statusline+=%{&filetype}                    " Filetype
set statusline+=\ \                             " --
set statusline+=%{&fenc}                        " File encoding
set statusline+=[%{&ff}]                        " File format
set statusline+=[                               " Indent settings: begin
set statusline+=%{&expandtab?\"sp\":\"tab\"}\   " Indent settings
set statusline+=%{&shiftwidth}                  " Indent settings
set statusline+=]                               " Indent settings: end
set statusline+=\ %5*\ \ \                      " - Color ---
set statusline+=%2c                             " Cursor column
set statusline+=\ \                             " --
set statusline+=%2v                             " Cursor column (virtual)
set statusline+=\ \                             " --
set statusline+=(%l\ /\ %L)                     " Cursor line/total lines
set statusline+=\ \                             " --
set statusline+=%P                              " Percent through file

" Statusline colors {{{3
hi User1 ctermfg=250 ctermbg=234
hi User2 ctermfg=008 ctermbg=234
hi User3 ctermfg=143 ctermbg=234
hi User4 ctermfg=237 ctermbg=233
hi User5 ctermfg=238 ctermbg=233

" Window title {{{2
set title               " Change window title to current buffer
set titlestring=%t      " Change window title

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
    set guioptions -=m  " Remove menubar
    set guioptions -=T  " Remove toolbar
endif

" Indenting and Tabs {{{2
set shiftwidth=4        " Indent/outdent by n columns
set tabstop=4           " Indentation levels every n columns

" Python indenting {{{3
let g:pyindent_continue     = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_open_paren   = '&sw'

" VHDL indenting {{{3
let g:vhdl_indent_genportmap = 0

" Miscellaneous {{{2
set hidden              " Allow switching buffers with unwritten changes
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.pyc  " Do not list

" Search {{{2
set hlsearch            " Highlight search results
set ignorecase          " Ignore case
"set magic              " Escape like regular regexes; use \V to revert
set smartcase           " Ignore case if lower

if has('nvim')
    set inccommand=nosplit  " Incremental highlight during :%s
endif

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
set relativenumber      " Relative line numbers

" AUTOCMDS {{{1

" Auto close preview {{{2
autocmd InsertLeave * silent! pclose!

" Conceal level {{{2
autocmd FileType markdown setlocal conceallevel=0
" TODO This isn't working...
"autocmd FileType tex setlocal conceallevel=0

" Disable continue comment on new line {{{2
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Folding {{{2
autocmd FileType conf,markdown,python,vim,zsh let anyfold_activate=0
autocmd FileType conf,markdown,python,vim,zsh setlocal foldminlines=1

"autocmd FileType *       setlocal foldcolumn=3 foldmethod=indent
autocmd FileType conf     setlocal foldcolumn=3 foldmethod=expr   foldexpr=FoldConfig()
autocmd FileType markdown setlocal foldcolumn=3 foldmethod=expr   foldexpr=FoldMarkdown()
autocmd FileType vim,zsh  setlocal foldcolumn=3 foldmethod=marker

" Indenting and Tabs {{{2
autocmd FileType markdown setlocal expandtab
autocmd FileType python   setlocal expandtab

" Remove trailing whitespace on file save {{{2
autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Syntax highlighting {{{2
autocmd BufRead,BufNewFile *.cls set filetype=tex
autocmd BufRead,BufNewFile *.nxc set filetype=cpp

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

" ctags {{{3
noremap <Leader>t :TagbarToggle<CR><C-w><C-w>

" Denite {{{3
nmap <C-p> :Denite -winheight=10 file buffer<CR>
nmap <Leader>b :Denite -winheight=10 buffer<CR>

" deoplete {{{3
if match(&runtimepath, 'deoplete.nvim') != -1
    " inoremap <silent><expr> <Tab>
    "     \ pumvisible() ? "\<C-n>" :
    "     \ <SID>CheckBackspace() ? "\<Tab>" :
    "     \ deoplete#mappings#manual_complete()
endif

" eregex {{{3
nnoremap <Leader>/ :call eregex#toggle()<CR>

" fzf {{{3
if match(&runtimepath, 'fzf') != -1
    nmap <Leader>b :Buffers<CR>
    nmap <Leader>f :Files<CR>
    nmap <C-p> :Files<CR>
    nmap <Leader>t :Tags<CR>
endif

" indentLine {{{3
nnoremap <Leader>i :IndentLinesToggle<CR>

" repmo-vim {{{3
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

" Clipboard (copy/paste) {{{3
nmap <silent> <Leader>p :set paste<CR>"+p:set nopaste<CR>
nmap <silent> <Leader>P :set paste<CR>"+P:set nopaste<CR>
"nmap <silent> <Leader><C-p> :set paste<CR>"+p:set nopaste<CR> " TODO paste inline
map  <silent> <Leader>y "+y
map  <silent> <Leader>Y "+Y

" Count search matches {{{3
nnoremap <Leader>s :%s///gn<left><left><left><left>
nnoremap <Leader>S :%s/\<lt>\>//gn<left><left><left><left><left><left>

" Cursor column toggle {{{3
noremap <Leader>v :set cursorcolumn!<CR>

" File explorer (netrw) {{{3
nnoremap <Leader>F   :Lex<CR>

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

" Unfold all {{{3
nnoremap <Leader>z :set foldlevel=20<CR>

" Word wrap, up/down visually {{{3
noremap <Leader>w :call <SID>ToggleWrap()<CR>

" Miscellaneous {{{2

" Black hole paste (in visual mode) {{{3
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

" Paste from clipboard {{{3
inoremap <C-v> <C-o>:set paste<CR><C-o>"+P<C-o>:set nopaste<CR>

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

" Visual selection apply dot {{{3
vnoremap <silent> . :normal .<CR>

" Visual selection apply macro {{{3
vnoremap <silent> <F2> :normal @q<CR>
vnoremap <silent> <F3> :normal @@<CR>

" CHEATSHEET {{{1

" Useful Ex-mode commands
" Sort lines                :%!sort
" Sort after skipping       :sort n /.\{-}|/
" Reverse lines             :%!tap
" List of numbers           :put =range(1,10)

" TODO {{{1

" Free bindings: <S-d> <S-x> <S-s>

" Cycle through colorschemes (NextColors() function)
" Especially favorite colorschemes

" fzf, ripgrep
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
" https://www.reddit.com/r/vim/comments/3f0zbg/psa_if_youre_using_ctrlp_use_this_maintained_fork/?st=jdk5ylw4&sh=44df905a

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

