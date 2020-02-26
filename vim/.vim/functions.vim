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

" Denite configure options {{{1
function! DeniteProfile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

" Folding {{{1
" Fold config files {{{2
function! FoldConfig()
    let thisline = getline(v:lnum)
    let matchline = matchstr(thisline, '^#\+.\+#\+$')
    let match = matchstr(matchline, '^#*')
    let level = strlen(match)

    if level > 0 | return ">1" | endif
    return "="
endfunction

" Fold Fortran files {{{2
function! FoldFortran()
    let thisline = getline(v:lnum)
    let match_start = match(thisline, '^\s*\(subroutine\|function\|pure function\|elemental function\)')       != -1
    let match_end   = match(thisline, '^\s*end program') != -1

    if match_start | return ">1" | endif
    if match_end   | return ">0" | endif
    return "="
endfunction

" Fold markdown files {{{2
function! FoldMarkdown()
    let thisline = getline(v:lnum)
    let match = matchstr(thisline, '^#*')
    let level = strlen(match)

    if level > 0 | return ">" . string(level) | endif
    return "="
endfunction

" Fold text style {{{2
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

" fzf.vim {{{1
function! s:get_git_root()
    let root = split(system('git rev-parse --show-toplevel'), '\n')[0]
    return v:shell_error ? '' : root
endfunction

function! SmartFiles(...)
    let root = s:get_git_root()
    if empty(root)
        return call("fzf#vim#files", a:000)
    else
        let args = ["--cached --exclude-standard --others"]
        return call("fzf#vim#gitfiles", args)
    endif
endfunction

" Word wrap {{{1
function! ToggleWrap()
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap <buffer> <silent> k gk
    noremap <buffer> <silent> j gj
endfunction
