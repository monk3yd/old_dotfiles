local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"  -- Have packer manage itself
  use "nvim-lua/plenary.nvim"   -- Useful lua functions used ny lots of plugins
  use "nvim-lualine/lualine.nvim"  -- Status line
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"  -- Vertical line explicit indentation
  use "RRethy/vim-illuminate"  -- Highlight all repetitions of word below cursor
  use "goolord/alpha-nvim"
  -- use "folke/which-key.nvim"

  -- UI
  -- use "stevearc/dressing.nvim"

  -- Colorschemes
  use "gruvbox-community/gruvbox"
  -- use "folke/tokyonight.nvim"

  -- cmp plugins
  use { "hrsh7th/nvim-cmp" } -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-emoji"
  use "hrsh7th/cmp-nvim-lua"
  use {
    "tzachar/cmp-tabnine",
    run = "./install.sh",
    requires = "hrsh7th/nvim-cmp",
  }

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  -- use "tom-anders/telescope-vim-bookmarks.nvim"
  -- use "nvim-telescope/telescope-media-files.nvim"
  -- use "lalitmee/browse.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }  -- syntax highlight
  use "p00f/nvim-ts-rainbow"  -- nest parenthesis change colors
  use "JoosepAlviste/nvim-ts-context-commentstring"  -- comments taking into account context
  -- use "nvim-treesitter/playground"
  -- use "windwp/nvim-ts-autotag"
  -- use "drybalka/tree-climber.nvim"

  -- Autopairs
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

  -- Comments
  use "numToStr/Comment.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"

  -- NvimTree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- Toggleterm
  use "akinsho/toggleterm.nvim"  -- Change for tmux?

  -- DAP (Debugger)
  use "mfussenegger/nvim-dap"
  -- use "theHamsta/nvim-dap-virtual-text"
  use "rcarriga/nvim-dap-ui"
  use "ravenxrz/DAPInstall.nvim"

  -- Programming Languages
  -- Rust
  -- use "simrat39/rust-tools.nvim"
  -- use "Saecki/crates.nvim"

  -- Java
  -- use "mfussenegger/nvim-jdtls"

  -- Typescript TODO: set this up, also add keybinds to ftplugin
  -- use "jose-elias-alvarez/typescript.nvim"

  -- Plugin Graveyard
  -- use "romgrk/nvim-treesitter-context"
  -- use "mizlan/iswap.nvim"
  -- use {'christianchiarulli/nvim-ts-rainbow'}
  -- use "nvim-telescope/telescope-ui-select.nvim"
  -- use "nvim-telescope/telescope-file-browser.nvim"
  -- use 'David-Kunz/cmp-npm' -- doesn't seem to work
  -- use { "christianchiarulli/JABS.nvim" }
  -- use "lunarvim/vim-solidity"
  -- use "tpope/vim-repeat"
  -- use "Shatur/neovim-session-manager"
  -- use "metakirby5/codi.vim"
  -- use { "nyngwang/NeoZoom.lua", branch = "neo-zoom-original" }
  -- use "rcarriga/cmp-dap"
  -- use "filipdutescu/renamer.nvim"
  -- use "https://github.com/rhysd/conflict-marker.vim"
  -- use "rebelot/kanagawa.nvim"
  -- use "unblevable/quick-scope"
  -- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  -- use "gbprod/cutlass.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
