function! QuickFixPClose()
    if &buftype == 'quickfix'
        autocmd BufDelete <buffer> pclose!
    endif
endfunction

augroup quickfix_cmds
    autocmd!
    autocmd BufCreate * call QuickFixPClose()
augroup END
