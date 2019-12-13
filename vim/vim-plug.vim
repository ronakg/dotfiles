" Vim-Plug {{
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
"Plug 'ronakg/quickr-cscope.vim', { 'for': [ 'c', 'cpp', 'h' ] }
"Plug 'ronakg/quickr-preview.vim'
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-fugitive'
Plug 'roxma/vim-tmux-clipboard'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'liuchengxu/vista.vim'
Plug 'SirVer/ultisnips', { 'for': 'go'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }
"Plug 'sheerun/vim-polyglot'
Plug 'kkoomen/vim-doge'
Plug 'uarun/vim-protobuf', { 'for': ['proto'] }
Plug 'rhysd/git-messenger.vim'
Plug 'tmsvg/pear-tree'
Plug 'machakann/vim-sandwich'
"Plug 'will133/vim-dirdiff'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }

" Add plugins to &runtimepath
call plug#end()
" }}
