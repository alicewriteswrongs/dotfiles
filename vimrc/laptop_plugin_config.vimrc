"crtlp
let g:ctrlp_extensions = ['buffertag']

"emmet-vim (html macro-ey things)
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"incsearch
let g:incsearch#auto_nohlsearch = 1

"tmuxline.vim
let g:tmuxline_preset = {
    \'a' : '#S',
    \'win'  : '#W',
    \'cwin'  : '#W',
    \'y' : '%l:%M',
    \'z' : '#h',
    \'options': {
        \'status-justify': 'left'}
    \}

"vim-latexsuite
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_Flavor='latex'
let g:Tex_ViewRule_pdf='mupdf'

"vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline_powerline_fonts = 1

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

"tmux navigator (best!)
let g:tmux_navigator_save_on_switch = 1
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> h :TmuxNavigateLeft<cr>
nnoremap <silent> j :TmuxNavigateDown<cr>
nnoremap <silent> k :TmuxNavigateUp<cr>
nnoremap <silent> l :TmuxNavigateRight<cr>
nnoremap <silent> \ :TmuxNavigateRight<cr>

