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
" Plug 'onsails/lspkind'  " https://github.com/onsails/lspkind.nvim
Plug 'nvim-lua/lsp_extensions.nvim'  " https://github.com/nvim-lua/lsp_extensions.nvim

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
Plug 'mbbill/undotree'  " https://github.com/mbbill/undotree
Plug 'tpope/vim-fugitive'  " https://github.com/tpope/vim-fugitive

call plug#end()

" Editor Settings
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
highlight Normal guibg=none

" Leader Key
let mapleader = " "

" ReMap  mode lhs rhs  " nnoremap (normal mode (n) no recursive execution (nore)  map)
lua << EOF
-- Setup nvim-cmp.
local cmp = require("cmp")
local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
}
-- local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
		["<C-u>"] = cmp.mapping.scroll_docs(-4),
		["<C-d>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
	}),

	formatting = {
		format = function(entry, vim_item)
			-- vim_item.kind = lspkind.presets.default[vim_item.kind]
			local menu = source_mapping[entry.source.name]
			if entry.source.name == "cmp_tabnine" then
				if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
					menu = entry.completion_item.data.detail .. " " .. menu
				end
			-- vim_item.kind = ""
			end
			-- vim_item.menu = menu
			-- return vim_item
		end,
	},

	sources = {
		-- tabnine completion? yayaya
		{ name = "cmp_tabnine" },
		{ name = "nvim_lsp" },
		-- For luasnip user.
		{ name = "luasnip" },
		{ name = "buffer" },
	},
})

local tabnine = require("cmp_tabnine.config")
tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
			Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
			Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
			Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
			Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
			Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
			Nnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
			Nnoremap("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
			Nnoremap("<leader>vrn", ":lua vim.lsp.buf.rename()<CR>")
			Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end,
	}, _config or {})
end

lspconfig = require('lspconfig')
lspconfig.pyright.setup {config()}
lspconfig.bashls.setup {config()}
lspconfig.dockerls.setup {config()}
lspconfig.vimls.setup {config()}
-- lua require('lspconfig').sumneko_lua.setup {}

require('Comment').setup()

EOF

" Automatic Commands
augroup MONK3YD
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END


