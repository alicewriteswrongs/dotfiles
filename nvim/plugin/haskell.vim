" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
" use the omnifunc provided by necoghc
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc<Paste>
let g:ycm_semantic_triggers = {'haskell' : ['.']}
