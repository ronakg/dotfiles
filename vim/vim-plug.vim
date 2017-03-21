" Vim-Plug {{
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-multiple-cursors'
Plug 'mhinz/vim-sayonara'
Plug 'junegunn/fzf.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'ronakg/quickr-cscope.vim'
Plug 'ronakg/quickr-preview.vim'
Plug 'rhysd/vim-clang-format'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-pseudocl' | Plug 'junegunn/vim-oblique'
Plug 'tpope/vim-unimpaired'
Plug 'rhysd/clever-f.vim'
Plug 'stephpy/vim-yaml'
Plug 'mbbill/undotree', { 'on' : 'UndotreeToggle' }
Plug 'vim-utils/vim-man'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'hdima/python-syntax'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'elzr/vim-json'
Plug 'mzlogin/vim-markdown-toc'
Plug 'Raimondi/delimitMate'
Plug 'mileszs/ack.vim'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'sickill/vim-pasta'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'python-mode/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline-themes'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi', { 'for' : [ 'python' ] }
    Plug 'zchee/deoplete-clang', { 'for': [ 'c', 'cpp', 'h' ]}
    Plug 'Shougo/neoinclude.vim'
    Plug 'sbdchd/neoformat'
    Plug 'nathanalderson/yang.vim'
    Plug 'zchee/libclang-python3'
    Plug 'neomake/neomake'
    Plug 'artur-shaik/vim-javacomplete2'
endif

" Add plugins to &runtimepath
call plug#end()
" }}
