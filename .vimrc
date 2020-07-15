set nocompatible
filetype off

" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --bin
set rtp+=~/.fzf
nnoremap <c-p> :FZF<cr>

filetype plugin indent on

set bg=dark
set expandtab
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set mouse=a
set number
set shiftwidth=2
set showmatch
set smartcase
set tabstop=2

" chromium helpers
source ~/chromium/src/tools/vim/clang-format.vim
source ~/chromium/src/tools/vim/ninja-build.vim

" key map - switch between .h and .cpp
nnoremap <Leader>cpp :e %<.cpp<CR>
nnoremap <Leader>cc :e %<.cc<CR>
nnoremap <Leader>h :e %<.h<CR>

au BufWritePost *.go !gofmt -w %

syntax on
