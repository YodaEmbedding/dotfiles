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
Plug 'Konfekt/'         . 'FastFold'                " Folding: Eliminate foldexpr evaulation lag
Plug 'Twinside/'        . 'vim-haskellFold'         " Folding: Haskell
Plug 'matze/'           . 'vim-tex-fold'            " Folding: LaTeX
Plug 'tmhedberg/'       . 'SimpylFold'              " Folding: Python
Plug 'scrooloose/'      . 'nerdcommenter'           " Functional: Commenting blocks e.g. \cb
Plug 'majutsushi/'      . 'tagbar'                  " Functional: (RARELYUSED) ctags; bound to \t
Plug 'Shougo/'          . 'denite.nvim'             " Functional: Fuzzy search/open files within directory
Plug 'Yggdroot/'        . 'LeaderF', { 'on': 'LeaderfFile' }  " Functional: Fuzzy search/open files within directory
Plug 'tpope/'           . 'vim-repeat'              " Functional: Repairs dot key for certain plugins (e.g. vim-sneak)
Plug 'nelstrom/'        . 'vim-visual-star-search'  " Functional: Select visually then *
Plug 'justinmk/'        . 'vim-sneak'               " Functional: Use two character find (mapped to 's')
Plug 'tweekmonster/'    . 'startuptime.vim'         " Miscellaneous: Startup breakdown
Plug 'tpope/'           . 'vim-sleuth'              " Tweak: Automatically detect indent settings from file
Plug 'farmergreg/'      . 'vim-lastplace'           " Tweak: Reopen file last position
Plug 'kristijanhusak/'  . 'vim-hybrid-material'     " Visual: Colorscheme
Plug 'airblade/'        . 'vim-gitgutter'           " Visual: Git gutter
Plug 'bronson/'         . 'vim-trailing-whitespace' " Visual: Highlight trailing and :FixWhitespace
Plug 'thaerkh/'         . 'vim-indentguides'        " Visual: Indent guides
Plug 'kshenoy/'         . 'vim-signature'           " Visual: Mark navigation
Plug 'junegunn/'        . 'vim-peekaboo'            " Visual: Show registers during \", @, and <C-R>

" Autocompletion {{{3
if has('nvim')
    Plug 'Shougo/'      . 'deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/'      . 'deoplete.nvim'
    Plug 'roxma/'       . 'nvim-yarp'
    Plug 'roxma/'       . 'vim-hug-neovim-rpc'
endif

Plug 'eagletmt/'        . 'neco-ghc'                " Autocompletion: Haskell
Plug 'zchee/'           . 'deoplete-jedi'           " Autocompletion: Python
Plug 'fs111/'           . 'pydoc.vim'               " Documentation: Python

" Disabled {{{2
" Possibly useful {{{3
"Plug 'pseewald/'       . 'vim-anyfold'             " Folding: Fold on indent
"Plug 'tpope/'          . 'vim-surround'            " Functional: Change surrounding parenthesis, e.g. cs([
"Plug 'terryma/'        . 'vim-multiple-cursors'    " Functional: Multiple cursors (using regexes... cool)
"Plug 'othree/'         . 'eregex.vim'              " Functional: PCRE style regex (use :%S// to search and \/ to toggle / replacement on/off)
"Plug 'Houl/'           . 'repmo-vim'               " Functional: Repeat last motion using ; or ,
"Plug 'lervag/'         . 'vimtex'                  " Tools: LaTeX
"Plug 'semanser/'       . 'vim-outdated-plugins'    " Visual: Show number of outdated plugins under statusline

" Probably useless {{{3
"Plug 'terryma/'        . 'vim-expand-region'       " Functional: Expand selection region using + and _
"Plug 'ctrlpvim/'       . 'ctrlp.vim'               " Functional: Fuzzy search/open files within directory
"Plug '/usr/local/opt/' . 'fzf'                     " Functional: Fuzzy search/open files within directory
"Plug '/usr/bin/'       . 'fzf'                     " Functional: Fuzzy search/open files within directory
"Plug 'junegunn/'       . 'fzf.vim'                 " Functional: Fuzzy search/open files within directory
"Plug 'easymotion/'     . 'vim-easymotion'          " Functional: Motion
"Plug 'goldfeld/'       . 'vim-seek'                " Functional: Use two character find (mapped to 's')
"Plug 'scrooloose/'     . 'nerdtree'                " Visual: File explorer
"Plug 'Yggdroot/'       . 'indentLine'              " Visual: Indent guides
"Plug 'nathanaelkane/'  . 'vim-indent-guides'       " Visual: Indent guides
"Plug 'vim-airline/'    . 'vim-airline'             " Visual: Statusline
"Plug 'vim-airline/'    . 'vim-airline-themes'      " Visual: Statusline
"Plug 'PotatoesMaster/  . 'i3-vim-syntax'           " Visual: Syntax highlighting (i3)
"Plug 'python-mode/'    . 'python-mode', {'for': 'python'}

" Autocompletion {{{3
"Plug 'Shougo/          . 'echodoc.vim'             " Documentation: Hint in command line
"Plug 'ajh17/           . 'VimCompletesMe'          " Autocompletion: General
"Plug 'lifepillar/      . 'vim-mucomplete'          " Autocompletion: General
"Plug 'Valloric/        . 'YouCompleteMe'           " Autocompletion: General
"Plug 'davidhalter/     . 'jedi-vim'                " Autocompletion: Python
"Plug 'SirVer/          . 'ultisnips'               " Autocompletion: Snippet completion
"Plug 'ervandew/        . 'supertab'                " Autocompletion: Tab

" Colorscheme {{{3
"Plug 'sjl/             . 'badwolf'                 " Visual: Colorscheme
"Plug 'gkjgh/           . 'cobalt'                  " Visual: Colorscheme
"Plug 'junegunn/        . 'seoul256.vim'            " Visual: Colorscheme
"Plug 'altercation/     . 'vim-colors-solarized'    " Visual: Colorscheme
"Plug 'noahfrederick/   . 'vim-noctu'               " Visual: Colorscheme

" Untried {{{2

" Evaluate next {{{3
"Plug 'maralla/         . 'completor.vim'           " Autocompletion: General
"Plug 'junegunn/        . 'vim-easy-align'          " Functional: Alignment
"Plug 'tommcdo/         . 'vim-lion'                " Functional: Alignment
"Plug 'nhooyr/          . 'neoman.vim'              " Tools: Pager (manpages)
"Plug 'justinmk/        . 'vim-dirvish'             " Visual: Directory viewer

" Other {{{3
"Plug 'LucHermitte/     . 'VimFold4C'               " Folding: C++
"Plug 'LucHermitte/     . 'lh-vim-lib'              " Folding: Library of functions for LucHermitte's scripts
"Plug 'jiangmiao/       . 'auto-pairs'              " Functional: Auto-insert parens/quotes
"Plug 'svermeulen/      . 'vim-easyclip'            " Functional: Blackhole delete, smart yanking, etc
"Plug 'chrisbra/        . 'NrrwRgn'                 " Functional: Extract buffer (oooh this is cool)
"Plug 'ludovicchabant/  . 'vim-gutentags'           " Functional: Fast ctagging?
"Plug 'kana/            . 'vim-submode'             " Functional: More modes
"Plug 'AndrewRadev/     . 'sideways.vim'            " Functional: Parameter swapping
"Plug 'romainl/         . 'vim-qf'                  " Functional: Quickfix
"Plug 'romainl/         . 'vim-qlist'               " Functional: Quickfix - Definition search
"Plug 'wincent/         . 'scalpel'                 " Functional: Sublime Text-like word replace? (Ctrl+D)
"Plug 'mbbill/          . 'undotree'                " Functional: Undo tree
"Plug 'ivanov/          . 'vim-ipython'             " Tools:
"Plug 'jpalardy/        . 'vim-slime'               " Tools: REPL Emacs-like
"Plug 'idbrii/          . 'vim-ripple'              " Tools: REPL within vim
"Plug 'vim-syntastic/   . 'syntastic'               " Tools: Syntax (compile) checking
"Plug 'kkoenig/         . 'wimproved.vim'           " Tweak: Windows systems
"Plug 'justinmk/        . 'vim-syntax-extra'        " Visual: More syntax highlighting
"Plug 'thaerkh/         . 'vim-workspace'           "
"Plug 'jreybert/        . 'vimagit'                 " vim git magic!!!

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
set statusline+=%{g:pluginUpdateStatus}         " Up to date plugins
set statusline+=\ \                             " --
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
set undodir=$HOME/.vim/undo " Where to save undo histories
set undofile                " Save undo's after file closes
set undolevels=1000         " How many undos
set undoreload=10000        " Number of lines to save for undo

" Visual {{{2
set colorcolumn=80      " Column guide
set cursorline          " Highlight current line
set laststatus=2        " Show status line
set mouse=a             " Mouse interactivity
set numberwidth=2       " Numbering column width
set relativenumber      " Relative line numbers
set scrolloff=2         " Keep some lines visible when scrolling to edges of screen

" AUTOCMDS {{{1

" Auto close preview {{{2
autocmd InsertLeave * silent! pclose!

" Autocompletion {{{2

autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Check up to date plugins {{{2
autocmd VimEnter * call CheckForUpdates()

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
autocmd FileType c,cpp,java,rust setlocal foldcolumn=3 foldmethod=syntax

" Indenting and Tabs {{{2
autocmd FileType markdown setlocal expandtab
autocmd FileType python   setlocal expandtab

" Remove trailing whitespace on file save {{{2
"autocmd FileType c,cpp,python autocmd BufWritePre <buffer> :FixWhitespace

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

" Check for plugin updates {{{2
" Modified from https://gitbub.com/semanser/vim-outdated-plugins
function! s:JobHandlerVim(chanell, msg)
    if (a:msg =~ "is behind")
        let g:needToUpDate += 1
        let g:pluginUpdateStatus = string(g:needToUpDate) . ' new updates'
    endif
endfunction

function! s:JobHandlerNeovim(job_id, data, event) dict
    if (join(a:data) =~ "is behind")
        let g:needToUpDate += 1
        let g:pluginUpdateStatus = string(g:needToUpDate) . ' new updates'
    endif
endfunction

function! CheckForUpdates()
    let g:needToUpDate = 0
    let g:pluginUpdateStatus = ''
    let s:callbacksNeovim = {'on_stdout': function('s:JobHandlerNeovim')}
    let s:callbacksVim    = {'out_cb':    function('s:JobHandlerVim')}

    " TODO check only activated plugins and not all downloaded
    if has('nvim')
        for key in keys(g:plugs)
            let job2 = jobstart( ['bash', '-c', "cd " . g:plugs[key].dir ." && git remote update && git status -uno"], s:callbacksNeovim)
        endfor
    else
        for key in keys(g:plugs)
            let job2 = job_start(['bash', '-c', "cd " . g:plugs[key].dir ." && git remote update && git status -uno"], s:callbacksVim)
        endfor
    endif
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
nnoremap <C-p>     :Denite -winheight=10 file buffer<CR>
nnoremap <Leader>b :Denite -winheight=10 buffer<CR>

" deoplete {{{3
if match(&runtimepath, 'deoplete.nvim') != -1
    " TODO RARELYUSED
    " inoremap <silent><expr> <Tab>
    "     \ pumvisible() ? "\<C-n>" :
    "     \ <SID>CheckBackspace() ? "\<Tab>" :
    "     \ deoplete#mappings#manual_complete()
endif

inoremap <silent> <CR> <C-r>=deoplete#close_popup()<CR><CR>

" fzf {{{3
if match(&runtimepath, 'fzf') != -1
    nnoremap <Leader>b :Buffers<CR>
    nnoremap <Leader>f :Files<CR>
    nnoremap <C-p>     :Files<CR>
    nnoremap <Leader>t :Tags<CR>
endif

" LeaderF {{{3
nnoremap <leader>f :LeaderfFile<CR>

" Leader {{{2

" Clipboard (copy/paste) {{{3
nnoremap <silent> <Leader>p :set paste<CR>"+p:set nopaste<CR>
nnoremap <silent> <Leader>P :set paste<CR>"+P:set nopaste<CR>
noremap  <silent> <Leader>y "+y
noremap  <silent> <Leader>Y "+Y

" File explorer (netrw) {{{3
" TODO RARELYUSED
nnoremap <Leader>F   :Lex<CR>

" Spell checker {{{3
" TODO RARELYUSED
" toggle, next, previous, add, correct
noremap <leader>ss :setlocal spell!<CR>
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>sc z=

" Strip trailing whitespace {{{3
nnoremap <Leader><Space> :FixWhitespace<CR>

" Word wrap, up/down visually {{{3
noremap <Leader>w :call <SID>ToggleWrap()<CR>

" Navigation {{{2

" Navigate buffers {{{3
nnoremap <S-Tab> :bprevious<CR>
nnoremap <Tab>   :bnext<CR>
nnoremap gb      :ls<CR>:b<Space>

" Miscellaneous {{{2

" Black hole delete {{{3
nnoremap <Backspace> "_dd
vnoremap <Backspace> "_dd

" Black hole paste (in visual mode) {{{3
xnoremap <silent> p p:let @"=@0<CR>

" Close location list {{{3
autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>

" Folding {{{3
nnoremap <Space> za
vnoremap <Space> za

" Macro {{{3
nnoremap <silent> <F2> @q
nnoremap <silent> <F3> @@

" New line without insert mode (uses q register to mark) {{{3
nnoremap <CR> mqo<Esc>`q

" Paste from clipboard {{{3
inoremap <C-v> <C-o>:set paste<CR><C-o>"+P<C-o>:set nopaste<CR>

" Save as sudo {{{3
" TODO RARELYUSED
cmap w!! w !sudo tee > /dev/null %
cmap x!! x !sudo tee > /dev/null %

" Search for visually selected text {{{3
" TODO RARELYUSED
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

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

" Free bindings: <S-d> <S-x> <S-s> '

" Cleanup (RARELYUSED)
" PLUGIN SETTINGS
" THEMING
" OPTIONS
" AUTOCMDS
" COMMANDS
" FUNCTIONS
" KEYBOARD MAPPINGS

" LeaderF, CtrlP, Denite, vim builtins

" Indent guide unobtrusive color
" Theme: tomorrow night

" fzf, ripgrep
" http://owen.cymru/fzf-ripgrep-navigate-with-bash-faster-than-ever-before/
" https://www.reddit.com/r/vim/comments/3f0zbg/psa_if_youre_using_ctrlp_use_this_maintained_fork/?st=jdk5ylw4&sh=44df905a

" NextColors() Cycle through favorite colorschemes

" Deoplete bindings
" https://vi.stackexchange.com/questions/9468/cant-get-deoplete-plugin-working-in-neovim/9554
" "use <tab> for completion

" vim-ghost, vim-anywhere

