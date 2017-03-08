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
"Plug 'will133/vim-dirdiff'
Plug 'junegunn/fzf.vim'
Plug 'stefandtw/quickfix-reflector.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
"Plug 'ronakg/VimCompletesMe'
Plug 'ronakg/quickr-cscope.vim'
Plug 'ronakg/quickr-preview.vim'
Plug 'wellle/targets.vim'
Plug 'junegunn/vim-pseudocl' | Plug 'junegunn/vim-oblique'
Plug 'tpope/vim-unimpaired'
Plug 'rhysd/clever-f.vim'
Plug 'stephpy/vim-yaml'
Plug 'mbbill/undotree', { 'on' : 'UndotreeToggle' }
Plug 'vim-utils/vim-man'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'hdima/python-syntax'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'jsfaint/gen_tags.vim'
Plug 'elzr/vim-json'
Plug 'mzlogin/vim-markdown-toc'
Plug 'Raimondi/delimitMate'
Plug 'mileszs/ack.vim'
Plug 'roxma/vim-tmux-clipboard'
"Plug 'arakashic/chromatica.nvim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'sickill/vim-pasta'

" Colorschemes
Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim/'
Plug 'vim-airline/vim-airline-themes'
"Plug 'rakr/vim-one'
"Plug 'lifepillar/vim-solarized8'
"Plug 'romainl/flattened'
"Plug 'junegunn/seoul256.vim'
"Plug 'w0ng/vim-hybrid'
"Plug 'kabbamine/yowish.vim'
"Plug 'zenorocha/dracula-theme'
"Plug 'reedes/vim-colors-pencil'
"Plug 'altercation/vim-colors-solarized'
"Plug 'sickill/vim-monokai'
"Plug 'tomasr/molokai'
"Plug 'sjl/badwolf'
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'chriskempson/tomorrow-theme', { 'rtp' : 'vim' }
"Plug 'romainl/Apprentice'
"Plug 'ajh17/spacegray.vim'
"Plug 'mhartington/oceanic-next'

if has('nvim')
    Plug 'brooth/far.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi', { 'for' : [ 'python' ] }
    Plug 'zchee/deoplete-clang', { 'for': [ 'c', 'cpp', 'h' ]}
    Plug 'Shougo/neoinclude.vim'
    Plug 'sbdchd/neoformat'
    Plug 'nathanalderson/yang.vim'
    Plug 'zchee/libclang-python3'
    Plug 'neomake/neomake'
endif

" Add plugins to &runtimepath
call plug#end()
" }}
