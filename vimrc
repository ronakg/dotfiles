" Turn off legacy stuff
set nocompatible

" Pathogen docs say turn filetype off before calling
filetype off
call pathogen#infect()
call pathogen#helptags()
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Space is my leader
let mapleader=" "

" Search everywhere, files, tabs, buffers
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['cscope.files', 'cat %s/cscope.files']
let g:ctrlp_root_markers = ['cscope.files']
nnoremap <leader>p :CtrlP<CR>

" Covert space to .* tokens in search words
let g:ctrlp_regexp = 1
let g:ctrlp_prompt_mappings = {
            \ 'PrtAdd(".*")': ['<space>'],
            \ }

set nomodeline      " disable mode lines (security measure)
set incsearch       " increamental search
set hlsearch        " highlight search
set backspace=indent,eol,start  " makes backspace working
set ignorecase      " ignore case in searching
set smartcase       " dont ignore case if capital letters present
set scrolloff=4     " keep cursor off screen edges
set autoread                    " automatically reload files changed outside of Vim
autocmd CursorHold * checktime  " checktime triggers auto reload when cursor is pressed
syntax on           " Pretty syntax highlighting
filetype on
filetype plugin on  " filetype plugins for file specific settings
filetype indent on  " filetype specific indentation
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cindent
set autoindent
set ttyfast
set lazyredraw
set gdefault        " search/replace globally (on a line) by default
set splitright      " Open split on right, not left
set splitbelow      " Open split below, not above
set wildmenu
set wildmode=longest,list,full
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menu,menuone
set noshowmode      " Airline shows mode, so hide default mode
set nobackup        " Don't need backup and swap files
set noswapfile
set pumheight=10    " Completion menu height

" Remember cursor position between vim sessions
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

set tags=./tags;/   " ctags path, search upwards till tags file is found
set cscopetag       " Use both cscope and ctags as database

" During searching via n and N, keep the search result line in center
map N Nzz
map n nzz

" Find instances of a symbol from command line
nnoremap " :vert scscope find s<space>
nnoremap <leader>d :cs find g <C-R>=expand("<cword>")<CR><CR>   " Find defintion
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>   " Find calls to this symbol
nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>   " Find all instances of this symbol
nnoremap <leader>t <c-t>

highlight Comment cterm=italic          " italics comments

" Use different colors for diff
hi DiffAdd ctermbg=darkgreen ctermfg=black
hi DiffChange ctermbg=cyan ctermfg=black
hi DiffText ctermbg=brown ctermfg=yellow
hi DiffDelete ctermbg=darkred ctermfg=black

hi User1 term=underline cterm=bold ctermfg=black ctermbg=darkblue guifg=#40ffff guibg=#0000aa
set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)
set laststatus=2

" Highlight search and visual blocks
hi Search cterm=none ctermfg=yellow ctermbg=black
hi Visual cterm=none ctermfg=yellow ctermbg=brown

" ============= AUTO COMPLETE OPTIONS ================
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Popup menu colors
highlight Pmenu ctermbg=black ctermfg=red
highlight PmenuSel ctermbg=white ctermfg=red

" Tab to switch between vertical splits
nnoremap <tab> <C-w><C-w>

" vim-arline Don't show seperators
let g:airline_section_warning = ''

" If can't find extention of a file, assume it's a C file
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=c | endif
let g:tagbar_usearrows = 1
let g:NERDTreeDirArrows=0
let NERDTreeShowBookmarks=1
map <leader>n :NERDTreeToggle<CR>


" Don't skip wrapped lines in editor
nnoremap j gj
nnoremap k gk

" Visually select just pasted paragraph, for indentation etc
nnoremap <leader>v V`]

" Clear highlighted searches
nmap <silent> ,/ :nohlsearch<CR>

" Easier to get command prompt
map ; :

nnoremap <leader>,         :bprevious<CR>
nnoremap <leader>.        :bnext<CR>
inoremap <leader>,    <Esc>:bprevious<CR>i
inoremap <leader>.   <Esc>:bnext<CR>i
nnoremap <leader>q      :bd<CR>

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Shhow tabline only when at least 2 files are open
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
let g:airline#extensions#tabline#buffer_nr_show = 0
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 1
" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled = 0
" disable to improve fugitive performance
let g:airline#extensions#branch#enabled = 0
" put a buffer list at the top
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = ""
let g:airline_right_sep = ""

imap jj <Esc>

let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

nmap <Leader>v :source $MYVIMRC

let g:autocscope_menus = 1
