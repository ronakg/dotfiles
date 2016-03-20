" Vim-Plug {{
try
    source ~/.vim/vim-plug.vim
catch
    " It's okay
endtry
" }}

" Standard vim options {{
set termencoding=utf-8
set encoding=utf-8
set incsearch                        " increamental search
set ignorecase                       " ignore case in searching
set smartcase                        " dont ignore case if capital letters present
set infercase                        " ingnore case on completion
set backspace=indent,eol,start       " makes backspace working
set scrolloff=4                      " keep cursor off screen edges
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
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
set timeout timeoutlen=3000 ttimeoutlen=100
set wrapscan
set autoread                         " automatically reload files changed outside of Vim
set showcmd
set nohidden
set diffopt+=context:5               " 5 lines of context in diff mode
set shortmess=atToOI                 " To avoid the 'Hit Enter' prompts caused by the file messages
set updatetime=750                   " Vim refresh time
set linebreak                        " It maintains the whole words when wrapping
set complete-=i                      " Don't scan included files for completion
set cpoptions-=m               " Highlight when CursorMoved.
set matchtime=1
set matchpairs+=<:>
set clipboard=exclude:.*             " Don't connect to X server clipboard
set listchars=tab:▸\ ,trail:■,extends:»,precedes:«
" set list
" set diffopt+=iwhite                  " Ignore white space diff
set visualbell t_vb=                 " Disable bells
filetype plugin on                   " filetype plugins for file specific settings
filetype indent on                   " filetype specific indentation
syntax enable                        " Pretty syntax highlighing
set re=1
let g:sh_no_error = 1
" }}

" Key remaps {{

" Space is my leader, don't assign leader to space - that causes latency
" issues
let g:mapleader = "\<Space>"

nnoremap <leader>m :Make<CR>

" Grep for word under the cursor
if filereadable("cscope.files")
    nnoremap <Leader>vv *:silent Ack! -k <cword> --files-from=cscope.files<CR>:/<CR>
    vnoremap <Leader>vv y:silent Ack! -kQ "<C-R>0" --files-from=cscope.files<CR>:/<C-R>0<CR>
else
    nnoremap <Leader>vv *:silent Ack! -k <cword> .<CR>:/<CR>
    vnoremap <Leader>vv y:silent Ack! -kQ "<C-R>0" .<CR>:/<C-R>0<CR>
endif

" Don't add a newline when preview window is visible
inoremap <silent><expr> <Cr>  pumvisible() ? "<C-y>" : "<C-g>u<Cr>"

" Make Y behave like other motion characters
nnoremap Y y$

" Backspace in normal mode switches to last buffer
nnoremap <BS> :buffer #<CR>

" qq to record, Q to replay
nmap Q @q

" Expand matching braces only when pressing Enter
" inoremap {<CR> {<CR>}<Esc>==ko

" Don't let x and c to spoil the yank register
nnoremap x "_x
nnoremap c "_c

" Make arrowkey do something useful, resize the viewports accordingly
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Tab to switch between vertical splits
nnoremap <tab> <C-w>w

" Tab to indent-unindent code blocks in visual mode
vnoremap <tab> >gv
vnoremap <S-tab> <gv

" Next/prev quick-fix results
nnoremap <C-j> :cn<CR>
nnoremap <C-k> :cp<CR>

" Don't jump to next search result on *
nnoremap * :let @/ = '\<'.expand('<cword>').'\>' \| set hlsearch<CR>

" Quicker save and quit
nnoremap <silent> e :silent Sayonara<CR>
nnoremap <silent> s :update<CR>
inoremap <silent> jj <Esc>

" Clear highlighted searches
nnoremap ,/ :nohlsearch<CR><Esc>

" Easier to get command prompt
nnoremap ; :
vnoremap ; :
" Restore repeat for f, F, t, T
nnoremap : ;

" x in Insert mode
inoremap <C-d> <C-o>x

" Jump to start and end of line using the home row keys
nmap 0 ^

" Increment decrement numbers
noremap <leader>a <C-a>
noremap <leader>x <C-x>

nnoremap <leader>l :call NumberToggle()<CR>
" }}

" Auto commands {{

if has("autocmd")
    augroup myAutoCmds
        autocmd!
        autocmd VimEnter * redraw!

        " Cursor line only on active window
        autocmd WinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline

        " If can't find extention of a file, assume it's a C file
        autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | set syntax=c | endif

        " Spellcheck commit messages
        autocmd BufRead COMMIT_EDITMSG setlocal spell!

        " autosource vimrc and vim-plug.vim
        autocmd bufwritepost ~/.vimrc source %
        autocmd bufwritepost ~/.vim/vim-plug.vim source ~/.vimrc

        " Remember cursor position between vim sessions
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                    \   exe "normal! g'\"" |
                    \ endif

        " center buffer around cursor when opening files
        autocmd BufRead * normal zz

        " Update diff when leaving from insertmode or writing to file
        autocmd BufWritepost * if &diff == 1 | diffupdate | endif

        " Use shell syntax for .conf files
        autocmd BufRead,BufNewFile *.conf set syntax=sh

    augroup END 
endif
" }}

" Line Numbers {{
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
" }}

" Diff {{

if &diff
    " use space and backspace to jump forward/backward through differences
    nnoremap <C-j> :normal! ]c<enter>
    nnoremap <C-k> :normal! [c<enter>
    nnoremap e :qa<CR>
    nnoremap w :wa<CR>
    set nocursorline
endif

" }}

" Tags/CScope {{
function! s:add_cscope_db()
    " add any database in current directory
    let db = findfile('cscope.out', '.;')
    if !empty(db)
        silent cs reset
        silent! execute 'cs add' db
    " else add database pointed to by environment
    elseif !empty($CSCOPE_DB)
        silent cs reset
        silent! execute 'cs add' $CSCOPE_DB
    endif
endfunction

if has("cscope")
    set csto=0
    set cst
    set csverb
    set cscopetag       " Use both cscope and ctags as database
    call s:add_cscope_db()

    " Find instances of a symbol from command line
    " Yank the word under cursor, search for cscope, close the first result
    " window, open quickfix window with results, search for the word for
    " highlighting and movement with n and N
    nnoremap <leader>d :cclose<cr>:cs find g <cword><CR>   " Find definition of this symbol
    nnoremap <leader>c yiw:cclose<cr>:cs find c <cword><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>   " Find calls to this symbol
    nnoremap <leader>s yiw:cclose<cr>:cs find s <cword><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>   " Find all instances of this symbol
    nnoremap <leader>h yiw:cclose<cr>:cs find f <C-R>=expand("<cfile>:t")<CR><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>   " Find this file
    nnoremap <leader>i yiw:cclose<cr>:cs find i <C-R>=expand("<cfile>:t")<CR><CR>:bd<CR>:cwindow<CR>/<C-R>0<CR>   " Find all files including this file
    nnoremap <leader>t :pop<CR>
    set cscopequickfix=s-,c-,i-,t-,e-,f-
endif

set tags=./tags;/   " ctags path, search upwards till tags file is found

" }}

" Colorscheme {{
set t_Co=256
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_invert_selection=0
colorscheme gruvbox
hi LineNr ctermfg = darkgrey ctermbg = black
" highlight Comment cterm=italic
" }}

" Vim-Airline {{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled                      = 1
let g:airline#extensions#tabline#buffer_min_count             = 1
let g:airline#extensions#tabline#tab_min_count                = 1
let g:airline#extensions#tabline#buffer_idx_mode              = 1
let g:airline#extensions#tabline#buffer_nr_show               = 0
let g:airline#extensions#tabline#show_buffers                 = 1
" let g:airline#extensions#tagbar#enabled                       = 1
let g:airline_powerline_fonts                                 = 1
" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled       = 0
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod         = ':t'
let g:airline_section_b                           = '%{fnamemodify(getcwd(), ":t")}'
let g:airline_section_c                           = '%{fnamemodify(expand("%"), ":~:.")}'
let g:airline_section_y                           = ''
let g:airline_theme                               = 'ronakg'
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
" }}

" FZF {{
nnoremap <silent> <leader>b :Tags!<CR>
nnoremap <silent> <leader>f :FZF!<CR>
" }}

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
" }}

" vim-markdown {{
let g:vim_markdown_folding_disabled = 1
" }

"====================== WORK VIMRC ===============================
try
    source ~/.vimrc_work
catch
    " No such file? No problem; just ignore it.
endtry

"========================= SUPERTAB ===============================
let   g:SuperTabDefaultCompletionType          =   "context"
let   g:SuperTabContextDefaultCompletionType   =   "<c-n>"

"======================== Startify ===============================
let g:startify_list_order = [['Most recently used files in current directory:'], 'dir',
            \                ['Most recently used file on the system:'], 'files',
            \                ['Bookmarks:'], 'bookmarks',
            \                ['Sessions:'], 'sessions']
let g:startify_change_to_dir = 0
let g:startify_skiplist = [
                \ '.CC',
                \ ]

"==================== EASYMOTION ================================
let g:EasyMotion_smartcase = 1
let g:EasyMotion_keys = 'sdghklqwertyuiopzxcvbnmfaj'

"========================== Ack.vim ==============================
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0

if filereadable(".vim.custom")
    so .vim.custom
endif

let g:DirDiffExcludes = "*.CC*,*.c.*,.ACME*"

set switchbuf=useopen           " reveal already opened files from the
                                " quickfix window instead of opening new
                                " buffers

" ===================== UndoTree ==============================
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
    set undolevels=1000
    set undoreload=10000
endif
" focus when open
let g:undotree_SetFocusWhenToggle = 1
" relative timestamp
let g:undotree_RelativeTimestamp = 1

" Vimux {{
let g:VimuxOrientation = "h"
let g:VimuxHeight = "30"

" Run the current file with rspec
 map <Leader>rb :call VimuxRunCommand("clear; rspec " . bufname("%"))<CR>

 " Prompt for a command to run
 map <Leader>vp :VimuxPromptCommand<CR>

 " Run last command executed by VimuxRunCommand
 map <Leader>vl :VimuxRunLastCommand<CR>

 " Inspect runner pane
 map <Leader>vi :VimuxInspectRunner<CR>

 " Close vim tmux runner opened by VimuxRunCommand
 map <Leader>vq :VimuxCloseRunner<CR>

 " Interrupt any command running in the runner pane
 map <Leader>vx :VimuxInterruptRunner<CR>

 " Zoom the runner pane (use <bind-key> z to restore runner pane)
 map <Leader>vz :call VimuxZoomRunner()<CR>
" }

" Jedi.vim {{
" }

" Indentline {{
let g:indentLine_color_term = 239
" let g:indentLine_char = '|'
let g:indentLine_concealcursor=''
" }

" quick-scope {{
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }

" Modeline and Notes {{
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{,}} foldlevel=10 foldlevelstart=10 foldmethod=marker:
" }}
