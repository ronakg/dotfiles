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
Plug 'plasticboy/vim-markdown', { 'for' : [ 'markdown' ] }
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-multiple-cursors'
Plug 'mileszs/ack.vim'
Plug 'mhinz/vim-sayonara'
Plug 'will133/vim-dirdiff'
Plug 'junegunn/fzf.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-surround'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'sickill/vim-pasta'
Plug 'hdima/python-syntax', { 'for' : [ 'python' ] }
Plug 'benmills/vimux'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'davidhalter/jedi-vim', { 'for' : [ 'python' ] }
Plug 'Yggdroot/indentLine', { 'for' : [ 'python' ] }
Plug 'klen/python-mode', { 'for' : [ 'python' ] }
Plug 'ronakg/VimCompletesMe'
Plug 'ronakg/quickr-cscope.vim'
Plug 'ronakg/quickr-preview.vim'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-pseudocl' | Plug 'junegunn/vim-oblique'
Plug 'tpope/vim-unimpaired'
Plug 'rhysd/clever-f.vim'
Plug 'itchyny/vim-parenmatch'
Plug 'mbbill/undotree', { 'on' : 'UndotreeToggle' }
Plug 'chrisbra/csv.vim', { 'for' : [ 'csv' ] }
Plug 'tpope/vim-abolish' " case honoring subsitute
Plug 'justinmk/vim-syntax-extra'
Plug 'vim-utils/vim-man'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'vimwiki/vimwiki'

" Colorschemes
Plug 'ronakg/gruvbox'
" Plug 'romainl/flattened'
" Plug 'junegunn/seoul256.vim'
" Plug 'w0ng/vim-hybrid'
" Plug 'kabbamine/yowish.vim'
" Plug 'zenorocha/dracula-theme', { 'rtp' : 'vim' }
" Plug 'reedes/vim-colors-pencil'
" Plug 'altercation/vim-colors-solarized'
" Plug 'sickill/vim-monokai'
" Plug 'tomasr/molokai'
" Plug 'sjl/badwolf'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'chriskempson/tomorrow-theme', { 'rtp' : 'vim' }
" Plug 'w0ng/vim-hybrid'
" Plug 'romainl/Apprentice'
" Plug 'ajh17/spacegray.vim'
" Plug 'chriskempson/base16-vim/'

" Add plugins to &runtimepath
call plug#end()
" }}
