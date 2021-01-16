" Check backspace {{{1
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Check for plugin updates {{{1
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
    let Jobstart = has('nvim') ? function("jobstart") : function("job_start")
    let callbacks = has('nvim') ?
        \ {'on_stdout': function('s:JobHandlerNeovim')} :
        \ {'out_cb':    function('s:JobHandlerVim')}

    for key in keys(g:plugs)
        let cmd = "cd " . g:plugs[key].dir ." && git remote update && git status -uno"
        let _ = Jobstart(['bash', '-c', cmd], callbacks)
    endfor
endfunction

" coc.nvim {{{1
function! CocDocumentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" Copy search matches {{{1
function! CopyMatches(reg)
    let hits = []
    %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
    let reg = empty(a:reg) ? '+' : a:reg
    execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction

" fzf.vim {{{1
function! s:get_git_root()
    let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
    return v:shell_error ? '' : root
endfunction

function! SmartFiles(...)
    let root = s:get_git_root()
    if empty(root)
        execute ":FilesMru"
    else
        execute ":ProjectMru"
    endif
endfunction

" vim-peekaboo float {{{1
function! CreateCenteredFloatingWindow()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.8)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Word wrap {{{1
function! ToggleWrap()
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
endfunction
