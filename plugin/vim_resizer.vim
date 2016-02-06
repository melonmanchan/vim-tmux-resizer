function! s:UseTmuxResizerMappings()
    return !exists("g:tmux_resizer_no_mappings") || !g:tmux_resizer_no_mappings
endfunction

function! IntelligentVerticalResize(direction) abort
    let l:window_resize_count = 5
    let l:current_window_is_last_window = (winnr() == winnr('$'))

    if (a:direction ==# 'left')
        let [l:modifier_1, l:modifier_2] = ['+', '-']
    else
        let [l:modifier_1, l:modifier_2] = ['-', '+']
    endif

    let l:modifier = l:current_window_is_last_window ? l:modifier_1 : l:modifier_2
    let l:command = 'vertical resize ' . l:modifier . l:window_resize_count . '<CR>'
    execute l:command
endfunction

function! s:TmuxVimResize(direction)
    if a:direction == 'h'
        call IntelligentVerticalResize('left')
    elseif a:direction == 'j'
        :execute "resize +1"
    elseif a:direction == 'k'
        :execute "resize -1"
    elseif a:direction == 'l'
        call IntelligentVerticalResize('right')
    endif
endfunction

command! TmuxResizeLeft call <SID>TmuxVimResize('h')
command! TmuxResizeDown call <SID>TmuxVimResize('j')
command! TmuxResizeUp call <SID>TmuxVimResize('k')
command! TmuxResizeRight call <SID>TmuxVimResize('l')

if s:UseTmuxResizerMappings()
    nnoremap <silent> <m-h> :TmuxResizeLeft<cr>
    nnoremap <silent> <m-j> :TmuxResizeDown<cr>
    nnoremap <silent> <m-k> :TmuxResizeUp<cr>
    nnoremap <silent> <m-l> :TmuxResizeRight<cr>
endif

