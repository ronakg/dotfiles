" Vim-Plug {{
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-eunuch'     "Vim sugar for the UNIX shell commands that need it the most
Plug 'bling/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-sayonara'
Plug 'junegunn/fzf.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'ronakg/quickr-cscope.vim'
Plug 'tpope/vim-sleuth'         " set vim buffer options for tabs/spaces
Plug 'ronakg/quickr-preview.vim'
Plug 'rhysd/vim-clang-format', { 'for': [ 'c', 'cpp', 'h' ]}
Plug 'wellle/targets.vim'
Plug 'tpope/vim-unimpaired'
Plug 'rhysd/clever-f.vim'
Plug 'vim-utils/vim-man'
Plug 'will133/vim-dirdiff'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'elzr/vim-json'
Plug 'Raimondi/delimitMate'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-grepper'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'sickill/vim-pasta'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'qpkorr/vim-bufkill'
Plug 'nathanalderson/yang.vim'
Plug 'kana/vim-operator-user'
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for' : [ 'python' ] }
Plug 'zchee/deoplete-clang', { 'for': [ 'c', 'cpp', 'h' ]}
Plug 'Shougo/neoinclude.vim'
Plug 'sbdchd/neoformat'
Plug 'zchee/libclang-python3'

" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'

if !has('nvim')
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
endif

" Add plugins to &runtimepath
call plug#end()
" }}
