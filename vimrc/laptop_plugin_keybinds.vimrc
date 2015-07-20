"nerdtree
nnoremap <F2> :NERDTreeToggle<cr> 

"incsearch
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"tagbar
nnoremap <F10> :TagbarToggle<cr> 
nnoremap <F8> :TagbarOpen [fj]<cr> 

"simplenote
nnoremap <Leader>sn :Simplenote -n<cr> 
nnoremap <Leader>sl :Simplenote -l<cr>

"histwin
nnoremap <Leader>ub :UB<cr>

"vim-ipython (note that you need to have a .py open)
"nnoremap <Leader>ip :IPython<cr>

"open .vimrc
nnoremap <Leader>vrc :e ~/Code/dotfiles/.vimrc<cr>

"crtlp
nnoremap <Leader>p :CtrlPBufTag<cr>
nnoremap <Leader>P :CtrlPMRU<cr>

"localleader for vim-orgmode
let localleader = "\\"

"vim-pencil
nnoremap <silent> <Leader>tp :TogglePencil<cr>
