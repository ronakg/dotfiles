function! StoreQFResults()
    setlocal nosplitbelow 
    setlocal previewwindow ro
    let g:qfResults = getqflist()
    let g:qfOpenedBufferList = {}
endfunction

function! ClearOpenedBuffers()
    if &buftype == 'quickfix'
        if exists("g:qfOpenedBufferList")
            execute 'pclose!'
                for buf in keys(g:qfOpenedBufferList)
                    execute 'bw ' . buf
                endfor
            unlet g:qfOpenedBufferList
        endif
    endif
endfunction

function! OpenResultAsFile()
    execute 'pclose!'
    let ResultBufNr = g:qfResults[line('.') - 1].bufnr
    if exists("g:qfOpenedBufferList")
        for buf in keys(g:qfOpenedBufferList)
            if ResultBufNr == buf
                unlet g:qfOpenedBufferList[buf]
                break
            endif
        endfor
    endif
endfunction

function! OpenPW()
    if exists("g:qfResults")
        let b:ResultBufNr = g:qfResults[line('.') - 1].bufnr
        if bufexists(b:ResultBufNr)
            execute  'pedit! +' . g:qfResults[line('.') - 1].lnum . ' ' . bufname(b:ResultBufNr)
            if exists("g:qfOpenedBufferList")
                let g:qfOpenedBufferList[b:ResultBufNr] = 1
            else
                let g:qfOpenedBufferList = {b:ResultBufNr : 1}
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
    "autocmd BufEnter * call StoreQFResults()
augroup END
