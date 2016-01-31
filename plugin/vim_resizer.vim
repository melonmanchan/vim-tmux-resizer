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

nnoremap <silent> <m-k> :resize +1<CR>
nnoremap <silent> <m-j> :resize -1<CR>
nnoremap <silent> <m-h> :call IntelligentVerticalResize('left')<CR>
nnoremap <silent> <m-l> :call IntelligentVerticalResize('right')<CR>

