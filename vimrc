set termencoding=utf-8
set encoding=utf-8

" ======================== PATHOGEN ===============================
" To disable a plugin, add it's bundle name to the following list
" For example
" let g:pathogen_disabled = ['auto-pairs', 'vim-airline']
let g:pathogen_disabled = ['vim-dirdiff', 'vim-markdown']

" Pathogen docs say turn filetype off before calling {{{
filetype off
call pathogen#infect()
call pathogen#helptags()
call pathogen#infect('after/{}')
" }}}

" Space is my leader, don't assign leader to space - that causes latency
" issues
 nmap <space> <leader>
 vmap <space> <leader>

" Standard vim options
"                              
"                            
" Searching
set incsearch                        " increamental search
set hlsearch                         " highlight search
set ignorecase                       " ignore case in searching
set smartcase                        " dont ignore case if capital letters present
set backspace=indent,eol,start       " makes backspace working
set scrolloff=4                      " keep cursor off screen edges
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab
set cindent
set smartindent
set autoindent
set nostartofline
set ttyfast
set lazyredraw
set gdefault                         " search/replace globally (on a line) by default
set splitright                       " Open split on right, not left
set splitbelow                       " Open split below, not above
set wildmenu
set wildmode=longest:full,list:full
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
set noshowmode                       " Airline shows mode, so hide default mode
set nobackup                         " Don't need backup and swap files
set noswapfile
set pumheight=15                     " Completion menu height
set cursorline                       " Cursor line
set number                           " Line numbers
set relativenumber                   " Relative line numbers
set laststatus=2                     " Always show statusline     
set shiftround                       " Round off shiftwidth when using >
set ttimeout
set ttimeoutlen=50                   " Make Esc work faster
set notimeout
set wrapscan
set autoread                         " automatically reload files changed outside of Vim
set noshowcmd
set nohidden
set diffopt+=context:5               " 5 lines of context in diff mode
set shortmess=atToOI                 " To avoid the 'Hit Enter' prompts caused by the file messages
filetype plugin on                   " filetype plugins for file specific settings
filetype indent on                   " filetype specific indentation
syntax enable                        " Pretty syntax highlighing
set updatetime=750                   " Vim refresh time
set linebreak                        " It maintains the whole words when wrapping

" Don't add a newline when preview window is visible
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

noremap <C-F> <C-D>
noremap <C-B> <C-U>

" Expand matching braces only when pressing Enter
inoremap {<CR> {<CR>}<Esc>==ko

" Don't let x and c to spoil the yank register
nnoremap x "_x
nnoremap c "_c

" Don't use the arraow keys
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Make arrowkey do something usefull, resize the viewports accordingly
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Better indentation in Visual mode
vnoremap < <gv
vnoremap > >gv

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Tab to switch between vertical splits
nnoremap <tab> <C-w><C-w>

" Next/prev buffers
nnoremap <c-l> :bn<CR>
nnoremap <c-h> :bp<CR>

" Next/prev results
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>

" Tree style file explorer
let g:netrw_liststyle=3

" Don't jump to next search result on *
noremap * :let @/ = '\<'.expand('<cword>').'\>' \| set hlsearch<CR>

" Quicker save and quit
nnoremap ww :w<CR>:echo "File saved..."<CR> 
nnoremap <silent> e :silent Sayonara<CR>

" jj to save the file in insert mode, switch to normal mode from other modes
inoremap jj <Esc>:w<CR>:echo "File saved..."<CR>
inoremap ww <Esc>:w<CR>:echo "File saved..."<CR>
cnoremap jj <C-c>

" If can't find extention of a file, assume it's a C file
autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=c | endif

" Spellcheck commit messages
autocmd BufRead COMMIT_EDITMSG setlocal spell!

" Clear highlighted searches
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" Switch to last buffer
nmap <leader>p :b#<CR>

" Easier to get command prompt
nnoremap ; :
vnoremap ; :

" I don't ever use character wise visual mode, so switch to linewise for v
nnoremap v V
vnoremap v V
nnoremap V v
vnoremap V v

" x in Insert mode
inoremap <C-d> <C-o>x

" Jump to start and end of line using the home row keys
map H ^
map L $

" Insert a new line below and come back to normal mode
noremap O o<ESC>

" Remember cursor position between vim sessions
if has("autocmd")
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal! g'\"" |
                \ endif
            
endif

" center buffer around cursor when opening files
autocmd BufRead * normal zz

"===================== CTAGS/CSCOPE ==========================
set tags=./tags;/   " ctags path, search upwards till tags file is found
set cscopetag       " Use both cscope and ctags as database
set csto=0

" Find instances of a symbol from command line
" Yank the word under cursor, search for cscope, close the first result
" window, open quickfix window with results, search for the word for
" highlighting and movement with n and N
nnoremap <leader>d :cs find g <cword><CR>   " Find definition of this symbol
nnoremap <leader>c yiw:cs find c <cword><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>   " Find calls to this symbol
nnoremap <leader>s yiw:cs find s <cword><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>   " Find all instances of this symbol
nnoremap <leader>h yiw:cs find f <C-R>=expand("<cfile>:t")<CR><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>   " Find this file
nnoremap <leader>i yiw:cs find i <C-R>=expand("<cfile>:t")<CR><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>   " Find all files including this file
nnoremap <leader>t :pop<CR>
set cscopequickfix=s-,c-,i-,t-,e-,f-

"========================== VIM-AIRLINE ==========================
" Enable the list of buffers
let g:airline#extensions#tabline#enabled                      = 1
let g:airline#extensions#tabline#buffer_min_count             = 1
let g:airline#extensions#tabline#tab_min_count                = 1
let g:airline#extensions#tabline#buffer_idx_mode              = 1
let g:airline#extensions#tabline#buffer_nr_show               = 0
let g:airline#extensions#tabline#show_buffers                 = 1
let g:airline_powerline_fonts                                 = 0
" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled                   = 0
let g:airline_theme                                           = 'ronakg'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod                     = ':t'
let g:airline_left_sep                                        = ''
let g:airline_right_sep                                       = ''
let g:airline_section_b = '%{fnamemodify(getcwd(), ":t")}'
let g:airline_section_c = '%{fnamemodify(expand("%"), ":~:.")}'
" Easier tab/buffer switching
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

"========================== FZF ===================================
nnoremap <silent> <C-p> :FZF<CR>

" Change cursor shape based on mode.
" https://gist.github.com/andyfowler/1195581
set gcr=a:blinkon0
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"=========================== DIFF ===============================

if &diff
    " use space and backspace to jump forward/backward through differences
    nnoremap <space> :normal! ]c<enter>
    nnoremap <backspace> :normal! [c<enter>
    nnoremap e :qa<CR>
endif

" Update diff if changes are written to the file
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

"========================== LINE NUMBERS =========================
function! NumberToggle()
  if(&relativenumber == 1 && &number == 1)
    set number
    set norelativenumber
  elseif (&number == 1 && &relativenumber == 0)
    set norelativenumber
    set nonumber
  else
    set number
    set relativenumber
  endif
endfunc

nnoremap <leader>l :call NumberToggle()<CR>

" Treat .md files as markdown
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"=========================== COLORSCHEME ========================
set t_Co=256
set bg=dark
colorscheme ronakg

"====================== WORK VIMRC ===============================
try
    source ~/.vimrc_work
catch
    " No such file? No problem; just ignore it.
endtry

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" auto-align
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"==================== Simple-todo=================================
" Disable default key bindings
let g:simple_todo_map_keys = 0
let g:simple_todo_tick_symbol = '✓'

" Map your keys
nmap <leader>x <Plug>(simple-todo-mark-as-done)
nmap <leader>X <Plug>(simple-todo-mark-as-undone)
nmap <leader>O <Plug>(simple-todo-new)

"======================== Startify ===============================
let g:startify_list_order = [['Most recently used files in current directory:'], 'dir',
            \                ['Most recently used file on the system:'], 'files',
            \                ['Bookmarks:'], 'bookmarks',
            \                ['Sessions:'], 'sessions']
let g:startify_change_to_dir = 0

"==================== EASYMOTION ================================
let g:EasyMotion_smartcase = 1
nmap f <Plug>(easymotion-bd-f)

" Grep for word under the cursor
if filereadable("cscope.files")
    nnoremap <Leader>vv *:silent Ack! -k <cword> --files-from=cscope.files<CR>:/<CR>
    vnoremap <Leader>vv y:silent Ack! -kQ "<C-R>0" --files-from=cscope.files<CR>:/<C-R>0<CR>
else
    nnoremap <Leader>vv *:silent Ack! -k <cword> .<CR>:/<CR>
    vnoremap <Leader>vv y:silent Ack! -kQ "<C-R>0" .<CR>:/<C-R>0<CR>
endif

" if nbuffers > 1? bw: q
function! CloseOnLast()
    let cnt = 0

    for i in range(0, bufnr("$"))
        if buflisted(i)
            let cnt += 1
        endif
    endfor

    if cnt <= 1
        q
    else
        bw
    endif

endfunction

if filereadable(".vim.custom")
    so .vim.custom
endif

let g:startify_skiplist = [
                \ '.CC',
                \ ]


" Disable blinking
autocmd GUIEnter * set vb t_vb= " for your GUI
autocmd VimEnter * set vb t_vb=

let g:DirDiffExcludes = "*.CC*,*.c.*,.ACME*"

nmap <leader>k <Plug>(Vman)

nnoremap <C-t> :Tags<CR>
nnoremap <leader>m :Make<CR>

" VimCompletesMe setup
let g:vcm_direction = 'n'

set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers
