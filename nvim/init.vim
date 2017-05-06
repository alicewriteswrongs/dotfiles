""""""""""""""""""""""""""""""""""""""""""""""""""
"""Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

let mapleader = "\<Space>" "set leader to space

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" JS / CoffeeScript
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mtscout6/vim-cjsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'leafgarland/typescript-vim'
Plugin 'flowtype/vim-flow'

" other web stuff
Plugin 'othree/html5-syntax.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elzr/vim-json'

" ruby
Plugin 'tpope/vim-bundler'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'

" crystal
Plugin 'rhysd/vim-crystal'

" python
Plugin 'Vimjas/vim-python-pep8-indent'

" elixir
Plugin 'elixir-lang/vim-elixir'

" purescript
Plugin 'raichoo/purescript-vim'
Plugin 'frigoeu/psc-ide-vim'

" haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'alx741/vim-hindent'
Plugin 'eagletmt/neco-ghc'
Plugin 'pbrisbin/vim-syntax-shakespeare'
Plugin 'alx741/vim-yesod'

" colorschemes
Plugin 'altercation/vim-colors-solarized'
" Plugin 'chriskempson/base16-vim'
" Plugin 'NLKNguyen/papercolor-theme'
" Plugin 'morhetz/gruvbox'

" statusline
Plugin 'itchyny/lightline.vim'

" tmux
Plugin 'edkolev/tmuxline.vim'
Plugin 'jgdavey/tslime.vim'
Plugin 'wellle/tmux-complete.vim'

" git
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'

" utility
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-unimpaired'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Yggdroot/indentLine'
Plugin 'jamessan/vim-gnupg'
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'valloric/youcompleteme'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'carlitux/deoplete-ternjs'
Plugin 'Chiel92/vim-autoformat'
Plugin 'machakann/vim-highlightedyank'
Plugin 'lilydjwg/colorizer'
Plugin 'vim-scripts/SyntaxRange'
Plugin 'vim-scripts/ingo-library'
Plugin 'tommcdo/vim-lion'

" file opening / search
Plugin 'haya14busa/incsearch.vim' "nice incremental search
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy search
Plugin 'rking/ag.vim' "wrapper for ag
Plugin 'justinmk/vim-sneak'
Plugin 'blarghmatey/split-expander'

" elm
Plugin 'elmcast/elm-vim'

" go
Plugin 'fatih/vim-go'

" rust
Plugin 'rust-lang/rust.vim' "some rust stuff

" C/C++
" Plugin 'jeaye/color_coded' "not yet in neovim :(

" racket / scheme
" Plugin 'vim-scripts/paredit.vim' "lisp/racket S-expressions
Plugin 'wlangstroth/vim-racket'

" clojure
Plugin 'clojure-vim/nvim-parinfer.js'

" i3
Plugin 'PotatoesMaster/i3-vim-syntax'

" email
Plugin 'guyzmo/notmuch-abook' "get emails out of notmuch db for autocomplete
Plugin 'vim-scripts/lbdbq' "formats mail headers more nicely

" markdown / prose writing
" Plugin 'suan/vim-instant-markdown'
Plugin 'reedes/vim-pencil'
Plugin 'jceb/vim-orgmode'

"xonsh
Plugin 'linkinpark342/xonsh-vim'

" neovim-specific
Plugin 'neomake/neomake'
Plugin 'neovim/node-host'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""general configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""

augroup myfiletypes
    autocmd!
    autocmd BufRead,BufNewFile *.arb setfiletype ruby
    autocmd FileType coffee setlocal expandtab
    autocmd FileType coffee setlocal autoindent
    autocmd FileType coffee setlocal shiftwidth=2
    autocmd FileType coffee setlocal softtabstop=2
    "html
    autocmd FileType html setlocal expandtab
    autocmd FileType html setlocal autoindent
    autocmd FileType html setlocal shiftwidth=2
    autocmd FileType html setlocal softtabstop=2
    autocmd FileType htmldjango setlocal expandtab
    autocmd FileType htmldjango setlocal autoindent
    autocmd FileType htmldjango setlocal shiftwidth=2
    autocmd FileType htmldjango setlocal softtabstop=2
    autocmd FileType eruby setlocal expandtab
    autocmd FileType eruby setlocal autoindent
    autocmd FileType eruby setlocal shiftwidth=2
    autocmd FileType eruby setlocal softtabstop=2
    "scss
    autocmd FileType scss setlocal expandtab
    autocmd FileType scss setlocal autoindent
    autocmd FileType scss setlocal shiftwidth=2
    autocmd FileType scss setlocal softtabstop=2
    autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
    "js
    autocmd FileType javascript setlocal expandtab
    autocmd FileType javascript setlocal autoindent
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2
    autocmd FileType javascript UltiSnipsAddFiletypes javascript-es6 
    autocmd FileType javascript UltiSnipsAddFiletypes javascript-mocha
    "org
    autocmd FileType org setlocal foldenable
    autocmd FileType org setlocal nolist
    "go
    autocmd FileType go setlocal tabstop=2
    autocmd FileType go setlocal shiftwidth=2
    "purescript
    autocmd FileType purescript setlocal shiftwidth=2
augroup END
" autocmd! BufWritePost * Neomake

"colorscheme
colorscheme solarized
let g:solarized_visibility='normal'
set background=light
syntax on

"lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ],
    \             [ 'ctrlpmark' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
    \ },
    \ 'component_function': {
    \   'fugitive': 'LightLineFugitive'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
    \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
    \ },
    \ }

function! LightLineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP' && has_key(g:lightline, 'ctrlp_item')
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction


"random options
set relativenumber
let ruby_operators=1
let ruby_space_errors=1
let ruby_no_expensive=1
set hidden
set lazyredraw
set number
set wildmenu "better command line completion
set modeline
set nofoldenable "no goddamn folding
set cursorline "line highlighting
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
set incsearch
set ignorecase
set smartcase
set hlsearch "highlight searches
set smartindent
set backspace=indent,eol,start
set tabstop=8
set expandtab
set shiftwidth=4
set ruler
set spelllang=en_us "spellcheck is in US english
set grepprg=grep\ -nH\ $*
set laststatus=2
set noshowmode
set ttyfast
set mouse=a
if !has('nvim')
    set ttymouse=sgr
endif
set mousemodel=extend
set lcs=trail:.,tab:>\ 
" set list

" highlight StatusLine ctermfg=blue ctermbg=yellow
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
    let g:ctrlp_use_caching = 0
    let g:CrtlSpaceglobCommand = 'ag %s -l --nocolor --hidden -g ""'
endif

"" fix the swapfile situation
set noswapfile
set backup
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:deoplete#enable_at_startup = 1
let g:vim_json_syntax_conceal = 0
let g:javascript_plugin_flow = 1
let g:flow#autoclose = 1
let g:flow#enable = 0
let g:elm_format_autosave = 1
let g:instant_markdown_slow = 1
let g:sneak#streak = 1
let g:jsx_ext_required = 0 " allow jsx syntax in normal js files
let g:EclimCompletionEngine = 'omnifunc'
let g:ctrlp_extensions = ['buffertag']
let g:incsearch#auto_nohlsearch = 1
"tmuxline.vim
let g:tmuxline_preset = {
            \'a' : '#S',
            \'win'  : '#W',
            \'cwin'  : '#W',
            \'x' : '#(battery)',
            \'y' : '%l:%M',
            \'z' : '#h',
            \'options': {
            \'status-justify': 'left'}
            \}
let g:tmuxline_powerline_separators = 0
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_Flavor='latex'
let g:Tex_ViewRule_pdf='mupdf'
let g:tsline_ensure_trailing_newlines = 1
let g:pencil#wrapModeDefault = 'hard'
let g:pencil#autoformat = 1
let g:pencil#conceallevel = 0
let g:bufferline_echo = 0
let g:ag_highlight=1
let g:used_javascript_libs = 'underscore, jquery, react'
let g:tmuxcomplete#trigger = 'omnifunc'
let g:ycm_semantic_triggers = {
            \ 'c' : ['->', '.', 're!\w'],
            \ 'elm': ['.', 're!\w'],
            \ 'purescript': ['.', 're!\w'],
            \ 'haskell': ['.', 're!\w'],
            \}
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_use_ultisnips_complete = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:neomake_open_list = 2
let g:neomake_javascript_enabled_makers = ['eslint_d']
let g:neomake_jsx_enabled_makers = ['eslint_d']
let g:neomake_scss_enabled_makers = []
let g:indentLine_char = ">"
let g:indentLine_first_char = ">"
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_color_gui = '#928374'
" let g:indentLine_color_gui = '#504945'
let g:indent_guides_auto_colors = 0
let g:indentLine_faster = 1
let g:indentLine_concealcursor = 0
let g:indentLine_fileTypeExclude = ['json', 'purescript']
let g:indentLine_conceallevel = 1
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-e>"
let g:UltiSnipsJumpBackwardTrigger = "<c-f>"
" au! UltiSnips_AutoTrigger
let g:formatdef_my_custom_js = '"eslint_d --stdin --fix-to-stdout"'
let g:formatters_javascript = ['my_custom_js']

" tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" " deoplete 
" let g:tern_request_timeout = 1
" let g:tern#filetypes = [
"                 \ 'jsx',
"                 \ 'javascript.jsx',
"                 \ 'javascript',
"                 \ ]

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init({'wrap': 'hard'})
  autocmd FileType tex          call pencil#init({'wrap': 'hard'})
augroup END

" spell check commits
au BufNewFile,BufRead COMMIT_EDITMSG set spell

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""Keybinds
"""""""""""""""""""""""""""""""""""""""""""""""""""
let localleader = "\\"

" tab navigation
nnoremap <Leader>[ :tabprevious<cr>
nnoremap <Leader>] :tabnext<cr>
nnoremap <Leader>T :tabnew<cr>

" split navigation
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-o> :vsplit<cr>
nnoremap <C-u> :split<cr>

" buffers
nnoremap <Leader>t  :enew<cr> 
nnoremap <Leader>bq :bd<cr> 

" quitting and saving
imap <C-s> <esc>:w<cr> 
nnoremap <C-s> <esc>:w<cr>
nnoremap <Leader>w :w<cr>
map Q :qa<cr>
nnoremap <Leader>q :q<cr> 

" search
let hlstate=0 
nnoremap <F4> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>
map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" selecting popup items
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" browsing docs, static analysis, etc
nnoremap <Leader>ft :FlowType<cr>
nnoremap <Leader>fm :FlowMake<cr>
nnoremap <Leader>nm :Neomake<cr>
nnoremap <Leader>af :Autoformat<cr>
nnoremap <Leader>yd :YcmCompleter GoToDefinition<cr>
nnoremap <Leader>yrr :YcmCompleter RefactorRename 
nnoremap <Leader>ed :ElmBrowseDocs<cr>

" git
nnoremap <Leader>gb :Gblame<cr>

" ctrl-p
nnoremap <Leader>p :CtrlPBufTag<cr>
nnoremap <Leader>o :CtrlPMRU<cr>
nnoremap <C-b> :CtrlPBuffer<cr>

" number, column, scrolling, whitespace
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<cr> 
nnoremap <Leader>cl :set cursorline!<cr> 
nnoremap <Leader>cc :set cursorcolumn!<cr> 
nnoremap <Leader>ln :set number!<cr>
nnoremap <Leader>rln :set relativenumber!<cr>
nnoremap <Leader>ws :set list!<cr> 

" prose writing
nnoremap <Leader>sp :setlocal spell<cr>
nnoremap <silent> <Leader>tp :TogglePencil<cr>

" literate python
nnoremap <Leader>lp :setlocal ft=python<cr>
nnoremap <Leader>md :setlocal ft=markdown<cr>

" tslime
nmap <C-c>v <Plug>SetTmuxVars
vmap <C-c><C-c> <Plug>SendSelectionToTmux

function! RunCurrentFileAsTest ()
    let fp = fnamemodify(expand("%"), ":~:.")
    if &filetype == 'javascript' || &filetype == 'javascript.jsx'
        exec "Tmux djstest " . fp
    endif

    if &filetype == 'python'
        exec "Tmux drun tox -- -x " . fp
    endif
endfunction

nnoremap <Leader>ttf :call RunCurrentFileAsTest()<cr>
nnoremap <Leader>esl :Tmux fasteslint<cr>
nnoremap <Leader>flw :Tmux flow<cr>
