set nocompatible 

let highlight_balanced_quotes = 1 

set background=dark 
set statusline=%<%f%h%m%r%=%#MyHi#\ enc=%{&encoding}\ %4lL\ %3cC\ %4P:%L 

let highlight_function_name = 1 
let python_highlight_numbers = 1 
let python_highlight_builtins = 1   "was commented 
let python_highlight_exceptions = 1 
let python_highlight_space_errors = 1  "was commented 

syntax on 

hi SpecialKey       ctermfg=4 
hi NonText          cterm=bold 
hi Directory        ctermfg=4 
hi ErrorMsg         ctermbg=1 
hi Search           ctermbg=3 
hi MoreMsg          cterm=bold  ctermfg=2 
hi ModeMsg          cterm=bold 
hi LineNr           ctermfg=3 
hi Question         cterm=bold  ctermfg=2 
hi StatusLine       cterm=reverse 
hi Title            cterm=bold  ctermfg=4 
hi Visual           cterm=reverse 
hi WarningMsg       ctermfg=1 
hi Comment          cterm=bold ctermfg=4 
hi Constant         ctermfg=2 
hi Identifier       ctermfg=3 
hi Statement        ctermfg=6 
hi PreProc          ctermfg=5 
hi Type             cterm=bold ctermfg=2 
hi Special          ctermfg=2 
hi Error            ctermbg=1 
hi Todo             ctermbg=3 
hi Operator         ctermfg=6 

" yes, use mouse in text mode 

set mouse=a 

set ai 
set nomodeline 
set tabstop=4 
set shiftwidth=4 
set softtabstop=4 
set smarttab 
set expandtab 
set bs=2 
set splitbelow 
set wildmenu 
set nowrap 
set number 
set scrolloff=5               " keep at least 5 lines above/below 
" set colorcolumn=120 
set showmatch 
" set ignorecase 

set nohls 
set nobackup 
set noequalalways 
set gdefault 
set incsearch 
set hlsearch 
set history=500 
set nostartofline 
set laststatus=2 
set title 
set cinoptions=t0,(0,)100,*100 
  
set ruler 
set showcmd 
set ttyfast 
"set maxmem=1000000 
"set maxmemtot=10000000 


" Get rid of annoying Q problem 
command-bang Q q<bang> 
"command Wq wq 
"command W w 
"command WQ wq 
nnoremap ; : 
  

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$" 
    set fileencodings=utf-8,latin1 
endif 

set backspace=indent,eol,start 

" Favorite Color Scheme 
"colorscheme base16-tomorrow-night 
set cul                                           " highlight current line 

hi CursorLine term=none cterm=none ctermbg=0  


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
