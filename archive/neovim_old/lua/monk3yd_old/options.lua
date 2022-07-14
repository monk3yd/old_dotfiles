-- For looking at options use :help options

-- cursor & line
vim.opt.guicursor=""				            -- cursor block all times
vim.opt.number = true                           -- set numbered lines
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.relativenumber = true			        -- set relative numbered lines
vim.opt.nu = true				                -- except cursor line, set line number

-- general
vim.opt.mouse = "a"				                -- allow the mouse to be used in neovim
vim.opt.clipboard = "unnamedplus"		        -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menuone", "noselect" }	-- mostly just for cmp plugin
vim.opt.conceallevel = 0			            -- so that `` is visible in markdown files
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"			        -- the encoding written to a file
vim.opt.pumheight = 10				            -- pop up menu height
vim.opt.showmode = false			            -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartcase = true			            -- smart case
vim.opt.splitbelow = true			            -- force all horizontal splits to go below current window
vim.opt.splitright = true			            -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true			        -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000			            -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 50				            -- faster completion (4000ms default)
vim.opt.hidden = true                           -- opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
vim.opt.errorbells = false

-- search
vim.opt.hlsearch = false			            -- highlight all matches on previous search pattern
vim.opt.incsearch = true			            -- move the highlight as you add characters to the search
vim.opt.ignorecase = false			            -- ignore case in search patterns

-- tabs
vim.opt.tabstop = 4                             -- insert 2 spaces for a tab
vim.opt.softtabstop = 4                         --
vim.opt.shiftwidth = 4                          -- the number of spaces inserted for each indentation
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.smartindent = true			            -- make indenting smarter again
vim.opt.showtabline = 4				            -- always show tabs

-- cmdline & statusbar
vim.opt.cmdheight = 2				            -- more space in the neovim command line for displaying messages
vim.opt.laststatus = 3  			            -- when the last window will have a status line
vim.opt.showcmd = true				            -- show partial command in the last line of the screen
vim.opt.ruler = false                           -- display ruler (status bar) shows linenum,colnum virtualcolnum cursorrelativepos(%)
vim.opt.numberwidth = 4                         -- set number column width (default 4)
vim.opt.colorcolumn = "80"                      -- set column visual ruler
vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift the text each time

-- editor display
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.sidescrolloff = 8                       --
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications

-- logging history
vim.opt.swapfile = false			            -- creates a swapfile
vim.opt.backup = false				            -- creates a backup file
-- set undodir=~/.vim/undodir  " Install plugin undotree
vim.opt.undofile = true				            -- enable persistent undo
vim.opt.writebackup = false			            -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.fillchars.eob=" "

vim.opt.shortmess:append "c"

vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")                   -- hyphenated words by '-' are treated as one word

