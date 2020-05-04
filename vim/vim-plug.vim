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
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-startify'
"Plug 'stefandtw/quickfix-reflector.vim'
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
"Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'sickill/vim-pasta'
Plug 'sunaku/tmux-navigate'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'sheerun/vim-polyglot'
Plug 'kkoomen/vim-doge'
"Plug 'uarun/vim-protobuf', { 'for': ['proto'] }
"Plug 'rhysd/git-messenger.vim'
"Plug 'tmsvg/pear-tree'
Plug 'machakann/vim-sandwich'
if !&diff
      Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
"Plug 'axelf4/vim-strip-trailing-whitespace'
"Plug 'psliwka/vim-smoothie'
Plug 'farmergreg/vim-lastplace'                         " open files at the last edited place
Plug 'romainl/vim-cool'                                 " disable hl until another search is performed
"Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
"Plug 'pechorin/any-jump.vim'
Plug 'gabrielelana/vim-markdown'
"Plug 'liuchengxu/vista.vim'
"Plug 'junkblocker/git-time-lapse'
Plug 'ronakg/vim-sleuth'

" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
"Plug 'sainnhe/sonokai'
"Plug 'jacoborus/tender.vim'
"Plug 'dracula/vim', { 'name': 'dracula' }
"Plug 'lifepillar/vim-gruvbox8'

" Add plugins to &runtimepath
call plug#end()
" }}
