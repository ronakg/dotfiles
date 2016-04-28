" Easier previewing results from quickfix list
"
" WORK IN PROGRESS

let s:buflist = []
let s:qflist = getqflist()

"""
" Operate on an entry in quickfix list
"       linenr is current line number in the quickfix window
"
function! QFList(linenr)
    let l:entry = s:qflist[a:linenr - 1]
    pclose

    if l:entry.valid
        execute 'pedit +' . l:entry.lnum . ' ' . bufname(l:entry.bufnr)

        " Jump to preview window
        wincmd P
        execute 'normal zz'
        setlocal number
        setlocal relativenumber

        " Don't mark the buffer unlisted etc. if it existed before quickfix
        " was populated
        if index(s:buflist, l:entry.bufnr) == -1
            setlocal nobuflisted
            setlocal noswapfile
            setlocal readonly
            setlocal cursorline
        endif
        
        " Go back to quickfix window
        wincmd p
        execute 'normal \<C-w>p'
    endif
endfunction

"""
" Generate list of buffers
" Append already listed buffer to s:buflist
"
function! GenerateBufferList()
    for bufnum in range(1, bufnr('$'))
        if buflisted(bufnum)
            call add(s:buflist, bufnum)
        endif
    endfor
endfunction

nnoremap <buffer> <leader><space> :call QFList(line("."))<CR>
nnoremap <buffer> <cr> :pclose<CR><CR>

call GenerateBufferList()
