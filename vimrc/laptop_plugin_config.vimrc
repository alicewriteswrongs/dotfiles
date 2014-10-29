
"crtlp
let g:ctrlp_extensions = ['buffertag']

"Simplenote.vim
source ~/.simplenoterc
let g:SimplenoteListHeight=55
let g:SimplenoteVertical=0
let g:SimplenoteFiletype='markdown'

"vim-latexsuite
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_Flavor='latex'
let g:Tex_ViewRule_pdf='mupdf'

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_powerline_fonts = 1

let g:limelight_conceal_ctermfg = 'bg'
"vim-slime
"let g:slime_target = "tmux"

"tslime.vim
let g:tsline_ensure_trailing_newlines = 1

"vim-pencil
let g:pencil#wrapModeDefault = 'hard'
let g:pencil#autoformat = 1
let g:pencil#conceallevel = 0

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
  autocmd FileType tex          call pencil#init({'wrap': 'hard'})
augroup END



"haskellmode_vim
au BufEnter *.hs compiler ghc
let g:haddock_browser="/usr/bin/chromium"
