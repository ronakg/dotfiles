" Vim-Plug {{
try
    source ~/.vim/vim-plug.vim
catch
    " It's okay
endtry
" }}

" Standard vim options {{
filetype plugin indent on            " filetype specific indentation
set termencoding=utf-8
set encoding=utf-8
set incsearch                        " incremental search
set ignorecase                       " ignore case in searching
set smartcase                        " don't ignore case if capital letters present
set infercase                        " ignore case on completion
set backspace=indent,eol,start       " makes backspace working
set scrolloff=4                      " keep cursor off screen edges
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
"set cindent
set smartindent
set autoindent
set copyindent
set nostartofline
set ttyfast
set lazyredraw
set gdefault                         " search/replace globally (on a line) by default
set splitright                       " Open split on right, not left
set splitbelow                       " Open split below, not above
set wildmenu
set wildmode=longest:full,list:full
set completeopt+=longest,menuone
set completeopt-=preview             " Don't open preview window
set noshowmode                       " Airline shows mode, so hide default mode
set nobackup                         " Don't need backup and swap files
set noswapfile
set pumheight=15                     " Completion menu height
set cursorline                       " Cursor line
set number                           " line numbers
set laststatus=2                     " Always show status line
set shiftround                       " Round off shift width when using >
set timeout timeoutlen=1000 ttimeoutlen=100
set wrapscan
set autoread                         " automatically reload files changed outside of Vim
set showcmd
set nohidden
set diffopt+=context:5,vertical               " 5 lines of context in diff mode
set shortmess=atToOI                 " To avoid the 'Hit Enter' prompts caused by the file messages
set updatetime=750                   " Vim refresh time
set linebreak                        " It maintains the whole words when wrapping
set complete-=i                      " Don't scan included files for completion
set cpoptions-=m                     " Highlight when CursorMoved.
set cpoptions+=I
set matchtime=1
set matchpairs+=<:>
set visualbell t_vb=                 " Disable bells
syntax on                        " Pretty syntax highlighting
set shell=bash
set fileformats="unix,dos,mac"
set omnifunc=syntaxcomplete#Complete
set csverb
set cscopetag
set previewheight=20
set conceallevel=0
set listchars=tab:▸\ ,trail:■,extends:»,precedes:«
if $TMUX == ''
    set clipboard+=unnamed
endif
" set list
" set diffopt+=iwhite                  " Ignore white space diff
" }}

if exists("&wildignorecase")
    set wildignorecase
endif

if exists("&relativenumber")
    set relativenumber
endif

" Italics support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" True 24 bit colors
if has('termguicolors')
    " set t_8f=[[38;2;%lu;%lu;%lum
    " set t_8b=[[48;2;%lu;%lu;%lum
    set termguicolors
endif

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  set t_ut=
endif

" Key remaps {{

" Space is my leader, don't assign leader to space - that causes latency
" issues
let g:mapleader = "\<Space>"

nnoremap <leader>m :Make<CR>
nnoremap <C-m> :lnext<CR>

nnoremap G :norm! Gzz<CR>

" Grep for word under the cursor
" Look for cscope.files first, if present then only search through those
" Otherwise search all subdirectories
if filereadable("cscope.files")
    " Greedy search: ignore case and don't care about word boundaries
    nnoremap <Leader>vv *:silent Ack! -k <cword> -i --files-from=cscope.files<CR>:/<CR>
    vnoremap <Leader>vv y:silent Ack! -kQ "<C-R>0" -i --files-from=cscope.files<CR>:/<C-R>0<CR>
    " Specific search: case sensitive and whole words only
    nnoremap <Leader>VV *:silent Ack! -k <cword> -w --files-from=cscope.files<CR>:/<CR>
    vnoremap <Leader>VV y:silent Ack! -kQ "<C-R>0" -w --files-from=cscope.files<CR>:/<C-R>0<CR>
else
    " Greedy search: ignore case and don't care about word boundaries
    nnoremap <Leader>vv *:silent Ack! -k <cword> -i .<CR>:/<CR>
    vnoremap <Leader>vv y:silent Ack! -kQ "<C-R>0" -i .<CR>:/<C-R>0<CR>
    " Specific search: case sensitive and whole words only
    nnoremap <Leader>VV *:silent Ack! -k <cword> -w .<CR>:/<CR>
    vnoremap <Leader>VV y:silent Ack! -kQ "<C-R>0" -w .<CR>:/<C-R>0<CR>
endif

" Don't add a newline when preview window is visible
inoremap <silent><expr> <CR>  pumvisible() ? "<C-y>" : "<C-g>u<CR>"

" Make Y behave like other motion characters
nnoremap Y y$

" Backspace in normal mode switches to last buffer
nnoremap <BS> :buffer #<CR>

" Expand matching braces only when pressing Enter
" inoremap {<CR> {<CR>}<Esc>==ko

" Don't let x and c to spoil the yank register
nnoremap x "_x
nnoremap c "_c

" back tick is more powerful, but harder to reach
noremap ' `
noremap ` '

" Make arrow key do something useful, resize the view ports accordingly
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>
nnoremap <Up> :resize -2<CR>
nnoremap <Down> :resize +2<CR>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Easier splits switching
nnoremap b <C-w>w

" Next/prev quick-fix results
nnoremap <expr> <silent> <leader>j (&diff ? "]c" : ":cnext\<CR>")
nnoremap <expr> <silent> <leader>k (&diff ? "[c" : ":cprev\<CR>")

" Quicker save and quit
nnoremap <silent> e :silent Sayonara<CR>
nnoremap <silent> w :update<CR>
inoremap <silent> jj <Esc>

" Paste in insert mode
inoremap <C-p> <C-r>0

" Clear highlighted searches
nnoremap ,/ :nohlsearch<CR><Esc>

" Easier to get command prompt
nnoremap ; :
vnoremap ; :

" x in Insert mode
inoremap <C-d> <C-o>x

" Jump to start and end of line using the home row keys
nmap 0 ^

" Make j and k move to the next row, not file line {{{1
nnoremap j gj
nnoremap k gk

nnoremap <leader>l :call NumberToggle()<CR>

" Add a heading/subheading to current line
nnoremap <leader>= yypVr=<Esc>==
nnoremap <leader>- yypVr-<Esc>==

" Poor man's autopair
inoremap {<CR> {<CR>}<Esc>O

" Go to end of yanked/pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
" }}

" UpdateGlobalDB() {{
"
" Incrementally update the database generated by GNU GLOBAL
function! UpdateGlobalDB(file)
    if &csprg == "gtags-cscope"
        try
            silent! execute '!global --single-update ' . a:file
        catch
        endtry
    endif
endfunction
" }}

" Auto commands {{
if has("autocmd")
    augroup mycommands
        autocmd!
        autocmd VimEnter * redraw!

        " Cursor line only on active window
        autocmd WinEnter * setlocal cursorline
        autocmd WinLeave * setlocal nocursorline

        autocmd BufWritePre * :%s/\s\+$//e

        " Refresh buffer on entering, works with autoread
        au WinEnter * :silent! checktime

        " In a diff window, if can't find extension of a file, assume it's a C file
        autocmd BufNewFile,BufRead * if (expand('%:t') !~ '\.') && (&diff == 1) | set syntax=c | endif

        " Spell check commit messages
        autocmd BufRead COMMIT_EDITMSG setlocal spell!

        " Remember cursor position between vim sessions
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                    \   exe "normal! g'\"" |
                    \ endif

        " Update diff when leaving from insertmode or writing to file
        autocmd BufWritepost * if &diff == 1 | diffupdate | endif

        if &csprg == "gtags-cscope"
            " Update GLOBAL database after file is written
            autocmd BufWritepost * call UpdateGlobalDB(expand("<afile>"))
            autocmd User QfReplacementBufWritePost doautocmd BufWritePost
        endif

        " Use shell syntax for .conf files
        autocmd BufRead,BufNewFile *.conf set syntax=sh

        " Open the result from quickfix window and close the quickfix window
        autocmd FileType qf nnoremap <buffer> o <CR>:cclose<CR>

        " Open help in vertical split
        autocmd FileType help wincmd L
    augroup END
endif
" }}

" Compile_C {{
function! Compile_C()
    setlocal makeprg='gcc -g -Wall %'
    Make!
endfunction
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
endfunction
" }}

" Diff {{
if &diff
    nnoremap e :qa<CR>
    nnoremap w :wa<CR>
    set nocursorline
    set nonu
    set nornu
endif
" }}


set tags=./tags;/   " ctags path, search upwards till tags file is found

" }}

" Colorscheme {{
set background=dark
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_improved_strings=0
let g:gruvbox_improved_warnings=1
let g:gruvbox_invert_selection=0
let g:gruvbox_contrast_dark='medium'
colorscheme gruvbox
highlight LineNr guibg=#1d2021
highlight CursorLine guibg=#1d2021
highlight CursorColumn guibg=#1d2021
highlight CursorLineNr guibg=#1d2021
" }}

" Vim-Airline {{
" Enable the list of buffers
let g:airline#extensions#tabline#enabled                      = 1
let g:airline#extensions#tabline#buffer_min_count             = 1
let g:airline#extensions#tabline#tab_min_count                = 1
let g:airline#extensions#tabline#buffer_idx_mode              = 1
let g:airline#extensions#tabline#buffer_nr_show               = 0
let g:airline#extensions#tabline#show_buffers                 = 1
let g:airline#extensions#branch#enabled                       = 1
let g:airline#extensions#tagbar#enabled                       = 0
let g:airline_powerline_fonts                                 = 1
" don't count trailing whitespace since it lags in huge files
let g:airline#extensions#whitespace#enabled       = 0
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod         = ':t'
let g:airline_theme                               = 'base16'
"let g:airline_section_b                           = '%{fnamemodify(getcwd(), ":t")}'
let g:airline_section_c                           = '%{fnamemodify(expand("%"), ":~:.")}'
"let g:airline_section_x                           = airline#section#create(['%{tagbar#currenttag("%s", "")}'])
let g:airline_section_x                           = '%{fnamemodify(getcwd(), ":t")}'
let g:airline_section_y                           = airline#section#create(['filetype'])
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
nnoremap <silent> <leader>b :Tags<CR>
nnoremap <silent> <leader>p :FZF<CR>
nnoremap <silent> <leader>/ :Lines<CR>
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
" }}

" vim-instant-markdown {{
let g:instant_markdown_autostart = 0
" }}

" WORK {{
try
    source ~/.vimrc_work
catch
    " No such file? No problem; just ignore it.
endtry
" }}

" Startify {{
let g:startify_list_order = [['Most recently used files in current directory:'], 'dir',
            \                ['Most recently used file on the system:'], 'files',
            \                ['Sessions:'], 'sessions',
            \                ['Bookmarks:'], 'bookmarks']
let g:startify_change_to_dir = 0
let g:startify_files_number = 7
let g:startify_enable_unsafe = 1
let g:startify_skiplist = [
                \ '.CC',
                \ ]
" }}

" Ack.vim {{
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0

if filereadable(".vim.custom")
    so .vim.custom
endif
" }}

let g:DirDiffExcludes = "*.CC*,*.c.*,.ACME*"

" UndoTree {{
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
" }}

" Vimux {{
let g:VimuxOrientation = "h"
let g:VimuxHeight = "30"

" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>

" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>

" Zoom the runner pane (use <bind-key> z to restore runner pane)
map <Leader>vz :call VimuxZoomRunner()<CR>
" }

" Jedi.vim {{
" }

" Indentline {{
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceChar = '·'
let g:indentLine_concealcursor=''
set conceallevel=1
let g:indentLine_conceallevel=1
" }

" quick-scope {{
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }

" python-mode {{
let g:pymode_folding = 0
let g:pymode_options_max_line_length = 119
let g:pymode_rope = 0
let g:pymode_lint_cwindow = 0
let g:pymode_virtualenv = 0
" }}

" Clever-f {{
let g:clever_f_ignore_case = 1
let g:clever_f_fix_key_direction = 1
" }}

" NERDCommenter {{
let g:NERDCreateDefaultMappings = 0
let g:NERDRemoveExtraSpaces = 0
nmap gc <plug>NERDCommenterToggle
vmap gc <plug>NERDCommenterSexy
map gx <plug>NERDCommenterToggle
" }}

command! -nargs=+ Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

nnoremap <C-s> :Silent bash<CR>

" vim-man {{
nmap K <plug>(Vman)
" }}

" VimCompletesMe {{
let g:vcm_direction = 'p'
" }}

" EasyMotion {{
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
" }}

" vim-oblique {{
let g:oblique#incsearch_highlight_all = 1
" }}

" quickr-cscope.vim {{
let g:quickr_cscope_autoload_db = 1
let g:quickr_cscope_use_qf_g = 1
let g:quickr_cscope_debug_mode = 0
" }

" quickr-previe.vim {{
nmap <leader><space> <plug>(quickr_preview)
" }}

" vimwiki {{
let g:vimwiki_list = [{'path': '~/Dropbox/Public/vimwiki'}]
" }

" Vimux {{
nnoremap <C-p> :call VimuxRunLastCommand()<CR>
" }

let g:rg_command = '
\ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
\ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf,h,hpp,sh}"
\ -g "!*.min.js" -g "!cscope*"
\ -g "!.git/*" -g "!node_modules/*" -g "!vendor/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

" Modeline and Notes {{
" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={{,}} foldlevel=10 foldlevelstart=10 foldmethod=marker:
" }}
