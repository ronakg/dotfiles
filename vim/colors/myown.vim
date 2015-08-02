" Vim color file
"
" Author: Ronak Gandhi <ronak.gandhi@ronakg.com>
"

hi clear

hi Conditional	guifg=#ffaf00	            gui=italic
hi Statement	guifg=#ffaf00	            gui=italic
hi Type	        guifg=darkgreen	    gui=italic
hi Storageclass	guifg=#d7005f	            gui=italic
hi String	guifg=red
hi Number	guifg=#d7005f	            gui=italic
hi Boolean	guifg=#d7005f	            gui=italic
hi Debug	guifg=yellow	            gui=bold
hi Identifier	guifg=yellow	            gui=italic
hi Label	guifg=red	            gui=none
hi Directory	guifg=cyan	            gui=italic
hi Comment	guifg=darkgrey
hi Function	guifg=#87d7ff
hi Operator	guifg=grey	            gui=none
hi Keyword	guifg=blue
hi Constant	guifg=yellow	            gui=italic
hi Macro	guifg=darkyellow	    gui=italic
hi Tag	        guifg=black
hi PreCondit	guifg=darkyellow	    gui=italic
hi Character	guifg=#ffd787
hi SpecialChar	guifg=yellow	
hi PreProc	guifg=blue
hi Delimiter	guifg=#626262

if &t_Co > 255
    hi Conditional	ctermfg=214	            "cterm=italic
    hi Statement	ctermfg=214	            "cterm=italic
    hi Type	        ctermfg=darkgreen	    "cterm=italic
    hi Storageclass	ctermfg=161	            "cterm=italic
    hi String	        ctermfg=darkred
    hi Number	        ctermfg=161	            "cterm=italic
    hi Boolean	        ctermfg=161	            "cterm=italic
    hi Debug	        ctermfg=yellow	            cterm=none
    hi Identifier	ctermfg=yellow	            "cterm=italic
    hi Label	        ctermfg=red	            cterm=bold,italic
    hi Directory	ctermfg=cyan	            "cterm=italic
    hi Comment	        ctermfg=darkgrey            cterm=italic
    hi Function	        ctermfg=117
    hi Operator	        ctermfg=grey	            "cterm=none
    hi Keyword	        ctermfg=blue
    hi Constant	        ctermfg=yellow	            "cterm=italic
    hi Macro	        ctermfg=darkyellow	    "cterm=italic
    hi Tag	        ctermfg=black
    hi PreCondit	ctermfg=darkyellow	    cterm=italic
    hi Character	ctermfg=222
    hi SpecialChar	ctermfg=yellow	
    hi PreProc	        ctermfg=green
    hi Delimiter	ctermfg=241
    hi Visual           ctermfg=black  ctermbg=grey

    hi DiffAdd          ctermfg=black   ctermbg=114 
    hi DiffChange       ctermfg=black   ctermbg=cyan
    hi DiffText         ctermfg=white   ctermbg=darkred     cterm=italic
    hi DiffDelete       ctermfg=black   ctermbg=145

    hi Pmenu            ctermfg=red     ctermbg=black 
    hi PmenuSel         ctermfg=red     ctermbg=white 
endif

set bg=dark
