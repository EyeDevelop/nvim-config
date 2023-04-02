-- Line numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indent settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- No line wrap
vim.opt.wrap = false

-- Undo for greater times
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.local/share/nvim/undodir'
vim.opt.undofile = true

-- No highlighting for search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Colours
vim.opt.termguicolors = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

-- Fast updates
vim.opt.updatetime = 50

-- Colour columns
vim.opt.colorcolumn = '120'
