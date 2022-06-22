" Help
" :h [option_name]
" :h [option_name] + tab (completion)
" :options

" Plugin Manager https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" TODO - LSP Plugin (Language Server Protocol)
Plug 'neovim/nvim-lspconfig'  " https://github.com/neovim/nvim-lspconfig
Plug 'hrsh7th/cmp-nvim-lsp'  " https://github.com/hrsh7th/cmp-nvim-lsp
Plug 'hrsh7th/cmp-buffer'  " https://github.com/hrsh7th/cmp-buffer
Plug 'hrsh7th/cmp-path'  " https://github.com/hrsh7th/cmp-path
Plug 'hrsh7th/cmp-cmdline'  " https://github.com/hrsh7th/cmp-cmdline
Plug 'hrsh7th/nvim-cmp'  " https://github.com/hrsh7th/nvim-cmp
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }  " https://github.com/tzachar/cmp-tabnine
Plug 'onsails/lspkind.nvim'  " https://github.com/onsails/lspkind.nvim
Plug 'nvim-lua/lsp_extensions.nvim'  " https://github.com/nvim-lua/lsp_extensions.nvim

Plug 'glepnir/lspsaga.nvim'  " https://github.com/glepnir/lspsaga.nvim
Plug 'simrat39/symbols-outline.nvim'  " https://github.com/simrat39/symbols-outline.nvim

" TODO - Telescope Plugin (fuzzyfinder)
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'  " https://github.com/nvim-telescope/telescope.nvim

" Comments Plugin
Plug 'numToStr/Comment.nvim'  " https://github.com/numToStr/Comment.nvim

" TODO - Tree
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " https://github.com/nvim-treesitter/nvim-treesitter

" TODO - Snippets
Plug 'L3MON4D3/LuaSnip'  " https://github.com/L3MON4D3/LuaSnip
Plug 'rafamadriz/friendly-snippets'  " https://github.com/rafamadriz/friendly-snippets

" Gruvbox
Plug 'gruvbox-community/gruvbox'  " https://github.com/gruvbox-community/gruvbox
"
" TODO
" Plug 'mbbill/undotree'  " https://github.com/mbbill/undotree
" Plug 'tpope/vim-fugitive'  " https://github.com/tpope/vim-fugitive

call plug#end()

" Editor Settings
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight Normal guibg=none

" Leader Key
let mapleader = " "
" ReMap  mode lhs rhs  " nnoremap (normal mode (n) no recursive execution (nore)  map)

" Automatic Commands
augroup MONK3YD
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END


