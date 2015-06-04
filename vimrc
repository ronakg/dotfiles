set nocompatible
set encoding=utf-8

execute pathogen#infect()

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
"Ctrl + \ -> open tag lookup in vertical split
"map « :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" open vertical split on right, instead of left
set splitright

" Pull auto complete from current file, other buffers and tags file
set complete=.,b,u,]

" Better autocomplete
set wildmode=longest,list:longest

" find files in vim using cscope
noremap " :vert scscope find f<space>

highlight Comment cterm=italic

hi DiffAdd ctermbg=150
hi DiffChange ctermbg=228
hi DiffText cterm=bold ctermbg=189 ctermfg=17
hi DiffDelete cterm=bold ctermbg=224 ctermfg=252

set laststatus=2

let g:airline_theme='molokai'
let g:airline_powerline_fonts=0
let g:airline_section_warning=0
let g:airline#extensions#tabline#fnamemod = ':p:.'

set noshowmode

" Make space the leader key
let mapleader = "\<Space>"

" Leader-s to save a file
nnoremap <Leader>s :w<CR>

" Leader-q to close a file
nnoremap <Leader>q :q<CR>
