filetype plugin indent on "filetype based indenting 
syntax enable "syntax highlighting
set wildmenu "better command line completion
set number "line numbers
set relativenumber "relative line numbering
set background=light "stuff for solarized colorscheme
colorscheme solarized "solarized colorscheme (so tasty)
set modeline 
set modelines=5
set nofoldenable "no goddamn folding

set cursorline "line highlighting
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

""""search config
set incsearch
set ignorecase
set smartcase
set hlsearch "highlight searches
set smartindent

"defaults I want usually
set tabstop=8
set expandtab
set shiftwidth=4

"filetype specific stuff
augroup myfiletypes
    autocmd! 
    "python first
    autocmd FileType python setlocal tabstop=8
    autocmd FileType python setlocal shiftwidth=4
    autocmd FileType python setlocal expandtab
    autocmd FileType python setlocal softtabstop=4
    autocmd FileType python setlocal autoindent
    autocmd FileType python highlight Excess ctermbg=Green
    autocmd FileType python match Excess /\%79v.*/
    autocmd FileType python set nowrap
    autocmd FileType python set nojoinspaces
    "C
    autocmd FileType C set cinoptions=1s
    autocmd FileType C setlocal cindent
    autocmd FileType C setlocal expandtab
    autocmd FileType C setlocal autoindent
    autocmd FileType C set shiftwidth=4
    autocmd FileType C setlocal highlight Excess ctermbg=Green
    autocmd FileType C setlocal match Excess /\%79v.*/
    "ruby
    autocmd FileType ruby setlocal expandtab
    autocmd FileType ruby setlocal autoindent
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal expandtab
augroup END

"ruby stuff
let ruby_operators = 1
let ruby_space_errors = 1
let ruby_no_expensive = 1

set spelllang=en_us "spellcheck is in US english
set grepprg=grep\ -nH\ $*
set foldmethod=syntax

" use silver searcher because is best!
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_cashing = 0
endif

"mouse
set ttyfast
set mouse=a
set ttymouse=sgr
set mousemodel=extend
