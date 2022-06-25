-- Gruvbox
vim.g.gruvbox_contrast_dark = "hard"
local colorscheme = "gruvbox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- vim.cmd "highlight Normal guibg=none"
-- airline gruvbox theme

-- Sonokai
-- Available values:   `'default'`, `'atlantis'`, `'andromeda'`, `'shusia'`, `'maia'`, `'espresso'`
-- vim.g.sonokai_style = "default"
-- vim.g.sonokai_better_performance = 1
-- vim.g.sonokai_transparent_background = 0.95
-- local colorscheme = "sonokai"
-- airline sonokai theme
