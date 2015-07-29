filetype off
call pathogen#helptags()
call pathogen#infect()
set runtimepath^=~/.vim/bundle/ctrlp.vim

" , is my leader
let mapleader=","

let g:ctrlp_user_command = ['cscope.files', 'cat %s/cscope.files']
let g:ctrlp_root_markers = ['cscope.files']
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_prompt_mappings = { 'PrtAdd(".*")': ['<space>'] }
nnoremap <leader>f :CtrlP<CR>


set nocp
set incsearch       "increamental search
set hlsearch        "highlight search
set backspace=indent,eol,start  "makes backspace working
set ignorecase      "ignore case in searching
set smartcase       "dont ignore case if capital letters present

"vertical/horizontal scroll off settings
set scrolloff=4

set autoread                    " automatically reload files changed outside of Vim

" Thanks to Steve Losh for this liberating tip
" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v
vnoremap / /\v

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

set cursorline

set cindent
set autoindent
set ttyfast
set lazyredraw

set gdefault                    " search/replace "globally" (on a line) by default

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
noremap " :vert scscope find f<space>

" Italics comments
highlight Comment cterm=italic

" Use different colors for diff
hi DiffAdd ctermbg=darkgreen ctermfg=black
hi DiffChange ctermbg=black
hi DiffText ctermbg=brown ctermfg=yellow
hi DiffDelete ctermbg=darkred ctermfg=black

hi User1 term=underline cterm=bold ctermfg=black ctermbg=darkblue guifg=#40ffff guibg=#0000aa
set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)
set laststatus=2

" Highlight search and visual blocks
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

" Tab to switch between vertical splits
nnoremap <leader>w <C-w><C-w>
set formatoptions=qrn1
set noshowmode

" vim-arline Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_warning=''

" If can't find extention of a file, assume it's a C file
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=c | endif
let g:tagbar_usearrows = 1
let g:NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1
nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>

set nobackup                    " Don't need backup and swap files
set noswapfile

" Get used to vim movement keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Don't skip wrapped lines in editor
nnoremap j gj
nnoremap k gk

" Visually select just pasted paragraph, for indentation etc
nnoremap <leader>v V`]

" Clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" Easier to get command prompt
map ; :
set nomodeline                  " disable mode lines (security measure)


" Highlight trailing whitespaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Easier matching
map <tab> %

set encoding=utf-8
set showcmd                     " display incomplete commands
