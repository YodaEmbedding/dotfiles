" Conceal {{{1
let g:tex_conceal = ""
let g:vim_json_syntax_conceal = 0

" Folding {{{1
set fillchars=fold:\ 
set foldlevelstart=20
set foldnestmax=4
set foldtext=FoldTextStyle()

" GUI {{{1
if has("gui_running")
    set guioptions -=m              " Remove menubar
    set guioptions -=T              " Remove toolbar
endif

" Indenting, Tabs, Spacing {{{1
set expandtab                       " Spaces for indent
set nojoinspaces                    " Join sentences with single space
set shiftround                      " Round >> to nearest shiftwidth multiple
set shiftwidth=4                    " Spaces for >>
set softtabstop=4                   " Spaces for tab
set tabstop=4                       " Tab display width

" Python indenting {{{2
" let g:pyindent_continue     = '&sw'
" let g:pyindent_nested_paren = '&sw'
" let g:pyindent_open_paren   = '&sw'

" VHDL indenting {{{2
let g:vhdl_indent_genportmap = 0

" Miscellaneous {{{1
set hidden                          " Allow hiding unsaved buffers
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.pyc
set wildmenu                        " Enhanced command-line completion
set wildmode=longest,list,full

" Search {{{1
set hlsearch                        " Highlight search results
set ignorecase                      " Ignore case
set smartcase                       " Ignore case if lower

if has('nvim')
    set inccommand=split            " Incremental highlight during :%s
endif

" Undo {{{1
set undodir=$HOME/.vim/undo         " Undo history location
set undofile                        " Undo history

" Visual {{{1
set colorcolumn=80                  " Column guide
set cursorline                      " Highlight current line
set laststatus=2                    " Status line
set mouse=a                         " Mouse interactivity
set numberwidth=2                   " Numbering column width
set relativenumber                  " Relative line numbers
set scrolloff=2                     " Always display lines around cursor

" let &colorcolumn=join(range(80,999), ",") " Column guide
