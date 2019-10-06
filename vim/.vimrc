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

if empty(glob(plug_path))
    let plug_remote = "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    silent execute "!curl -fLo " . plug_path . " --create-dirs " . plug_remote
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Begin {{{2
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Check if plugin loaded {{{2
function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&rtp, g:plugs[a:name].dir) >= 0)
endfunction

" Enabled {{{2
Plug 'ryankuczka/'      . 'vim-pyfold'              " Folding: Python
Plug 'tpope/'           . 'vim-surround'            " Functional: Change surrounding parenthesis, e.g. cs([
Plug 'tomtom/'          . 'tcomment_vim'            " Functional: Commenting
Plug 'tpope/'           . 'vim-repeat'              " Functional: Repairs dot key for certain plugins (e.g. vim-sneak)
Plug 'junegunn/'        . 'fzf.vim'                 " Functional: Search
Plug 'junegunn/'        . 'fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'nelstrom/'        . 'vim-visual-star-search'  " Functional: Select visually then *
Plug 'wellle/'          . 'targets.vim'             " Functional: Text objects
Plug 'ludovicchabant/'  . 'vim-gutentags'           " Miscellaneous: Ctags
Plug 'sheerun/'         . 'vim-polyglot'            " Miscellaneous: Language pack
Plug 'lervag/'          . 'vimtex'                  " Tools: LaTeX
Plug 'jpalardy/'        . 'vim-slime'               " Tools: REPL Emacs-like
Plug 'editorconfig/'    . 'editorconfig-vim'        " Tweak: Apply .editorconfig settings
Plug 'farmergreg/'      . 'vim-lastplace'           " Tweak: Reopen file last position
Plug 'tyrannicaltoucan/'. 'vim-quantum'             " Visual: Colorscheme
Plug 'airblade/'        . 'vim-gitgutter'           " Visual: Git gutter
Plug 'bronson/'         . 'vim-trailing-whitespace' " Visual: Highlight trailing and :FixWhitespace
Plug 'unblevable/'      . 'quick-scope'             " Visual: Highlight unique characters per word in line (for find)
Plug 'kshenoy/'         . 'vim-signature'           " Visual: Mark navigation
Plug 'romainl/'         . 'vim-cool'                " Visual: Search highlighting tweaks

if !has('nvim')
    Plug 'roxma/'       . 'nvim-yarp'               " Functional: Update framework
    Plug 'roxma/'       . 'vim-hug-neovim-rpc'      " Functional: RPC client compatibility layer
    " Also, run: pip3 install --user pynvim
endif

" Autocompletion {{{3
" Plug 'autozimu/'        . 'LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ }                                           " Functional: LSP

Plug 'neoclide/'        . 'coc.nvim', {
    \ 'tag': '*',
    \ 'do': { -> coc#util#install()}
    \ }                                             " Functional: LSP

" Extensions:
" coc-css
" coc-git
" coc-highlight
" coc-html
" coc-json
" coc-lists
" coc-python
" coc-rls
" coc-vimlsp
" coc-yaml

" Language servers:
" Bash: bash-language-server
" C++: ccls
" Clojure: clojure-lsp
" Haskell: haskell-ide-engine
" Rust: rls, racer

" Disabled {{{2
" Sometimes useful {{{3
"Plug 'Konfekt/'         . 'FastFold'                " Folding: Eliminate foldexpr evaluation lag
"Plug 'matze/'           . 'vim-tex-fold'            " Folding: LaTeX
"Plug 'junegunn/'        . 'vim-easy-align'          " Functional: Alignment
"Plug 'vim-scripts/'     . 'argtextobj.vim'          " Functional: Change function argument, e.g. cia
"Plug 'majutsushi/'      . 'tagbar'                  " Functional: ctags; bound to \t
"Plug 'w0rp/'            . 'ale'                     " Functional: LSP, Linting
"Plug 'kana/'            . 'vim-submode'             " Functional: New modes
"Plug 'Shougo/'          . 'denite.nvim'             " Functional: Search
"Plug 'tweekmonster/'    . 'startuptime.vim'         " Miscellaneous: Startup breakdown
"Plug 'junegunn/'        . 'vim-peekaboo'            " Visual: Show registers during \", @, and <C-R>

" Possibly useful {{{3
"Plug 'pseewald/'        . 'vim-anyfold'             " Folding: Fold on indent
"Plug 'msuperdock/'      . 'vim-foldout'             " Folding: Fold navigation mode (currently broken?)
"Plug 'Twinside/'        . 'vim-haskellFold'         " Folding: Haskell
"Plug 'tmhedberg/'       . 'SimpylFold'              " Folding: Python
"Plug 'sicariusnoctis/'  . 'VimpyFold'               " Folding: Python
"Plug 'tpope/'           . 'vim-commentary'          " Functional: Commenting
"Plug 'takac/'           . 'vim-hardtime'            " Functional: Disable repeat hjkl movements
"Plug 'Yggdroot/'        . 'LeaderF', { 'on': 'LeaderfFile' }  " Functional: Fuzzy search/open files within directory
"Plug 'terryma/'         . 'vim-multiple-cursors'    " Functional: Multiple cursors (using regexes... cool)
"Plug 'othree/'          . 'eregex.vim'              " Functional: PCRE style regex (use :%S// to search and \/ to toggle / replacement on/off)
"Plug 'Houl/'            . 'repmo-vim'               " Functional: Repeat last motion using ; or ,
"Plug 'justinmk/'        . 'vim-sneak'               " Functional: Use two character find (mapped to 's')
"Plug 'dag/'             . 'vim2hs'                  " Miscellaneous: Haskell  (DOUBLE INDENTS :()
"Plug 'rhysd/'           . 'git-messenger.vim'       " Tools: Git commit history
"Plug 'buztard/'         . 'vim-rel-jump'            " Tweak: Add to relative jk motions to jumpstack
"Plug 'tpope/'           . 'vim-sleuth'              " Tweak: Automatically detect indent settings from file
"Plug 'justinmk/'        . 'vim-dirvish'             " Visual: Directory viewer
"Plug 'thaerkh/'         . 'vim-indentguides'        " Visual: Indent guides
"Plug 'semanser/'        . 'vim-outdated-plugins'    " Visual: Show number of outdated plugins under statusline
"Plug 'yuttie/'          . 'comfortable-motion.vim'  " Visual: Smooth scrolling
"Plug 'terryma/'         . 'vim-smooth-scroll'       " Visual: Smooth scrolling

" Colorscheme {{{3
"Plug 'sjl/              . 'badwolf'                 " Visual: Colorscheme
"Plug 'gkjgh/            . 'cobalt'                  " Visual: Colorscheme
"Plug 'archSeer/'        . 'colibri.vim'             " Visual: Colorscheme (purple, cloudy)
"Plug 'junegunn/         . 'seoul256.vim'            " Visual: Colorscheme
"Plug 'altercation/      . 'vim-colors-solarized'    " Visual: Colorscheme
"Plug 'kristijanhusak/'  . 'vim-hybrid-material'     " Visual: Colorscheme
"Plug 'noahfrederick/    . 'vim-noctu'               " Visual: Colorscheme

" Untried {{{2

" Evaluate next {{{3
"Plug 'maralla/'         . 'completor.vim'           " Autocompletion: General
"Plug 'tommcdo/'         . 'vim-lion'                " Functional: Alignment
"Plug 'nhooyr/'          . 'neoman.vim'              " Tools: Pager (manpages)

" Other {{{3
"Plug 'LucHermitte/'     . 'VimFold4C'               " Folding: C++
"Plug 'LucHermitte/'     . 'lh-vim-lib'              " Folding: Library of functions for LucHermitte's scripts
"Plug 'jiangmiao/'       . 'auto-pairs'              " Functional: Auto-insert parens/quotes
"Plug 'svermeulen/'      . 'vim-easyclip'            " Functional: Blackhole delete, smart yanking, etc
"Plug 'chrisbra/'        . 'NrrwRgn'                 " Functional: Extract buffer (oooh this is cool)
"Plug 'kana/'            . 'vim-submode'             " Functional: More modes
"Plug 'AndrewRadev/'     . 'sideways.vim'            " Functional: Parameter swapping
"Plug 'romainl/'         . 'vim-qf'                  " Functional: Quickfix
"Plug 'romainl/'         . 'vim-qlist'               " Functional: Quickfix - Definition search
"Plug 'wincent/'         . 'scalpel'                 " Functional: Sublime Text-like word replace? (Ctrl+D)
"Plug 'mbbill/'          . 'undotree'                " Functional: Undo tree
"Plug 'ivanov/'          . 'vim-ipython'             " Tools:
"Plug 'idbrii/'          . 'vim-ripple'              " Tools: REPL within vim
"Plug 'vim-syntastic/'   . 'syntastic'               " Tools: Syntax (compile) checking
"Plug 'kkoenig/'         . 'wimproved.vim'           " Tweak: Windows systems
"Plug 'justinmk/'        . 'vim-syntax-extra'        " Visual: More syntax highlighting
"Plug 'thaerkh/'         . 'vim-workspace'           "
"Plug 'jreybert/'        . 'vimagit'                 " vim git magic!!!

" End {{{2
call plug#end()

" PLUGIN SETTINGS {{{1

" LanguageClient-neovim {{{2
let g:LanguageClient_autoStart = 1
let g:LanguageClient_settingsPath = expand('~/.local/share/nvim/settings.json')
let g:LanguageClient_serverCommands = {
    \ 'clojure': ['bash', '-c', 'clojure-lsp'],
    \ 'fortran': ['fortls', '--symbol_skip_mem', '--incrmental_sync', '--autocomplete_no_prefix'],
    \ 'python': ['pyls'],
    \ 'rust': ['rustup', 'run', 'beta', 'rls'],
    \ }
    " \ 'python': ['dotnet', 'exec', '~/.local/share/microsoft-python-language-server/Microsoft.Python.LanguageServer.dll'],

" nnoremap <silent> <F5> :call LanguageClient_contextMenu()<CR>
" nnoremap <silent> K    :call LanguageClient#textDocument_hover()<CR>
" nnoremap <silent> gd   :call LanguageClient#textDocument_definition()<CR>
" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" tcomment_vim {{{2
let g:tcomment_mapleader1 = ''
let g:tcomment_types = {'c': '// %s'}

" vim-gutentags {{{2
let g:gutentags_file_list_command = 'rg --files'

" vim-polyglot {{{2
let g:polyglot_disabled = ['latex', 'python-ident', 'tex']

" vim-slime {{{2
let g:slime_target = "tmux"
" let g:slime_python_ipython = 1

" vimtex {{{2
let g:vimtex_compiler_latexmk = {
    \ 'build_dir': 'out'
    \ }

" THEMING {{{1

" Colorscheme {{{2
" Favorites: cobalt, desert, hybrid_reverse, hybrid_material, quantum, solarized
let g:quantum_black=1
colorscheme quantum

" Colors {{{2
set background=dark
if exists('+termguicolors')
    if !has('nvim')
        let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    endif
    set termguicolors
endif

"hi Normal          guibg=#332331
hi Normal           guibg=NONE    ctermbg=NONE
hi Normal           guifg=Grey70  ctermfg=249

hi ColorColumn      guibg=#372735
hi CursorLine       guibg=#402B3D
hi ExtraWhitespace  guibg=#473745
hi Folded           guibg=#1E161F
hi Folded           guifg=#6f6f6f
hi LineNr           guifg=#6f6f6f
hi MatchParen       guibg=#446677
hi MatchParen       guifg=#dddddd
hi Pmenu            guibg=#473745

hi CocErrorFloat            guifg=#cc6666
hi CocErrorVirtualText      guifg=#503B4D
hi CocWarningVirtualText    guifg=#503B4D
hi CocInfoVirtualText       guifg=#503B4D

" NOTE Temporary fix
autocmd User CocOpenFloat
    \   if exists('w:float')
    \ |     setl colorcolumn=
    \ | endif

if has('gui_running')
    hi Normal guibg=DarkSlateGrey
    hi Normal guifg=PapayaWhip
endif

" Font {{{2
if has("gui_running")
    set guifont=Roboto\ Mono\ 16
endif

let g:enable_bold_font = 1

" Statusline {{{2

" Statusline definition {{{3
set statusline=                                 " Clear
set statusline+=\                               " -
set statusline+=%t                              " Tail of the filename
set statusline+=%h                              " Help file flag
set statusline+=%r                              " Read only flag
set statusline+=%m                              " Modified flag
set statusline+=%=                              " Left/right separator
set statusline+=\                               " -
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
set statusline+=\ \ \ \                         " ----
set statusline+=%2v                             " Cursor column (virtual)
set statusline+=\ \                             " --
set statusline+=(%l\ /\ %L)                     " Cursor line/total lines

" Statusline colors {{{3
hi StatusLine guibg=NONE ctermbg=NONE
hi StatusLine guifg=NONE ctermfg=NONE
hi StatusLine gui=NONE   cterm=NONE

" Window title {{{2
set title               " Change window title to current buffer
set titlestring=%t      " Change window title

" Highlight groups {{{2
autocmd BufEnter * syn keyword Todo NOTE  containedin=.*Comment
autocmd BufEnter * syn keyword Todo DEBUG containedin=.*Comment

" OPTIONS {{{1

" Conceal {{{2
set conceallevel=0
let g:tex_conceal = ""
let g:vim_json_syntax_conceal = 0

" Folding {{{2
set fillchars=fold:\ 
set foldlevelstart=20
set foldnestmax=4
set foldtext=FoldTextStyle()

" GUI {{{2
if has("gui_running")
    set guioptions -=m  " Remove menubar
    set guioptions -=T  " Remove toolbar
endif

" Indenting, Tabs, Spacing {{{2
set expandtab
set nojoinspaces        " Single spaces joining when e.g. `gqip`
set shiftround          " Round [>>] to nearest multiple of shiftwidth
set shiftwidth=4        " Spaces [>>]  key is equivalent to
set softtabstop=4       " Spaces [tab] key is equivalent to
set tabstop=4           " Tab display width

" Python indenting {{{3
let g:pyindent_continue     = '&sw'
let g:pyindent_nested_paren = '&sw'
let g:pyindent_open_paren   = '&sw'

" VHDL indenting {{{3
let g:vhdl_indent_genportmap = 0

" Miscellaneous {{{2
set hidden              " Allow switching buffers with unwritten changes
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.pyc  " Do not list
set wildmenu
set wildmode=longest,list,full

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
let &colorcolumn=join(range(81,999), ",") " Column guide
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
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Check up to date plugins {{{2
autocmd VimEnter * call CheckForUpdates()

" coc.nvim {{{2
if PlugLoaded('coc.nvim')
    set updatetime=50
    autocmd CursorHold * silent     call CocActionAsync('highlight')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd FileType python let b:coc_root_patterns = ['.env', '.git']
endif

" Conceal level {{{2
autocmd FileType markdown setlocal conceallevel=0

" Disable continue comment on new line {{{2
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Folding {{{2
autocmd FileType conf,markdown,python,vim,zsh let anyfold_activate=0
autocmd FileType conf,markdown,python,vim,zsh setlocal foldminlines=1

"autocmd FileType *       setlocal foldmethod=indent
autocmd FileType conf     setlocal foldmethod=expr   foldexpr=FoldConfig()
autocmd FileType i3       setlocal foldmethod=expr   foldexpr=FoldConfig()
autocmd FileType fortran  setlocal foldmethod=expr   foldexpr=FoldFortran()
autocmd FileType markdown setlocal foldmethod=expr   foldexpr=FoldMarkdown()
autocmd FileType vim,zsh  setlocal foldmethod=marker
autocmd FileType c,cpp    setlocal foldmethod=syntax
autocmd FileType java     setlocal foldmethod=syntax
autocmd FileType rust     setlocal foldmethod=syntax foldnestmax=2
autocmd FileType python   setlocal foldtext=FoldTextStyle()

" Indenting and Tabs {{{2
autocmd FileType fortran  setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType haskell  setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType lisp     setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType markdown setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType python   setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType tex      setlocal expandtab shiftwidth=2 softtabstop=4 tabstop=4

let fortran_do_enddo=1
let fortran_free_source=1
let fortran_fold=1

" Remove trailing whitespace on file save {{{2
"autocmd FileType c,cpp,python autocmd BufWritePre <buffer> :FixWhitespace

" Syntax highlighting {{{2
autocmd BufRead,BufNewFile *.cls set filetype=tex
autocmd BufRead,BufNewFile *.nxc set filetype=cpp

" COMMANDS {{{1

" Copy search matches {{{2
command! -register CopyMatches call <SID>CopyMatches(<q-reg>)

" fzf {{{2
if PlugLoaded('fzf.vim')
    command! -bang -nargs=? -complete=dir LocateFiles
        \ call fzf#run(fzf#wrap({
        \     'source': 'locate --database=./.locate.db <q-args>',
        \     'options': '-m' },
        \   <bang>0))

    command! -bang -nargs=* -complete=dir SmartFiles call <SID>SmartFiles(<q-args>)
endif

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

" TODO check only activated plugins and not all downloaded
function! CheckForUpdates()
    let g:needToUpDate = 0
    let g:pluginUpdateStatus = ''
    let Jobstart = has('nvim') ? function("jobstart") : function("job_start")
    let callbacks = has('nvim') ?
        \ {'on_stdout': function('s:JobHandlerNeovim')} :
        \ {'out_cb':    function('s:JobHandlerVim')}

    for key in keys(g:plugs)
        let cmd = "cd " . g:plugs[key].dir ." && git remote update && git status -uno"
        let _ = Jobstart(['bash', '-c', cmd], callbacks)
    endfor
endfunction

" coc.nvim {{{2
function! s:CocDocumentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Copy search matches {{{2
function! s:CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

" Denite configure options {{{2
function! s:denite_profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

" Folding {{{2
" Fold config files {{{3
function! FoldConfig()
    let thisline = getline(v:lnum)
    let matchline = matchstr(thisline, '^#\+.\+#\+$')
    let match = matchstr(matchline, '^#*')
    let level = strlen(match)

    if level > 0 | return ">1" | endif
    return "="
endfunction

" Fold Fortran files {{{3
function! FoldFortran()
    let thisline = getline(v:lnum)
    let match_start = match(thisline, '^\s*\(subroutine\|function\|pure function\|elemental function\)')       != -1
    let match_end   = match(thisline, '^\s*end program') != -1

    if match_start | return ">1" | endif
    if match_end   | return ">0" | endif
    return "="
endfunction

" Fold markdown files {{{3
function! FoldMarkdown()
    let thisline = getline(v:lnum)
    let match = matchstr(thisline, '^#*')
    let level = strlen(match)

    if level > 0 | return ">" . string(level) | endif
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

" fzf.vim {{{2
function! s:get_git_root()
    let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
    return v:shell_error ? '' : root
endfunction

function! s:SmartFiles(...)
    let root = s:get_git_root()
    if empty(root)
        return call("fzf#vim#files", a:000)
    else
        return call("fzf#vim#gitfiles", a:000)
    endif
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

" coc.nvim {{{3
if PlugLoaded('coc.nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
    inoremap <silent><expr> <c-k> CocActionAsync('showSignatureHelp')
    nnoremap <silent> K :call <SID>CocDocumentation()<CR>
    nmap <silent> [c <Plug>(coc-diagnostic-prev)
    nmap <silent> ]c <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <leader>=  <Plug>(coc-format-selected)
    xmap <leader>=  <Plug>(coc-format-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>ac <Plug>(coc-codeaction)
    nmap <leader>qf <Plug>(coc-fix-current)
    nmap <leader>rn <Plug>(coc-rename)

    nnoremap <expr><C-h> (exists('w:float') ?
        \ ":call coc#util#float_hide()<CR>" :
        \ coc#util#has_float() ?
        \     ":call coc#util#float_jump()<CR>" :
        \     ":call CocAction('doHover')<CR>")

    nnoremap <silent> <space><space> :<C-u>CocList<CR>
    nnoremap <silent> <C-space>      :<C-u>CocListResume<CR>

    nnoremap <silent> <space>c  :<C-u>CocList commands<CR>
    nnoremap <silent> <space>d  :<C-u>CocList diagnostics<CR>
    nnoremap <silent> <space>m  :<C-u>CocList marks<CR>
    nnoremap <silent> <space>o  :<C-u>CocList outline<CR>
    nnoremap <silent> <space>q  :<C-u>CocList quickfix<CR>
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<CR>
    nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
endif

" Denite {{{3
if PlugLoaded('denite.nvim')
    " <Tab>         List buffers
    " ,             List files in current directory recursively (using fd)
    " <Leader>f     List files in current directory recursively
    " <Leader>d     List files in current directory
    " <Leader>s     Search current directory
    " <Leader>j     Search current directory for occurences of word under cursor
    nnoremap <Tab>     :Denite buffer     <CR>
    nnoremap ,         :Denite file/rec/fd<CR>
    nnoremap <Leader>f :Denite file/rec   <CR>
    nnoremap <Leader>d :Denite file       <CR>
    nnoremap <Leader>s :<C-u>Denite grep:. -no-empty -mode=normal<CR>
    nnoremap <Leader>j :<C-u>DeniteCursorWord grep:. -mode=normal<CR>

    call denite#custom#alias('source', 'file/rec/fd', 'file/rec')
    call denite#custom#var('file/rec/fd', 'command',
        \ ['fd', '--type=f', '--follow', '--hidden', '--full-path', '--color=never', '--exclude=.git', ''])

    let s:denite_options = {'default' : {
        \ 'auto_resize': 1,
        \ 'highlight_matched_char': 'Function',
        \ 'highlight_matched_range': 'Normal',
        \ 'prompt': 'λ:',
        \ 'prompt_highlight': 'Function',
        \ }}

    call s:denite_profile(s:denite_options)
endif

" fzf {{{3
if PlugLoaded('fzf.vim')
    nnoremap <Tab>     :Buffers<CR>
    nnoremap ,         :SmartFiles<CR>
    nnoremap <Leader>s :LocateFiles .<CR>
    nnoremap <Leader>f :Files<CR>
    nnoremap <Leader>F :Files %:h<CR>
    nnoremap <Leader>g :GFiles<CR>
    nnoremap <Leader>h :History<CR>
    nnoremap <Leader>l :Lines<CR>
    nnoremap <Leader>a :Ag!<CR>
    nnoremap <Leader>r :Rg!<CR>
    nnoremap <Leader>m :Marks<CR>
    nnoremap <Leader>t :Tags<CR>
endif

" Leader {{{2

" Strip trailing whitespace {{{3
nnoremap <Leader><Space> :FixWhitespace<CR>

" Word wrap, up/down visually {{{3
noremap <Leader>w :call <SID>ToggleWrap()<CR>

" Navigation {{{2

" Navigate buffers {{{3
nnoremap <S-Tab> :b#<CR>
nnoremap gb      :ls<CR>:b<Space>

" Navigate jumpstack {{{3
nnoremap <C-P> <C-I>

" Scroll {{{3
nnoremap <C-j> <C-f>
nnoremap <C-k> <C-b>

" Miscellaneous {{{2

" Black hole delete {{{3
nnoremap <Backspace> "_dd
vnoremap <Backspace> "_dd

" Black hole paste (in visual mode) {{{3
xnoremap <silent> p p:let @"=@0<CR>

" Clipboard paste {{{3
inoremap <C-v> <C-o>"+p

" Close location list {{{3
autocmd FileType qf nnoremap <buffer> <CR> <CR>:lclose<CR>

" Folding {{{3
" nnoremap <Space> zA
" vnoremap <Space> zA

" nnoremap <C-Space> za
" vnoremap <C-Space> za

" Macro {{{3
nnoremap <silent> <F2> @q
nnoremap <silent> <F3> @@

" Paste mode toggle {{{3
set pastetoggle=<F4>

" Save as sudo {{{3
" TODO RARELYUSED
cmap w!! w !sudo tee > /dev/null %
cmap x!! x !sudo tee > /dev/null %

" Save jump for up/down {{{3
nnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'
vnoremap <expr> j (v:count >= 1 ? "m`" . v:count : '') . 'j'

nnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'
vnoremap <expr> k (v:count >= 1 ? "m`" . v:count : '') . 'k'

" Search for visually selected text {{{3
" TODO RARELYUSED
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Search for whole word {{{3
nnoremap <C-_> /\<\><Left><Left>

" Sort {{{3
nnoremap gs vip:sort<CR>
vnoremap gs :sort<CR>

" Visual selection apply dot {{{3
vnoremap <silent> . :normal .<CR>

" Visual selection apply macro {{{3
vnoremap <silent> <F2> :normal @q<CR>
vnoremap <silent> <F3> :normal @@<CR>
