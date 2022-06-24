" Help
" :h [option_name]
" :h [option_name] + tab (completion)
" :options

" Plugin Manager - https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" LSP plugin (Language Server Protocol)
Plug 'neovim/nvim-lspconfig'  " https://github.com/neovim/nvim-lspconfig

" cmp plugins
Plug 'hrsh7th/cmp-nvim-lsp'  " The completion plugin - https://github.com/hrsh7th/cmp-nvim-lsp
Plug 'hrsh7th/cmp-buffer'    " buffer completions - https://github.com/hrsh7th/cmp-buffer
Plug 'hrsh7th/cmp-path'      " path completions - https://github.com/hrsh7th/cmp-path
Plug 'hrsh7th/cmp-cmdline'   " cmdline completions - https://github.com/hrsh7th/cmp-cmdline
Plug 'hrsh7th/nvim-cmp'      " https://github.com/hrsh7th/nvim-cmp

Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }  " https://github.com/tzachar/cmp-tabnine
Plug 'onsails/lspkind.nvim'                           " https://github.com/onsails/lspkind.nvim
Plug 'nvim-lua/lsp_extensions.nvim'                   " https://github.com/nvim-lua/lsp_extensions.nvim

" TODO
Plug 'glepnir/lspsaga.nvim'           " https://github.com/glepnir/lspsaga.nvim
Plug 'simrat39/symbols-outline.nvim'  " https://github.com/simrat39/symbols-outline.nvim

" TODO - telescope plugin (fuzzyfinder)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'  " https://github.com/nvim-telescope/telescope.nvim

" comments plugin
Plug 'numToStr/Comment.nvim'          " https://github.com/numToStr/Comment.nvim

" TODO - tree
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " https://github.com/nvim-treesitter/nvim-treesitter

" TODO - snippets
Plug 'L3MON4D3/LuaSnip'              " snippet engine - https://github.com/L3MON4D3/LuaSnip
Plug 'rafamadriz/friendly-snippets'  " a bunch of snippets to use - https://github.com/rafamadriz/friendly-snippets

" gruvbox
Plug 'gruvbox-community/gruvbox'     " https://github.com/gruvbox-community/gruvbox
"
" TODO
" Plug 'mbbill/undotree'     " https://github.com/mbbill/undotree
" Plug 'tpope/vim-fugitive'  " https://github.com/tpope/vim-fugitive

" TODO - prettier
Plug 'sbdchd/neoformat'  " https://github.com/sbdchd/neoformat

call plug#end()

" Editor Settings
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight Normal guibg=none

" Formatter Settings
let g:neoformat_enabled_python = ['black']
let g:neoformat_enabled_json = ['prettier']

" Leader Key
let mapleader = " "
" ReMap  mode lhs rhs  " nnoremap (normal mode (n) no recursive execution (nore)  map)

" Automatic Commands
augroup MONK3YD
    autocmd!
    autocmd BufWritePre '*.py','*.json' undojoin | Neoformat
    autocmd BufWritePre * %s/\s\+$//e
augroup END

" augroup fmt
"     autocmd!
" augroup END


