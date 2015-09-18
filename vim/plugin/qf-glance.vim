function! StoreQFResults()
    setlocal nosplitbelow 
    setlocal previewwindow ro
    setlocal foldlevel=99
    let g:qfResults = getqflist()
endfunction

function! ClearOpenedBuffers()
    echom 'Inside ClearOpenedBuffers()'
    if exists("b:qfOpenedBufferList")
        echom 'b:qfOpenedBufferList exists'
            for buf_no in keys(b:qfOpenedBufferList)
                echom "deleting buffer " . buf_no
                "execute "bd " . buf_no
            endfor
        "unlet b:qfOpenedBufferList
    endif
endfunction

function! OpenResultAsFile()
    execute 'silent pclose!'
    let ResultBufNr = g:qfResults[line('.') - 1].bufnr
    if exists("b:qfOpenedBufferList")
        for buf in keys(b:qfOpenedBufferList)
            if ResultBufNr == buf
                unlet b:qfOpenedBufferList[buf]
                break
            endif
        endfor
    endif
endfunction

function! OpenPW()
    if exists("g:qfResults")
        let b:ResultBufNr = g:qfResults[line('.') - 1].bufnr
        if bufexists(b:ResultBufNr)
            execute  'silent pedit! +' . g:qfResults[line('.') - 1].lnum . ' ' . bufname(b:ResultBufNr)
            if exists("b:qfOpenedBufferList")
                let b:qfOpenedBufferList[b:ResultBufNr] = 1
            else
                let b:qfOpenedBufferList = {b:ResultBufNr : 1}
            endif
        else
            unlet b:ResultBufNr
        endif
    endif
endfunction

augroup QF-Glance
    autocmd!
    autocmd QuickfixCmdPost * call StoreQFResults()
    autocmd FileType qf nnoremap <buffer> <space> :call OpenPW()<cr>
    autocmd FileType qf nnoremap <buffer> <return> :call OpenResultAsFile()<cr><return>
    autocmd FileType qf nnoremap <buffer> q :call ClearOpenedBuffers()<cr>:bd<cr>
    "autocmd BufWipeout * call ClearOpenedBuffers()
    autocmd FileType qf autocmd BufDelete <buffer> call ClearOpenedBuffers()
    "autocmd BufEnter * call StoreQFResults()
augroup END
