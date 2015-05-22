" Vim color file
" Maintainer:   Hans Fugal <hans at fugal.net>
" Last Change:  5 Oct 2001
" URL:          http://fugal.net/vim/colors/desert.vim 

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="desert"

hi Normal   guifg=White guibg=grey20

" highlight groups
hi Cursor   guibg=khaki guifg=slategrey
"hi CursorIM    
"hi Directory   
"hi DiffAdd     
"hi DiffChange  
"hi DiffDelete  
"hi DiffText    
"hi ErrorMsg    
hi VertSplit    guibg=#c2bfa5 guifg=grey50 gui=none
hi Folded       guibg=grey30 guifg=gold
hi FoldColumn   guibg=grey30 guifg=tan
hi IncSearch    cterm=none ctermbg=blue ctermfg=grey guifg=slategrey guibg=khaki
"hi LineNr      
hi ModeMsg      guifg=goldenrod
hi MoreMsg      ctermfg=LightGreen guifg=SeaGreen
hi NonText      ctermfg=LightBlue guifg=LightBlue guibg=grey30
hi Question     guifg=springgreen
hi Search   ctermbg=blue ctermfg=grey guibg=peru guifg=wheat
hi SpecialKey   guifg=yellowgreen
hi StatusLine   guibg=#c2bfa5 guifg=black gui=none
hi StatusLineNC guibg=#c2bfa5 guifg=grey50 gui=none
hi Title    guifg=indianred
hi Visual   cterm=none ctermbg=darkgreen ctermfg=yellow gui=none guifg=khaki guibg=olivedrab
"hi VisualNOS   
hi WarningMsg   guifg=salmon
"hi WildMenu    
"hi Menu        
"hi Scrollbar   
"hi Tooltip     

" syntax highlighting groups
hi Comment  ctermfg=lightblue guifg=SkyBlue
hi Constant     ctermfg=darkcyan guifg=#ffa0a0
hi Identifier   ctermfg=darkgreen cterm=none guifg=palegreen
hi Statement    ctermfg=brown guifg=khaki
hi PreProc  ctermfg=darkmagenta guifg=indianred
hi Type     ctermfg=darkgreen guifg=darkkhaki
hi Special  ctermfg=darkmagenta guifg=navajowhite
"hi Underlined  
hi Ignore   guifg=grey40
"hi Error       
hi Todo     ctermfg=darkred ctermbg=yellow guifg=orangered guibg=yellow2


"vim: ts=4
