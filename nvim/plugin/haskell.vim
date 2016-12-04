" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
" use the omnifunc provided by necoghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:hindent_on_save = 1
let g:hindent_line_length = 80
let g:hindent_indent_size = 4

augroup ft_haskell
    au!
    au FileType haskell setlocal omnifunc=necoghc#omnifunc
    au FileType haskell compiler ghc
    au FileType haskell nnoremap <silent><buffer> git :GhcModTypeInsert<CR>
    au FileType haskell nnoremap <silent><buffer> gfs :GhcModSplitFunCase<CR>
    au FileType haskell nnoremap <silent><buffer> gtt :GhcModType<CR>
augroup END
