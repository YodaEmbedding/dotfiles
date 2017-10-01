" Installation: Please install vim-plug then simply copy this to ~/.vimrc
" Author: Mateen Ulhaq <mulhaq2005@gmail.com>


" SECTION: VIM-PLUG

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

Plug 'gkjgh/cobalt'                         " Theme
Plug 'ctrlpvim/ctrlp.vim'                   " Fuzzy search/open files within directory
Plug 'othree/eregex.vim'                    " PCRE style regex (use :%S// to search and \/ to toggle / replacement on/off)
Plug 'Yggdroot/indentLine'                  " Indent guides
Plug 'scrooloose/nerdcommenter'             " Commenting blocks i.e. \cb
Plug 'Houl/repmo-vim'                       " Repeat last motion using ; or ,
Plug 'vim-airline/vim-airline'              " Theme
Plug 'vim-airline/vim-airline-themes'       " Theme
Plug 'terryma/vim-expand-region'            " (NEW)  Expand selection region using + and _
Plug 'kristijanhusak/vim-hybrid-material'   " Theme
Plug 'farmergreg/vim-lastplace'             " Reopen file last position
Plug 'terryma/vim-multiple-cursors'         " (RARELY USED)  Multiple cursors WITH REGEX?! OMG
Plug 'tpope/vim-sleuth'                     " Automatically detect indent settings from file
Plug 'bronson/vim-trailing-whitespace'      " Highlight trailing and :FixWhitespace
Plug 'lervag/vimtex'                        " (NEW) (RARELY USED)  vim latex
Plug 'Valloric/YouCompleteMe'               " Autocompletion

" Disabled

"Plug 'python-mode/python-mode', {'for': 'python'}
"Plug 'easymotion/vim-easymotion'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'tpope/vim-surround'

" Untried

"thaerkh/vim-workspace
"chrisbra/NrrwRgn               " oooh this is cool (extract buffer)
"davidhalter/jedi-vim
"vim-syntastic/syntastic
"benmills/vimux
"AndrewRadev/sideways.vim       " Parameter swapping
"ervandew/supertab
"wincent/command-t
"scrooloose/nerdtree
"Xuyuanp/nerdtree-git-plugin

" What is this?

"Plug 'humiaozuzu/tabbar'


call plug#end()


" SECTION: COLOR SCHEMES

"set t_Co=256        " Force 256-colors
set background=dark  " Dark background

"color desert
"colorscheme cobalt
"colorscheme hybrid_reverse
colorscheme hybrid_material

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


" SECTION: PLUGIN SETTINGS

" ctrlp
let g:ctrlp_use_caching = 0
let g:ctrlp_match_window = 'min:4,max:72'
"let g:ctrlp_custom_ignore = 'Android\|Downloads\|Dropbox\|Games\|code\|git'
let g:ctrlp_working_path_mode = 'r'  " (Default: 'ra'. 'a' searches in parent as well.)

if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'  " Use silver searcher
endif

" indentLine
let g:indentLine_char = '│'
"let g:indentLine_color_term = 234
"let g:indentLine_color_gui = '#1C1C1C'
"let g:indentLine_color_tty_light = 7 " (default: 4)
"let g:indentLine_color_dark = 1      " (default: 2)

" python-mode
"let g:pymode_rope_completion = 0
"let g:pymode_rope_complete_on_dot = 0
"autocmd CompleteDone * pclose

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''      " ' '
let g:airline#extensions#tabline#left_alt_sep = ''  " '|'


" SECTION: USER CUSTOMIZATIONS

"set linebreak          "
"set nolist             " list disables linebreak
"set textwidth=0        "
"set wrap               "

" Indenting and Tabs
"set autoindent         "
"set expandtab          " Spaces
"set noexpandtab        " Tabs
set shiftwidth=4        " Indent/outdent by four columns
"set smartindent        "
set smarttab            "
set softtabstop=4       "
set tabstop=4           " Indentation levels every four columns

" Search
set hlsearch            " Highlight search results
set ignorecase          " Ignore case
"set incsearch          "
"set magic              " Escape like regular regexes; use \V to revert
set smartcase           " Ignore case if lower

" Visual
set colorcolumn=80      " Column guide
"set cursorline         " Highlight current line (disable because cursor lag)
set laststatus=2        " Show status line
set mouse=a             " Mouse interactivity
"set noshowmode         " Hide INSERT status
set number              " Line numbers
"set relativenumber     " Relative line numbering

" Undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

" Conceal
set conceallevel=0      " "indentLine: revert to default...???"
let g:tex_conceal = ""

" Miscellaneous
"set foldcolumn=0       "
set hidden              " Allow switching buffers with unwritten changes
"set suffix+=.jpg,.png  " List at very end
set wildignore+=*.pdf,*.o,*.obj,*.jpg,*.png,*.pyc  " Do not list

" Optimization
"set ttyfast             " speeds up page up/down???
"set nocul               " disable highlight current line

" GUI
if has("gui_running")
    "set guioptions +=e     " Use GUI tabs
    "set guioptions -=m     " Remove menubar
    set guioptions -=T      " Remove toolbar
    "set guitablabel=%N\ %t\ %M  " GUI tab labels
endif

" Disable continue comment on new line
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

" Reload .vimrc on edit
"augroup myvimrchooks
"    au!
"    autocmd bufwritepost .vimrc source ~/.vimrc
"augroup END


" SECTION: USER FUNCTIONS

" Copy search matches
function! CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

" Strip trailing white spaces (only for certain filetypes; add your own)
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Swap lines
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

" Word wrap
function ToggleWrap()
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> k gk
    noremap  <buffer> <silent> j gj
endfunction


" SECTION: USER KEYBOARD MAPPINGS

" Escape key
"inoremap jk <Esc>
"inoremap jj <Esc>

" Repeat motion bindings
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

" Swap lines
noremap <silent> <C-S-Up> :call <SID>swap_up()<CR>
noremap <silent> <C-S-Down> :call <SID>swap_down()<CR>
noremap <silent> <C-k> :call <SID>swap_up()<CR>
noremap <silent> <C-j> :call <SID>swap_down()<CR>

" Easymotion
"map <C-o> <Leader><Leader>w
"map <C-e> <Leader><Leader>W
"map <C-f> <Leader><Leader>f

" eregex toggle
nnoremap <leader>/ :call eregex#toggle()<CR>

" Word wrap, up/down visually
noremap <silent> <Leader>w :call ToggleWrap()<CR>

" Relative numbering
nnoremap <Leader>r :set relativenumber!<CR>

" Black hole delete
nnoremap <Backspace> "_dd
vnoremap <Backspace> "_dd
nnoremap <Leader>d "_d
vnoremap <Leader>d "_d
nnoremap <Leader>x "_x
vnoremap <Leader>x "_x

"Black hole paste (in visual mode)
xnoremap <silent> p p:let @"=@0<CR>
"xnoremap p "_dp

" Clipboard (copy/paste)
nmap <silent> <Leader>p :set paste<CR>"+p:set nopaste<CR>
nmap <silent> <Leader>P :set paste<CR>"+P:set nopaste<CR>
map <silent> <Leader>y "+y
map <silent> <Leader>Y "+Y

" New line without insert mode (uses q register to mark)
" nmap <C-o> mqO<Esc>`q
nnoremap <CR> mqo<Esc>`q

" Set paste mode
"set pastetoggle=<F9>

" Macro
nmap <silent> <F2> @q
nmap <silent> <F3> @@

" Search
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>
nnoremap <Space> <C-w><C-w>

" Navigate up/down in wrapped text
nnoremap <silent> <Down> gj
nnoremap <silent> <Up> gk
inoremap <silent> <Down> <C-o>gj
inoremap <silent> <Up> <C-o>gk

" Navigate 5 lines up/down
noremap <C-Down> 5<C-e>
noremap <C-Up> 5<C-y>
"noremap <C-Down> zz5gjzz
"noremap <C-Up> zz5gkzz

" Navigate screen up/down
noremap <S-Down> <C-e>
noremap <S-Up> <C-y>

" Save as sudo
cmap w!! w !sudo tee > /dev/null %

"Free:
"    Normal: Space

