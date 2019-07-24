" Vim-Plug {{
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'fatih/vim-go'
Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
"Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
"Plug 'ronakg/quickr-cscope.vim', { 'for': [ 'c', 'cpp', 'h' ] }
"Plug 'ronakg/quickr-preview.vim'
Plug 'rhysd/vim-clang-format', { 'for': [ 'c', 'cpp', 'h' ] }
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'rhysd/clever-f.vim'
Plug 'vim-utils/vim-man'
Plug 'tpope/vim-fugitive'
"Plug 'junegunn/gv.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'sheerun/vim-polyglot'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-sleuth'
Plug 'ronakg/java-syntax.vim'

" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'

" Add plugins to &runtimepath
call plug#end()
" }}
