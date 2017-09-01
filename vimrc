if !exists("g:syntax_on")
    syntax enable
endif
set history=100
set hidden
set number
set incsearch
set cindent
colorscheme desert
l
"let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

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
Plugin 'easymotion/vim-easymotion'
Plugin 'nvie/vim-flake8'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
" Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

hi DiffAdd          ctermbg=235  ctermfg=108  guibg=#262626 guifg=#87af87 cterm=reverse        gui=reverse
hi DiffChange       ctermbg=235  ctermfg=103  guibg=#262626 guifg=#8787af cterm=reverse        gui=reverse
hi DiffDelete       ctermbg=235  ctermfg=131  guibg=#262626 guifg=#af5f5f cterm=reverse        gui=reverse
hi DiffText         ctermbg=235  ctermfg=208  guibg=#262626 guifg=#ff8700 cterm=reverse        gui=reverse
set backspace=2
set encoding=utf-8
set laststatus=2

let g:flake8_cmd="flake8"
let g:flake8_show_in_file=1  " show
let g:airline_theme='wombat'
set pastetoggle=<F2>

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
