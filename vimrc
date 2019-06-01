if !exists("g:syntax_on")
    syntax enable
endif
set history=100
set hidden
set number
set incsearch
set cindent
set wrap
au VimEnter * if &diff | execute 'windo set wrap' | endif
colorscheme desert

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
Plugin 'W0rp/ale'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
call vundle#end()
filetype plugin indent on
nmap <leader>g :GitGutterLineHighlightsToggle<CR>
map <C-n> :NERDTreeToggle<CR>


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
autocmd FileType python map <buffer> <F8> :call Flake8()<CR>


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


function SplitTU4R()
    %s/\(TU4R\|ENDS\|PH01\|SH01\|NM01\|AD01\|PN01\|EM01\|SD01\|PR01\|TR01\|SC01\|PI01\|CL01\|CH01\|IN01\|LK01\|SA01\|AO01\|CS01\|SM01\|CI01\)/\r\1/g
endfunction

function UnSplitTU4R()
    %s/\n\(TU4R\|ENDS\|PH01\|SH01\|NM01\|AD01\|PN01\|EM01\|SD01\|PR01\|TR01\|SC01\|PI01\|CL01\|CH01\|IN01\|LK01\|SA01\|AO01\|CS01\|SM01\|CI01\)/\1/g
endfunction

autocmd BufRead *.tuc :call SplitTU4R()
autocmd BufWrite *.tuc :call UnSplitTU4R()

autocmd Filetype sh setlocal tabstop=3 expandtab shiftwidth=3

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
