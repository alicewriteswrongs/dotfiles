
filetype plugin indent on "filetype based indenting 
set wildmenu "better command line completion
set number "line numbers
set modeline " autoindentation

syntax enable "syntax highlighting
set background=dark "stuff for solarized colorscheme
colorscheme solarized "solarized colorscheme (so tasty)

"""no goddamn folding
set nofoldenable

"""line highlighting
set cursorline
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

""""search config
set incsearch
set ignorecase
set smartcase
set hlsearch "highlight searches

""""python friendliness
set tabstop=8 "insert 4 spaces for tab (python standard)
set shiftwidth=4 "block indent/unindent
set expandtab "insert spaces instead of tabs
set softtabstop=4 "still have delete remove 1 tab worth of spaces
set autoindent "newline matches indentation level of line above
set shiftwidth=4
set spelllang=en_us "spellcheck is in US english
set grepprg=grep\ -nH\ $*
set foldmethod=syntax
set nojoinspaces
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python highlight Excess ctermbg=Green
    autocmd FileType python match Excess /\%79v.*/
    autocmd FileType python set nowrap
    augroup END

"mouse
set ttyfast
set mouse=a
set ttymouse=xterm2
set mousemodel=extend


