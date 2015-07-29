execute pathogen#infect()
call pathogen#helptags()
let gutentags_project_root=["tags"]

set nocp
set incsearch       "increamental search
set hlsearch        "highlight search
"set nu              "line numbers
set backspace=indent,eol,start  "makes backspace working
set ignorecase      "ignore case in searching
set smartcase       "dont ignore case if capital letters present

"vertical/horizontal scroll off settings
set scrolloff=2

syntax on
filetype on
filetype plugin on
filetype indent on

" During searching via n and N, keep the search result line in center
map N Nzz
map n nzz

set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

set cindent
set autoindent

" Remember cursor position between vim sessions
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

" ctags path
set tags=./tags;/

" open vertical split on right, instead of left
set splitright

set cscopetag
set csto=0
set cscopeverbose  

" find files in vim using cscope
if bufname("%") == ""
    noremap " :next scscope find f<space>
else
    noremap " :vert scscope find f<space>
endif

"nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>

highlight Comment cterm=italic

hi DiffAdd ctermbg=darkgreen ctermfg=black
hi DiffChange ctermbg=black
hi DiffText ctermbg=brown ctermfg=yellow
hi DiffDelete ctermbg=darkred ctermfg=black

hi User1 term=underline cterm=bold ctermfg=black ctermbg=darkblue guifg=#40ffff guibg=#0000aa
set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)
set laststatus=2

hi Search cterm=none ctermfg=yellow ctermbg=black
hi Visual cterm=none ctermfg=yellow ctermbg=brown

" ============= AUTO COMPLETE OPTIONS ================

set wildmenu
set wildmode=longest,list,full
set omnifunc=syntaxcomplete#Complete

set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Popup menu colors
highlight Pmenu ctermbg=black ctermfg=red
highlight PmenuSel ctermbg=white ctermfg=red

function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  let has_pointer = match(substr, '\->') != -1       " position of pointer, if any
  if (has_period || has_pointer)
    return "\<C-X>\<C-O>"                         " plugin matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-P>"                         " existing text matching
  endif
endfunction

imap <tab> <c-r>=Smart_TabComplete()<CR>
noremap <tab> <C-w><C-w>

set noshowmode

" vim-arline Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_warning=''

autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=c | endif
let g:tagbar_usearrows = 1
let mapleader=" "
nnoremap <leader>l :TagbarToggle<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

set cscopequickfix=s-,c-,d-,i-,t-,e-
