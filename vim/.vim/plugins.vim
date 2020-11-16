" Installation {{{1
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

" Begin {{{1
if has('nvim')
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif

" Check if plugin loaded {{{1
function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name) &&
        \ isdirectory(g:plugs[a:name].dir) &&
        \ stridx(&runtimepath, trim(g:plugs[a:name].dir, "/")) >= 0)
endfunction

" Enabled {{{1
Plug 'tpope/'           . 'vim-surround'            " Functional: Change surrounding parenthesis, e.g. cs([
Plug 'tomtom/'          . 'tcomment_vim'            " Functional: Commenting
Plug 'tpope/'           . 'vim-repeat'              " Functional: Repairs dot key for certain plugins (e.g. vim-sneak)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Functional: Search
Plug 'junegunn/fzf.vim'                             " Functional: Search
Plug 'nelstrom/'        . 'vim-visual-star-search'  " Functional: Select visually then *
Plug 'SirVer/'          . 'ultisnips'               " Functional: Snippets (engine)
Plug 'honza/'           . 'vim-snippets'            " Functional: Snippets (snippets)
Plug 'wellle/'          . 'targets.vim'             " Functional: Text objects
Plug 'bps/'             . 'vim-textobj-python'      " Functional: Text objects
Plug 'kana/'            . 'vim-textobj-user'        " Functional: Text objects
Plug 'sheerun/'         . 'vim-polyglot'            " Miscellaneous: Language pack
Plug 'lervag/'          . 'vimtex'                  " Tools: LaTeX
Plug 'tpope/'           . 'vim-eunuch'              " Tools: UNIX sugars on mv, rm, rename, ...
Plug 'editorconfig/'    . 'editorconfig-vim'        " Tweak: Apply .editorconfig settings
Plug 'farmergreg/'      . 'vim-lastplace'           " Tweak: Reopen file last position
Plug 'tyrannicaltoucan/'. 'vim-quantum'             " Visual: Colorscheme
Plug 'airblade/'        . 'vim-gitgutter'           " Visual: Git gutter
Plug 'bronson/'         . 'vim-trailing-whitespace' " Visual: Highlight trailing and :FixWhitespace
Plug 'unblevable/'      . 'quick-scope'             " Visual: Highlight unique characters per word in line (for find)
Plug 'kshenoy/'         . 'vim-signature'           " Visual: Mark navigation
Plug 'junegunn/'        . 'vim-peekaboo'            " Visual: Show registers during \", @, and <C-R>

if !has('nvim')
    Plug 'roxma/'       . 'nvim-yarp'               " Functional: Update framework
    Plug 'roxma/'       . 'vim-hug-neovim-rpc'      " Functional: RPC client compatibility layer
    " Also, run: pip3 install --user pynvim
endif

" Autocompletion {{{2

Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Functional: LSP

" Extensions:
let g:coc_global_extensions = [
    \ 'coc-css',
    \ 'coc-git',
    \ 'coc-highlight',
    \ 'coc-html',
    \ 'coc-java',
    \ 'coc-json',
    \ 'coc-lists',
    \ 'coc-python',
    \ 'coc-rls',
    \ 'coc-tsserver',
    \ 'coc-vimlsp',
    \ 'coc-vimtex',
    \ 'coc-yaml',
    \ 'coc-yank',
    \ ]

" Untried {{{1

" Evaluate next {{{2

" Other {{{2
"Plug 'maralla/'         . 'completor.vim'           " Autocompletion: General
"Plug 'LucHermitte/'     . 'VimFold4C'               " Folding: C++
"Plug 'LucHermitte/'     . 'lh-vim-lib'              " Folding: Library of functions for LucHermitte's scripts
"Plug 'tommcdo/'         . 'vim-lion'                " Functional: Alignment
"Plug 'svermeulen/'      . 'vim-easyclip'            " Functional: Blackhole delete, smart yanking, etc
"Plug 'chrisbra/'        . 'NrrwRgn'                 " Functional: Extract buffer (oooh this is cool)
"Plug 'kana/'            . 'vim-submode'             " Functional: More modes
"Plug 'AndrewRadev/'     . 'sideways.vim'            " Functional: Parameter swapping
"Plug 'romainl/'         . 'vim-qf'                  " Functional: Quickfix
"Plug 'romainl/'         . 'vim-qlist'               " Functional: Quickfix - Definition search
"Plug 'wincent/'         . 'scalpel'                 " Functional: Sublime Text-like word replace? (Ctrl+D)
"Plug 'mbbill/'          . 'undotree'                " Functional: Undo tree
"Plug 'ivanov/'          . 'vim-ipython'             " Tools:
"Plug 'nhooyr/'          . 'neoman.vim'              " Tools: Pager (manpages)
"Plug 'idbrii/'          . 'vim-ripple'              " Tools: REPL within vim
"Plug 'vim-syntastic/'   . 'syntastic'               " Tools: Syntax (compile) checking
"Plug 'jreybert/'        . 'vimagit'                 " Tools: vim git magic!!!
"Plug 'kkoenig/'         . 'wimproved.vim'           " Tweak: Windows systems
"Plug 'justinmk/'        . 'vim-syntax-extra'        " Visual: More syntax highlighting


" Disabled {{{1
" Sometimes useful {{{2
"Plug 'Konfekt/'         . 'FastFold'                " Folding: Eliminate foldexpr evaluation lag
"Plug 'matze/'           . 'vim-tex-fold'            " Folding: LaTeX
"Plug 'ryankuczka/'      . 'vim-pyfold'              " Folding: Python
"Plug 'junegunn/'        . 'vim-easy-align'          " Functional: Alignment
"Plug 'vim-scripts/'     . 'argtextobj.vim'          " Functional: Change function argument, e.g. cia
"Plug 'majutsushi/'      . 'tagbar'                  " Functional: ctags; bound to \t
"Plug 'w0rp/'            . 'ale'                     " Functional: LSP, Linting
"Plug 'kana/'            . 'vim-submode'             " Functional: New modes
"Plug 'jiangmiao/'       . 'auto-pairs'              " Functional: Pairs of '([])' abc def ghi
"Plug 'svermeulen/'      . 'vim-yoink'               " Functional: Registers
"Plug 'Shougo/'          . 'denite.nvim'             " Functional: Search
"Plug 'ludovicchabant/'  . 'vim-gutentags'           " Miscellaneous: Ctags
"Plug 'tweekmonster/'    . 'startuptime.vim'         " Miscellaneous: Startup breakdown
"Plug 'jpalardy/'        . 'vim-slime'               " Tools: REPL Emacs-like
"Plug 'romainl/'         . 'vim-cool'                " Visual: Search highlighting tweaks

" Possibly useful {{{2
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
"Plug 'tpope/'           . 'vim-fugitive'            " Tools: Git [RARELYUSED]
"Plug 'rhysd/'           . 'git-messenger.vim'       " Tools: Git commit history
"Plug 'buztard/'         . 'vim-rel-jump'            " Tweak: Add to relative jk motions to jumpstack
"Plug 'tpope/'           . 'vim-sleuth'              " Tweak: Automatically detect indent settings from file
"Plug 'justinmk/'        . 'vim-dirvish'             " Visual: Directory viewer
"Plug 'gillyb/'          . 'stable-windows'          " Visual: Disable centering when buffer switches
"Plug 'thaerkh/'         . 'vim-indentguides'        " Visual: Indent guides
"Plug 'semanser/'        . 'vim-outdated-plugins'    " Visual: Show number of outdated plugins under statusline
"Plug 'yuttie/'          . 'comfortable-motion.vim'  " Visual: Smooth scrolling
"Plug 'terryma/'         . 'vim-smooth-scroll'       " Visual: Smooth scrolling
"Plug 'romgrk/'          . 'barbar.nvim'             " Visual: Tab line
"Plug 'kyazdani42/'      . 'nvim-web-devicons'       " Visual: Tab line icons

" Colorscheme {{{2
"Plug 'sjl/              . 'badwolf'                 " Visual: Colorscheme
"Plug 'gkjgh/            . 'cobalt'                  " Visual: Colorscheme
"Plug 'archSeer/'        . 'colibri.vim'             " Visual: Colorscheme (purple, cloudy)
"Plug 'romgrk/'          . 'doom-one.vim'            " Visual: Colorscheme
"Plug 'junegunn/         . 'seoul256.vim'            " Visual: Colorscheme
"Plug 'altercation/      . 'vim-colors-solarized'    " Visual: Colorscheme
"Plug 'kristijanhusak/'  . 'vim-hybrid-material'     " Visual: Colorscheme
"Plug 'noahfrederick/    . 'vim-noctu'               " Visual: Colorscheme

" End {{{1
call plug#end()
