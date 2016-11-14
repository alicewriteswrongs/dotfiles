setlocal tabstop=2
setlocal shiftwidth=2

augroup csettings
    autocmd!
    autocmd FileType C au BufWrite * :Autoformat
augroup END
