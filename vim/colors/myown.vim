" Vim color file
"
" Author: Ronak Gandhi <ronak.gandhi@ronakg.com>
"

hi Conditional	guifg=#ffaf00	            gui=italic
hi Statement	guifg=#ffaf00	            gui=italic
hi Type	        guifg=darkgreen	            gui=italic
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
    hi Conditional	ctermfg=214	                    
    hi Statement	ctermfg=214	            
    hi Type	        ctermfg=darkgreen	            
    hi Storageclass	ctermfg=161	                    
    hi String	        ctermfg=darkred
    hi Number	        ctermfg=161	                    
    hi Boolean	        ctermfg=161	                    
    hi Debug	        ctermfg=yellow                   cterm=none
    hi Identifier	ctermfg=darkblue   
    hi Label	        ctermfg=darkblue                    cterm=bold,italic
    hi Directory	ctermfg=cyan	                    
    hi Comment	        ctermfg=245                         cterm=italic
    hi Function	        ctermfg=152
    hi Operator	        ctermfg=grey	                    
    hi Keyword	        ctermfg=darkblue
    hi Constant	        ctermfg=161                         
    hi Macro	        ctermfg=darkyellow	            
    hi Tag	        ctermfg=black
    hi PreCondit	ctermfg=darkyellow	            cterm=italic
    hi Character	ctermfg=222
    hi SpecialChar	ctermfg=magenta
    hi PreProc	        ctermfg=green
    hi Delimiter	ctermfg=241
    hi Visual           ctermfg=black       ctermbg=grey
    hi Search           ctermfg=darkred     ctermbg=white

    hi DiffAdd          ctermfg=black       ctermbg=114 
    hi DiffChange       ctermfg=black       ctermbg=cyan
    hi DiffText         ctermfg=white       ctermbg=darkred     cterm=italic
    hi DiffDelete       ctermfg=black       ctermbg=145

    hi Pmenu            ctermfg=red         ctermbg=black 
    hi PmenuSel         ctermfg=red         ctermbg=white 
endif
