let mapleader = "\<Space>" "set leader to space

""""""""""""""""""""""""""""""""""""""""""""""""""
"""plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin(stdpath('data') . '/plugged')

" JS / TypeScript
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'briancollins/vim-jst'
Plug 'styled-components/vim-styled-components'
Plug 'pantharshit00/vim-prisma'
Plug 'pmizio/typescript-tools.nvim'

" other web stuff
Plug 'othree/html5-syntax.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json'

" firefox integration
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" reasonML
Plug 'reasonml-editor/vim-reason-plus'

" fsharp
Plug 'fsharp/vim-fsharp'

" ruby
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'slim-template/vim-slim'

" crystal
Plug 'rhysd/vim-crystal'

" python
Plug 'Vimjas/vim-python-pep8-indent'

" fish shell
Plug 'Stautob/vim-fish'

" colorschemes
" Plug 'cormacrelf/dark-notify'
Plug 'rebelot/kanagawa.nvim'

" statusline
Plug 'itchyny/lightline.vim'

" tmux
Plug 'edkolev/tmuxline.vim'
Plug 'jgdavey/tslime.vim'
Plug 'wellle/tmux-complete.vim'
Plug 'christoomey/vim-tmux-navigator'

" git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ruifm/gitlinker.nvim'

" utility
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-unimpaired'
Plug 'terryma/vim-multiple-cursors'
" Plug 'Yggdroot/indentLine'
Plug 'jamessan/vim-gnupg'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'machakann/vim-highlightedyank'
Plug 'lilydjwg/colorizer'
Plug 'vim-scripts/SyntaxRange'
Plug 'vim-scripts/ingo-library'
Plug 'tommcdo/vim-lion'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'vim-test/vim-test'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'github/copilot.vim'
Plug 'williamboman/mason.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'folke/trouble.nvim'
Plug 'lewis6991/hover.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" file opening / search
Plug 'rking/ag.vim' "wrapper for ag
Plug 'justinmk/vim-sneak'
Plug 'blarghmatey/split-expander'
Plug 'nvim-neo-tree/neo-tree.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" elm
Plug 'elmcast/elm-vim'

" go
Plug 'fatih/vim-go'

" rust
Plug 'rust-lang/rust.vim' "some rust stuff
Plug 'cespare/vim-toml'

" i3
Plug 'PotatoesMaster/i3-vim-syntax'

" neovim-specific
Plug 'neovim/node-host'

" just
Plug 'NoahTheDuke/vim-just'

Plug 'wfxr/minimap.vim'

" typst
Plug 'kaarmu/typst.vim'

call plug#end()

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
    " html
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
    " scss
    autocmd FileType scss setlocal expandtab
    autocmd FileType scss setlocal autoindent
    autocmd FileType scss setlocal shiftwidth=2
    autocmd FileType scss setlocal softtabstop=2
    autocmd FileType scss setlocal omnifunc=csscomplete#CompleteCSS
    " typescript
    autocmd FileType typescript setlocal expandtab
    autocmd FileType typescript setlocal autoindent
    autocmd FileType typescript setlocal shiftwidth=2
    autocmd FileType typescript setlocal softtabstop=2
    autocmd FileType typescript.tsx setlocal expandtab
    autocmd FileType typescript.tsx setlocal autoindent
    autocmd FileType typescript.tsx setlocal shiftwidth=2
    autocmd FileType typescript.tsx setlocal softtabstop=2
    autocmd FileType typescriptreact setlocal expandtab
    autocmd FileType typescriptreact setlocal autoindent
    autocmd FileType typescriptreact setlocal shiftwidth=2
    autocmd FileType typescriptreact setlocal softtabstop=2
    autocmd FileType typescript UltiSnipsAddFiletypes javascript-mocha
    autocmd FileType typescriptreact UltiSnipsAddFiletypes javascript-mocha
    " js
    autocmd FileType javascript setlocal expandtab
    autocmd FileType javascript setlocal autoindent
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript setlocal softtabstop=2
    autocmd FileType javascript UltiSnipsAddFiletypes javascript-es6 
    autocmd FileType javascript UltiSnipsAddFiletypes javascript-mocha
    " org
    autocmd FileType org setlocal foldenable
    autocmd FileType org setlocal nolist
    " go
    autocmd FileType go setlocal tabstop=2
    autocmd FileType go setlocal shiftwidth=2
    " purescript
    autocmd FileType purescript setlocal shiftwidth=2
augroup END

"colorscheme
set termguicolors
set background=light

lua << EOF
-- Default options:
require('kanagawa').setup({
    compile = true,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = false },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
})

-- setup must be called before loading
vim.cmd("colorscheme kanagawa")
EOF


"recommended by yats.vim
" set re=0

"lightline
let g:lightline = {
    \ 'colorscheme': 'solarized',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ]
    \           ]
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
    \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
    \ },
    \ }

function! LightLineFugitive()
  if exists("*FugitiveHead")
    let branch = FugitiveHead()
    return branch !=# '' ? branch : ''
  endif
  return ''
endfunction

"random options
set clipboard+=unnamed
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
" set hlsearch "highlight searches
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
" set lcs=trail:.,tab:>\ 
" set list

"" fix the swapfile situation
set noswapfile
set backup
set backupdir=~/.config/nvim/backup//
set undodir=~/.config/nvim/undo//
set undofile

"" a few htings that are nice with JSX
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
au BufEnter github.com_*.txt set filetype=markdown

"""""""""""""""""""""""""""""""""""""""""""""""""""
"""Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_json_syntax_conceal = 0
let g:vim_jsx_pretty_colorful_config = 1
let g:elm_format_autosave = 1
let g:instant_markdown_slow = 1
let g:sneak#streak = 1
let g:jsx_ext_required = 0 " allow jsx syntax in normal js files
let g:EclimCompletionEngine = 'omnifunc'
"tmuxline.vim
let g:tmuxline_preset = {
            \'a' : '#S',
            \'win'  : '#W',
            \'cwin'  : '#W',
            \'x' : '#{battery_icon} #{battery_percentage}',
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
let g:bufferline_echo = 0
let g:ag_highlight=1
let g:used_javascript_libs = 'underscore, jquery, react'
let g:tmuxcomplete#trigger = 'omnifunc'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" let g:go_fmt_command = "goimports"
" let g:indentLine_char = ">"
" let g:indentLine_first_char = ">"
let g:indentLine_showFirstIndentLevel = 1
" let g:indentLine_color_gui = '#928374'
" let g:indentLine_color_gui = '#504945'
let g:indent_guides_auto_colors = 0
let g:indentLine_faster = 1
let g:indentLine_concealcursor = 0
let g:indentLine_fileTypeExclude = ['json', 'purescript', 'haskell']
let g:indentLine_conceallevel = 1
let g:UltiSnipsExpandTrigger = "<c-e>"
let g:UltiSnipsJumpForwardTrigger = "<c-e>"
let g:UltiSnipsJumpBackwardTrigger = "<c-f>"
" au! UltiSnips_AutoTrigger
let g:formatdef_my_custom_js = '"prettier-eslint --stdin --no-semi --parser babel"'
let g:formatters_javascript = ['my_custom_js']
set guifont=Monaco:h20
let g:firenvim_config = { 
      \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'content': 'text',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
\ }

" tslime
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1

" vim-tmux-navigator
let g:tmux_navigator_no_mappings = 1

noremap <silent> <M-h> :<C-U>TmuxNavigateLeft<cr>
noremap <silent> <M-j> :<C-U>TmuxNavigateDown<cr>
noremap <silent> <M-k> :<C-U>TmuxNavigateUp<cr>
noremap <silent> <M-l> :<C-U>TmuxNavigateRight<cr>
noremap <silent> <M-/> :<C-U>TmuxNavigatePrevious<cr>

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
imap <C-q> <esc>:q<cr> 
nnoremap <C-q> <esc>:q<cr>

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" git
nnoremap <Leader>gb :Git blame<cr>

lua << EOF
require('telescope').load_extension('fzy_native')
EOF

" Telescope
nnoremap <C-b> <cmd>Telescope buffers<cr>
nnoremap <C-p> <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>

lua << EOF
require"gitlinker".setup()
EOF

" number, column, scrolling, whitespace
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<cr> 
nnoremap <Leader>cl :set cursorline!<cr> 
nnoremap <Leader>cc :set cursorcolumn!<cr> 
nnoremap <Leader>ln :set number!<cr>
nnoremap <Leader>rln :set relativenumber!<cr>
nnoremap <Leader>ws :set list!<cr> 

" prose writing
nnoremap <Leader>sp :setlocal spell<cr>

" literate python
nnoremap <Leader>lp :setlocal ft=python<cr>
nnoremap <Leader>md :setlocal ft=markdown<cr>

" tslime
nmap <C-c>v <Plug>SetTmuxVars
vmap <C-c><C-c> <Plug>SendSelectionToTmux

nnoremap <Leader>tf :TestFile<cr>
let test#strategy = "neovim"

" Mason / LSP configuration
lua <<EOF
require('mason').setup()
require("mason-lspconfig").setup()
require("lspconfig").rust_analyzer.setup {}
require'lspconfig'.typst_lsp.setup{
	settings = {
		exportPdf = "onType" -- Choose onType, onSave or never.
        -- serverPath = "" -- Normally, there is no need to uncomment it.
	}
}
require("typescript-tools").setup({
  on_attach = function(client)
    client.server_capabilities.semanticTokensProvider = nil
  end
})

vim.keymap.set('n', '[g', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']g', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition)
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition)
vim.keymap.set('n', '<leader>gt', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
vim.keymap.set('n', '<leader>do', vim.lsp.buf.code_action)
EOF

" trouble keybinds
nnoremap <leader>gr <cmd>Trouble lsp_references<cr>
nnoremap <leader>gg <cmd>Trouble document_diagnostics<cr>
" nmap <silent> <leader>cs :call  CocAction('showIncomingCalls')<cr>

" nvim-cmp setup
lua <<EOF
local cmp = require('cmp')
cmp.setup({
snippet = {
  expand = function(args)
    vim.fn["UltiSnips#Anon"](args.body)
  end,
},
window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  -- scroll docs up
  ['<C-d>'] = cmp.mapping.scroll_docs(-4),
  -- scroll docs down
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  -- tab to select and insert next item in the list
  ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  -- shift-tab to go backwards
  ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'ultisnips' },
  { name = 'nvim_lsp_signature_help' },
}, {
  { name = 'buffer' },
})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
EOF

" hover.nvim setup
" this is for showing a popup with LSP supplied info about a the symbol under
" the keyword
lua <<EOF
require('hover').setup {
   init = function()
        require('hover.providers.lsp')
        require('hover.providers.gh')
    end,
    preview_opts = {
        border = 'single'
    },
    -- Whether the contents of a currently open hover window should be moved
    -- to a :h preview-window when pressing the hover keymap.
    preview_window = false,
    title = true,
    mouse_providers = {
        'LSP'
    },
    mouse_delay = 1000
}

-- Setup keymaps
vim.keymap.set("n", "<leader>i", require("hover").hover, {desc = "hover.nvim"})
EOF

" lua <<EOF
" require('dark_notify').run()
" EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "rust", "typescript", "tsx", "javascript", "python", "bash", "vim", "lua", "ocaml" },

  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua <<EOF
require("neo-tree").setup({
    source_selector = {
        winbar = true,
    },
    filesystem = {
        bind_to_cwd = false,
        -- cwd_target = {sidebar = "window"},
        follow_current_file =  {
            enabled = true,
        },
        hijack_netrw_behavior = "open_current",
    }
})
EOF

nnoremap <Leader>dr :Neotree source=filesystem focus left<cr>
nnoremap <Leader>gs :Neotree float git_status<cr>

" gh copilot
" disable github copilot by default
let g:copilot_enabled = 0
" toggle github copilot on and off
nnoremap <Leader>cp :let g:copilot_enabled = 1 - g:copilot_enabled<cr>

" it's np for 'narrow print'
" silently call prettier on the current buffer, printing it at 80 characters
" wide, then reload the buffer
nnoremap <Leader>np :silent !npx prettier --print-width 80 --write %<cr>:e!<cr>
