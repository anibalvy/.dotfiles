" Set TAB dimesion formatting by language
" For Python
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
" For YAML
autocmd FileType yaml set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType yml set tabstop=2|set shiftwidth=2|set expandtab
" for CSS
"autocmd Filetype css setlocal tabstop=4

"turn off expandtab for editing makefiles
autocmd FileType make setlocal noexpandtab
