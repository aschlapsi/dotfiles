" PEP8 indentation for Python files
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 expandtab autoindent
au BufNewFile,BufRead *.py set textwidth=79 fileformat=unix
au BufWritePost *.py call Flake8()

nnoremap <buffer> <f9> :call Flake8()

" Tags
let g:project_tags='tags'

if (executable('ctags'))
  autocmd FileType python nnoremap <buffer> <f8> :exe ':!~/.dotfiles/bin/py-ctags "' . g:project_tags . '"'<CR>
  autocmd BufWritePost *.py if filereadable(g:project_tags) | exec ':silent !~/.dotfiles/bin/py-ctags ' . g:project_tags . ' %' | endif
endif

