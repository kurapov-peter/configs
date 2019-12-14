set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on

set tabstop=4 
set shiftwidth=4 
set softtabstop=4 
set smarttab 
set expandtab 


set incsearch 
set hlsearch
set scrolloff=5
set wildmenu 
set title 
set nu
hi CursorLine term=none cterm=none ctermbg=0  
set cul                                           " highlight current line 

" Get rid of annoying Q problem 
command-bang Q q<bang> 
nnoremap ; : 
 
" when we reload, tell vim to restore the cursor to the saved position 
augroup JumpCursorOnEdit 
au! 
autocmd BufReadPost * 
\ if expand("<afile>:p:h") !=? $TEMP | 
\ if line("'\"") > 1 && line("'\"") <= line("$") | 
\ let JumpCursorOnEdit_foo = line("'\"") | 
\ let b:doopenfold = 1 | 
\ if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) | 
\ let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 | 
\ let b:doopenfold = 2 | 
\ endif | 
\ exe JumpCursorOnEdit_foo | 
\ endif | 
\ endif 
" Need to postpone using "zv" until after reading the modelines. 
autocmd BufWinEnter * 
\ if exists("b:doopenfold") | 
\ exe "normal zv" | 
\ if(b:doopenfold > 1) | 
\ exe "+".1 | 
\ endif | 
\ unlet b:doopenfold | 
\ endif 
augroup END 

" support ispc syntax highlighting
augroup ispc_ft
au!
autocmd BufNewFile,BufRead *.ispc set syntax=cpp
augroup END
