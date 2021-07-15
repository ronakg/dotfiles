" Vim-Plug {{
if !filereadable(expand('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Use system fzf installation
set rtp+=/usr/local/opt/fzf

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
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
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'sickill/vim-pasta'
Plug 'sunaku/tmux-navigate'
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tmsvg/pear-tree'
Plug 'machakann/vim-sandwich'
Plug 'farmergreg/vim-lastplace'                         " open files at the last edited place
Plug 'romainl/vim-cool'                                 " disable hl until another search is performed
Plug 'camspiers/lens.vim'
Plug 'godlygeek/tabular'
Plug 'gabrielelana/vim-markdown'
Plug 'ronakg/vim-sleuth'
Plug 'neoclide/jsonc.vim'
if !&diff
    Plug 'neoclide/coc.nvim'
endif

" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'

" Add plugins to &runtimepath
call plug#end()
" }}
