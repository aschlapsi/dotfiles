" General settings
set number
set nocompatible
set colorcolumn=80
set encoding=utf-8

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
Plugin 'jnurmine/Zenburn'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vimoutliner/vimoutliner'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'

Plugin 'Shougo/neocomplete.vim'
Plugin 'majutsushi/tagbar'

" Plugins for Python development
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

call vundle#end()

" Enable syntax highlighting
let python_highlight_all=1
syntax on
filetype plugin indent on

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

" Access system clipboard on Mac OS X
set clipboard=unnamed

" Setup color theme
colorscheme zenburn

" Indentation settings for full stack web development
au BufNewFile,BufRead *.js, *.html, *.css
  \ set tabstop=2
  \ set softtabstop=2
  \ set shiftwidth=2

" Flag unnecessary whitespace
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let NERDTreeIgnore=['\.pyc$', '\~$']  " ignore files in NERDTree

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=5

source $HOME/.dotfiles/vim/python.vim
source $HOME/.dotfiles/vim/php.vim

