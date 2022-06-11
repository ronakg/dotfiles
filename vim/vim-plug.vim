" Vim-Plug {{
if !filereadable(expand('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-obsession'
"Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
"Plug 'Yggdroot/indentLine'
"Plug 'ronakg/quickr-cscope.vim', { 'for': [ 'c', 'cpp', 'h' ] }
Plug 'ronakg/quickr-preview.vim'
Plug 'wellle/targets.vim'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'kana/vim-operator-user'
Plug 'haya14busa/vim-operator-flashy'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'sickill/vim-pasta'
Plug 'sunaku/tmux-navigate'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'machakann/vim-sandwich'
Plug 'farmergreg/vim-lastplace'                         " open files at the last edited place
Plug 'gabrielelana/vim-markdown', { 'for': 'md' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'roxma/vim-tmux-clipboard'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kovetskiy/vim-autoresize'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'

" Add plugins to &runtimepath
call plug#end()
" }}
