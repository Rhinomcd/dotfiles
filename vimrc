set nocompatible
filetype off
set number
set pastetoggle=<F2>
set nobackup
set term=xterm-256color
set incsearch
colorscheme base16-bright
highlight Pmenu ctermfg=15 ctermbg=23 guifg=#ffffff guibg=#303030 
highlight PmenuSel ctermfg=15 ctermbg=130
highlight LineNr ctermfg=15 ctermbg=233
highlight visual ctermfg=15 ctermbg=130
highlight CursorLine ctermfg=15 ctermbg=23
highlight StatusLine ctermfg=15 ctermbg=235

let g:indentLine_color_term = 239
let g:indentLine_enabled = 1

set rtp+=~/.vim/bundle/Vundle.vim
set shiftwidth=2 tabstop=2 expandtab
"-----------------------"
"File Specific Settings"
"-----------------------"

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType java setlocal shiftwidth=2 tabstop=2 colorcolumn=100
"-----------------------------------------------"
" Taken from thoughtbot.com vim splits faster...
"-----------------------------------------------"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

call  vundle#begin()


Plugin 'VundleVim/Vundle.vim'
"Plugin 'base16-default-dark' needs github auth, cloned manually
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'Yggdroot/indentLine'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'honza/vim-snippets'
Plugin 'ervandew/eclim'
Plugin 'docunext/closetag.vim'

call vundle#end()
filetype plugin indent on
let g:EclimCompletionMethod = 'omnifunc'

