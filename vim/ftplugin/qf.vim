" Easier previewing results from quickfix list
"
" WORK IN PROGRESS

function! QFList(linenr)
    let l:qflist = getqflist()
    let l:entry = l:qflist[a:linenr - 1]

    if l:entry.valid
        execute 'pedit! +' . l:entry.lnum . ' ' . bufname(l:entry.bufnr)
        wincmd P
        execute 'normal! zz'
        set nobuflisted
        wincmd p
        execute 'normal! \<C-w>p'
    endif
endfunction

nnoremap <buffer> <leader>n :call QFList(line("."))<CR>
nnoremap <buffer> <cr> :pclose<CR><CR>

augroup quickr_preview
    autocmd!
    autocmd BufDelete <buffer> echom "Hey"
augroup END
