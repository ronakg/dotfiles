" Turn off legacy stuff
set nocompatible

" Pathogen docs say turn filetype off before calling
filetype off
call pathogen#infect()
call pathogen#helptags()

" Space is my leader, don't assign leader to space - that causes latency
" issues
nmap <space> <leader>

set t_Co=256
set nomodeline      " disable mode lines (security measure)
set incsearch       " increamental search
set hlsearch        " highlight search
set backspace=indent,eol,start  " makes backspace working
set ignorecase      " ignore case in searching
set smartcase       " dont ignore case if capital letters present
set scrolloff=4     " keep cursor off screen edges
set autoread                    " automatically reload files changed outside of Vim
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
set wildmode=longest:full,list:full
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set noshowmode      " Airline shows mode, so hide default mode
set nobackup        " Don't need backup and swap files
set noswapfile
set pumheight=10    " Completion menu height
set nofoldenable    " disable folding
set cursorline      " Show a horizontal line on cursor
autocmd CursorHold * checktime  " checktime triggers auto reload when cursor is pressed
filetype plugin on  " filetype plugins for file specific settings
filetype indent on  " filetype specific indentation
syntax enable           " Pretty syntax highlighting

" Remember cursor position between vim sessions
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
endif

set tags=./tags;/   " ctags path, search upwards till tags file is found
set cscopetag       " Use both cscope and ctags as database

" Find instances of a symbol from command line
nnoremap " :vert scscope find s<space>
nnoremap <leader>d :cs find g <C-R>=expand("<cword>")<CR><CR>   " Find defintion
nnoremap <leader>c :cs find c <C-R>=expand("<cword>")<CR><CR>   " Find calls to this symbol
nnoremap <leader>s :cs find s <C-R>=expand("<cword>")<CR><CR>   " Find all instances of this symbol
nnoremap <leader>t <c-t>

set statusline=%1*%F%m%r%h%w%=%(%c%V\ %l/%L\ %P%)
set laststatus=2

" ============= AUTO COMPLETE OPTIONS ================
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Tab to switch between vertical splits
nnoremap <tab> <C-w><C-w>

" vim-arline Don't show seperators
let g:airline_section_warning = ''
let g:airline#extensions#branch#enabled=1

" If can't find extention of a file, assume it's a C file
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=c | endif
let g:tagbar_usearrows = 1
let g:NERDTreeCommentDirArrows=0
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

nnoremap   <leader>,   :bprevious<CR>
nnoremap   <leader>.   :bnext<CR>
inoremap   <leader>,   <Esc>:bprevious<CR>i
inoremap   <leader>.   <Esc>:bnext<CR>i
nnoremap   <leader>q   :bd<CR>

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
let g:airline#extensions#tabline#buffer_nr_show               = 0
" Show just the filename
let g:airline#extensions#tabline#fnamemod                     = ':t'
let g:airline#extensions#tabline#show_buffers                 = 1
let g:airline#extensions#tabline#tab_nr_type                  = 0
let g:airline#extensions#tabline#show_tab_type                = 0
" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled                   = 0
"let g:airline_left_sep                                       = ""
"let g:airline_right_sep                                      = ""

imap jj <Esc>

let   g:SuperTabDefaultCompletionType          =   "context"
let   g:SuperTabContextDefaultCompletionType   =   "<c-n>"

nmap <Leader>v :source $MYVIMRC<CR>

" Change cursor based on mode, THIS IS NOT PORTABLE
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" NERDCommenter
" Ctrl-C to comment a block/line of code
nmap <C-c> :call NERDComment(0,"sexy")<CR>
vmap <C-c> :call NERDComment(0,"sexy")<CR>

" Ctrl-X to uncomment a block/line of code
nmap <C-x> :call NERDComment(0,"uncomment")<CR>
vmap <C-x> :call NERDComment(0,"uncomment")<CR>

nnoremap <leader>f :FZF! -x<CR>

function! s:buflist()
  redir => ls
  silent ls
  redir END
  return split(ls, '\n')
endfunction

function! s:bufopen(e)
  execute 'buffer' matchstr(a:e, '^[ 0-9]*')
endfunction

cnoreabbrev FZF FZF!

set bg=dark
let g:airline_theme='molokai'
colorscheme myown
autocmd BufEnter *.py colorscheme Tomorrow-Night-Eighties
