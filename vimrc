if !exists("g:syntax_on")
    syntax enable
endif

set history=100
set hidden
set number
set incsearch
set cindent
colorscheme desert

nmap <leader>g :GitGutterLineHighlightsToggle<CR>
map <C-n> :NERDTreeToggle<CR>

set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set autoindent smartindent
set showmode

set pastetoggle=<F2>

" vundle stuff
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
let $GIT_SSL_NO_VERIFY = 'true'
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'Valloric/YouCompleteMe'
Plugin 'W0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'chrisbra/csv.vim'
call vundle#end()
filetype plugin indent on

" Better Vimdiff colors
hi DiffAdd          ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse        gui=reverse
hi DiffChange       ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse        gui=reverse
hi DiffDelete       ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse        gui=reverse
hi DiffText         ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse        gui=reverse
set backspace=2
set encoding=utf-8
set laststatus=2

"" Flake8 Settings
let g:flake8_cmd="flake8"
let g:flake8_show_in_file=1  " show

"" YCM Settings
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinition
let g:ycm_python_binary_path = 'python'

"" ALE settings
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '👮'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
 

"" Airline settings
let g:airline#extensions#ale#enabled = 1
-

runtime macros/matchit.vim


" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
