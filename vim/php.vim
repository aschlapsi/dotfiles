" Tags
let g:project_tags='tags'

if (executable('ctags'))
  autocmd FileType php nnoremap <buffer> <f8> :exe ':!~/.dotfiles/bin/php-ctags "' . g:project_tags . '"'<CR>
  autocmd BufWritePost *.php if filereadable(g:project_tags) | exec ':silent !~/.dotfiles/bin/php-ctags ' . g:project_tags . ' %' | endif
endif

