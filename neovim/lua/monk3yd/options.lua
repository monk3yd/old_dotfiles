-- :help options

-- Options Table
local options = {
  -- general
  mouse = "a",                             -- allow the mouse to be used in neovim
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  encoding = "utf-8",
  fileencoding = "utf-8",                  -- the encoding written to a file
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  smartcase = true,                        -- smart case
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 50,                         -- faster completion (4000ms default)
  hidden = true,                           -- opening a new file when the current buffer has unsaved changes causes files to be hidden instead of closed
  errorbells = false,

  -- cursor & line
  guicursor = "",				           -- cursor block all times
  number = true,                           -- set numbered lines
  cursorline = true,                       -- highlight the current line
  -- cursorcolumn,                    -- higlight the current column
  relativenumber = true,                   -- set relative numbered lines
  nu = true,				               -- except cursor line, set line number

  -- search
  hlsearch = false,                        -- highlight all matches on previous search pattern
  incsearch = true,			               -- move the highlight as you add characters to the search
  ignorecase = false,                      -- ignore case in search patterns

  -- tabs
  tabstop = 4,                             -- insert 2 spaces for a tab
  softtabstop = 4,                         --
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  expandtab = true,                        -- convert tabs to spaces
  smartindent = true,                      -- make indenting smarter again
  showtabline = 0,                         -- always show tabs

  -- cmdline & statusbar
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  laststatus = 3,  			               -- when the last window will have a status line
  showcmd = true,				           -- show partial command in the last line of the screen
  ruler = false,                           -- display ruler (status bar) shows linenum,colnum virtualcolnum cursorrelativepos(%)
  numberwidth = 4,                         -- set number column width {default 4}
  colorcolumn = "80",                      -- set column visual ruler
  -- colorcolumn = "120",
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time

  -- editor display
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications

  -- logging history
  swapfile = false,                        -- creates a swapfile
  backup = false,                          -- creates a backup file
  -- set undodir=~/.vim/undodir            -- Install plugin undotree
  undofile = true,                         -- enable persistent undo
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

}

-- Loop
for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]                -- hyphenated words by '-' are treated as one word
vim.cmd [[set formatoptions-=cro]]          -- TODO: this doesn't seem to work

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.fillchars.eob = " "
-- vim.opt.fillchars = vim.opt.fillchars + "vertleft: "
-- vim.opt.fillchars = vim.opt.fillchars + "vertright: "
vim.opt.fillchars = vim.opt.fillchars + 'eob: '

vim.opt.shortmess:append "c"

vim.filetype.add {
  extension = {
    conf = "dosini",
  },
}
