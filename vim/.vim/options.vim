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
let &colorcolumn=join(range(80,999), ",") " Column guide
set cursorline          " Highlight current line
set laststatus=2        " Show status line
set mouse=a             " Mouse interactivity
set numberwidth=2       " Numbering column width
set relativenumber      " Relative line numbers
set scrolloff=2         " Keep some lines visible when scrolling to edges of screen
