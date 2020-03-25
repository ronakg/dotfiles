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
"Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'sickill/vim-pasta'
Plug 'tpope/vim-sleuth'
Plug 'christoomey/vim-tmux-navigator'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'sheerun/vim-polyglot'
Plug 'kkoomen/vim-doge'
"Plug 'uarun/vim-protobuf', { 'for': ['proto'] }
Plug 'rhysd/git-messenger.vim'
"Plug 'tmsvg/pear-tree'
Plug 'machakann/vim-sandwich'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'psliwka/vim-smoothie'
Plug 'farmergreg/vim-lastplace'                         " open files at the last edited place
Plug 'romainl/vim-cool'                                 " disable hl until another search is performed
"Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'pechorin/any-jump.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'liuchengxu/vista.vim'

" Colorschemes
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/gruvbox-material'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'
Plug 'AlessandroYorba/Despacio'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'manasthakur/papercolor-theme'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'hzchirs/vim-material'
Plug 'arzg/vim-colors-xcode'
Plug 'jacoborus/tender.vim'
Plug 'tomasr/molokai'

" Add plugins to &runtimepath
call plug#end()
" }}
