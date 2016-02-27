" General settings
set number
set nocompatible
set colorcolumn=80

" Setup color theme
" syntax on
" let g:solarized_termtrans = 1
" source ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim
" colorscheme solarized
" togglebg#map("<F5>")

" Setup tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set smarttab

" Setup Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

Plugin 'scrooloose/nerdtree'
Plugin 'vimoutliner/vimoutliner'
Plugin 'bling/vim-airline'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'

Plugin 'Shougo/neocomplete.vim'
Plugin 'majutsushi/tagbar'

call vundle#end()

" Enable syntax highlighting
syntax on
filetype plugin indent on

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

