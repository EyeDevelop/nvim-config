-- Disable netrw at nvim start.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set term gui colours
vim.opt.termguicolors = true

-- Use defaults
require('nvim-tree').setup()
