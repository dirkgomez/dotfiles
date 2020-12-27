language en_US

let g:loaded_python_provider = 0
let g:python3_host_prog = '/Users/dirk/.pyenv/shims/python'

call plug#begin('~/.local/share/nvim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

call plug#end()

set matchpairs=(:),{:},[:],<:>

" Always edit in utf-8:
set encoding=utf-8

" Number of lines to keep above/below cursor
set scrolloff=2

" Indentation without hard tabs
set expandtab
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2

" Show line, column number
set ruler
set laststatus=2

" Show syntax highlighting
syntax on
filetype plugin indent on

" Don't wrap text after a one-letter word
set formatoptions=1

" Folding
set foldenable                      " enable folding
set foldmethod=syntax               " global folding method
set foldlevelstart=99               " folds with level 1 aren't closed

" Color scheme settings
set background=dark


lua <<EOF
require'lspconfig'.pyls.setup{ cmd = { "pyls" } }
require'lspconfig'.tsserver.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.bashls.setup{}
EOF

let g:deoplete#enable_at_startup = 1
set completeopt-=preview

" " completion-nvim
" autocmd BufEnter * lua require'completion'.on_attach()
" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" 
" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
" 
" " Avoid showing message extra message when using completion
" set shortmess+=c
