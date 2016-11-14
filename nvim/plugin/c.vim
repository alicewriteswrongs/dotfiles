augroup csettings
    autocmd!
    autocmd FileType C au BufWrite * :Autoformat
    autocmd FileType c setlocal tabstop=2
    autocmd FileType c setlocal shiftwidth=2
augroup END
