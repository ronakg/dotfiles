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
Plug 'tpope/vim-dispatch'
Plug 'mhinz/vim-startify'
Plug 'junegunn/fzf.vim'
Plug 'stefandtw/quickfix-reflector.vim'
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
"Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-tmux-navigator'
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'
Plug 'roxma/vim-tmux-clipboard'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'w0rp/ale'
Plug 'nathanalderson/yang.vim'
Plug 'kana/vim-operator-user'
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
"Plug 'maralla/completor.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi', { 'for' : [ 'python' ] }
Plug 'tweekmonster/deoplete-clang2'
Plug 'Shougo/neoinclude.vim'
Plug 'sbdchd/neoformat'
Plug 'Shougo/echodoc.vim'
Plug 'junegunn/gv.vim'

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
