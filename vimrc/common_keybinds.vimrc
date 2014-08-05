"set leader to space
let mapleader = "\<Space>"

"toggle search highlighting on/off
let hlstate=0
nnoremap <F4> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

"common commands
nnoremap <Leader>w :w<cr>
nnoremap <Leader>q :q<cr>
nnoremap <Leader>sp :setlocal spell<cr>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

"see whitepsace characters by hitting leader-l
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
nnoremap <Leader>l :set list!<CR>

"centered cursor
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

"line and column highlighting
nnoremap <Leader>cl :set cursorline!<CR>
nnoremap <Leader>cc :set cursorcolumn!<CR>

"buffers!
nnoremap <Leader>bl :buffers<cr>
nnoremap <Leader>b1 :buffer1<cr>
nnoremap <Leader>b2 :buffer2<cr>
nnoremap <Leader>b3 :buffer3<cr>
nnoremap <Leader>b4 :buffer4<cr>
nnoremap <Leader>b5 :buffer5<cr>
nnoremap <Leader>b6 :buffer6<cr>
nnoremap <Leader>b7 :buffer7<cr>
nnoremap <Leader>t  :enew<cr>
nnoremap <Leader>bq :bd<cr>

"splits!
nnoremap <Leader>o :vsplit<cr>
nnoremap <Leader>u :split<cr>
nnoremap <Leader>j <C-W>w
nnoremap <Leader>k <C-W>W


