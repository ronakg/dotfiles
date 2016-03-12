" Vim-Plug {{
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-dispatch'
Plug 'mbbill/echofunc', { 'for' : [ 'c', 'cpp' ] }
Plug 'vim-scripts/auto_autoread.vim'
Plug 'plasticboy/vim-markdown', { 'for' : [ 'markdown' ] }
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-sayonara'
Plug 'will133/vim-dirdiff'
Plug 'junegunn/fzf.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-surround'
Plug 'nelstrom/vim-visual-star-search'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'sickill/vim-pasta'
Plug 'reedes/vim-colors-pencil'
Plug 'mbbill/undotree'
Plug 'hdima/python-syntax', { 'for' : [ 'python' ] }
Plug 'lucapette/vim-textobj-underscore'
Plug 'kana/vim-textobj-user'
Plug 'benmills/vimux'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'davidhalter/jedi-vim', { 'for' : [ 'python' ] }
Plug 'Yggdroot/indentLine', { 'for' : [ 'python' ] }
Plug 'kien/rainbow_parentheses.vim', { 'for' : [ 'python' ] }
Plug 'klen/python-mode', { 'for' : [ 'python' ] }
Plug 'zenorocha/dracula-theme', { 'rtp' : 'vim' }
Plug 'ajh17/VimCompletesMe'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-pseudocl' | Plug 'junegunn/vim-oblique'
Plug 'unblevable/quick-scope'
"Plug 'chrisbra/csv.vim'
"Plug 'edkolev/tmuxline.vim'
"Plug 'edkolev/promptline.vim'

" Add plugins to &runtimepath
call plug#end()
" }}
