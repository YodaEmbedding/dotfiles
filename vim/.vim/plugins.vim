" Enabled {{{1

Plug 'tpope/'           . 'vim-surround'            " Functional: Change surrounding parenthesis, e.g. cs([
Plug 'tomtom/'          . 'tcomment_vim'            " Functional: Commenting
Plug 'tpope/'           . 'vim-repeat'              " Functional: Repairs dot key for certain plugins (e.g. vim-sneak)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Functional: Search
Plug 'junegunn/fzf.vim'                             " Functional: Search
Plug 'tweekmonster/'    . 'fzf-filemru'             " Functional: Search (MRU)
Plug 'nelstrom/'        . 'vim-visual-star-search'  " Functional: Select visually then *
Plug 'SirVer/'          . 'ultisnips'               " Functional: Snippets (engine)
Plug 'honza/'           . 'vim-snippets'            " Functional: Snippets (snippets)
Plug 'wellle/'          . 'targets.vim'             " Functional: Text objects
Plug 'bps/'             . 'vim-textobj-python'      " Functional: Text objects
Plug 'kana/'            . 'vim-textobj-user'        " Functional: Text objects
Plug 'sheerun/'         . 'vim-polyglot'            " Miscellaneous: Language pack
Plug 'neoclide/coc.nvim', { 'branch': 'release' }   " Tools: LSP
Plug 'rafcamlet/'       . 'coc-nvim-lua'            " Tools: Neovim Lua
Plug 'tpope/'           . 'vim-eunuch'              " Tools: UNIX sugars on mv, rm, rename, ...
Plug 'editorconfig/'    . 'editorconfig-vim'        " Tweak: Apply .editorconfig settings
Plug 'farmergreg/'      . 'vim-lastplace'           " Tweak: Reopen file last position
Plug 'tyrannicaltoucan/'. 'vim-quantum'             " Visual: Colorscheme
Plug 'airblade/'        . 'vim-gitgutter'           " Visual: Git gutter
Plug 'bronson/'         . 'vim-trailing-whitespace' " Visual: Highlight trailing and :FixWhitespace
Plug 'unblevable/'      . 'quick-scope'             " Visual: Highlight unique characters per word in line (for find)
Plug 'kshenoy/'         . 'vim-signature'           " Visual: Mark navigation
Plug 'dstein64/'        . 'nvim-scrollview'         " Visual: Scrollbar

if !has('nvim')
    Plug 'roxma/'       . 'nvim-yarp'               " Functional: Update framework
    Plug 'roxma/'       . 'vim-hug-neovim-rpc'      " Functional: RPC client compatibility layer
    " Also, run: pip3 install --user pynvim
endif


" Untried {{{1

" Evaluate next {{{2
"Plug 'tmsvg/'           . 'pear-tree'               " Functional: Pairs of '([])'
"Plug 'liuchengxu/'      . 'vim-clap'                " Functional: Search
"Plug 'nvim-telescope/'  . 'telescope.nvim'          " Functional: Search
"Plug 'puremourning/'    . 'vimspector'              " Tools: Debugger
"Plug 'lambdalisue/'     . 'gina.vim'                " Tools: Git
"Plug 'metakirby5/'      . 'codi.vim'                " Tools: Real-time REPL evaluation
"Plug 'wadackel/'        . 'vim-dogrun'              " Visual: Colorscheme
"Plug 'danth/'           . 'pathfinder.vim'          " Visual: Show optimal path
"Plug 'reedes/'          . 'vim-wordy'               " Writing: Find usage problems

" Other {{{2
"Plug 'maralla/'         . 'completor.vim'           " Autocompletion: General
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
"Plug 'junegunn/'        . 'vim-easy-align'          " Functional: Alignment
"Plug 'tweekmonster/'    . 'startuptime.vim'         " Miscellaneous: Startup breakdown
"Plug 'dstein64/'        . 'vim-startuptime'         " Miscellaneous: Startup breakdown
"Plug 'lervag/'          . 'vimtex'                  " Tools: LaTeX
"Plug 'jpalardy/'        . 'vim-slime'               " Tools: REPL
"Plug 'romainl/'         . 'vim-cool'                " Visual: Search highlighting tweaks
"Plug 'junegunn/'        . 'vim-peekaboo'            " Visual: Show registers during \", @, and <C-R>

" Possibly useful {{{2
"Plug 'buztard/'         . 'vim-rel-jump'            " Functional: Add to relative jk motions to jumpstack
"Plug 'tpope/'           . 'vim-commentary'          " Functional: Commenting
"Plug 'takac/'           . 'vim-hardtime'            " Functional: Disable repeat hjkl movements
"Plug 'Yggdroot/'        . 'LeaderF', { 'on': 'LeaderfFile' }  " Functional: Fuzzy search/open files within directory
"Plug 'terryma/'         . 'vim-multiple-cursors'    " Functional: Multiple cursors (using regexes... cool)
"Plug 'kana/'            . 'vim-submode'             " Functional: New modes
"Plug 'othree/'          . 'eregex.vim'              " Functional: PCRE style regex (use :%S// to search and \/ to toggle / replacement on/off)
"Plug 'jiangmiao/'       . 'auto-pairs'              " Functional: Pairs of '([])'
"Plug 'Houl/'            . 'repmo-vim'               " Functional: Repeat last motion using ; or ,
"Plug 'Shougo/'          . 'denite.nvim'             " Functional: Search
"Plug 'vim-scripts/'     . 'argtextobj.vim'          " Functional: Text objects (e.g. cia)
"Plug 'justinmk/'        . 'vim-sneak'               " Functional: Use two character find (mapped to 's')
"Plug 'machakann/'       . 'vim-highlightedyank'     " Functional: Yank highlight
"Plug 'svermeulen/'      . 'vim-yoink'               " Functional: Yank history
"Plug 'dag/'             . 'vim2hs'                  " Miscellaneous: Haskell  (DOUBLE INDENTS :()
"Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }   " Tools: Firefox
"Plug 'tpope/'           . 'vim-fugitive'            " Tools: Git [RARELYUSED]
"Plug 'rhysd/'           . 'git-messenger.vim'       " Tools: Git commit history
"Plug 'w0rp/'            . 'ale'                     " Tools: LSP, Linting
"Plug 'ludovicchabant/'  . 'vim-gutentags'           " Tools: ctags
"Plug 'majutsushi/'      . 'tagbar'                  " Tools: ctags; bound to \t
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
"Plug 'ayu-theme/'       . 'ayu-vim'                 " Visual: Colorscheme
"Plug 'sjl/              . 'badwolf'                 " Visual: Colorscheme
"Plug 'gkjgh/            . 'cobalt'                  " Visual: Colorscheme
"Plug 'archSeer/'        . 'colibri.vim'             " Visual: Colorscheme (purple, cloudy)
"Plug 'romgrk/'          . 'doom-one.vim'            " Visual: Colorscheme
"Plug 'junegunn/         . 'seoul256.vim'            " Visual: Colorscheme
"Plug 'altercation/      . 'vim-colors-solarized'    " Visual: Colorscheme
"Plug 'ntk148v/'         . 'vim-horizon'             " Visual: Colorscheme
"Plug 'kristijanhusak/'  . 'vim-hybrid-material'     " Visual: Colorscheme
"Plug 'noahfrederick/    . 'vim-noctu'               " Visual: Colorscheme
"Plug 'artanikin/'       . 'vim-synthwave84'         " Visual: Colorscheme
