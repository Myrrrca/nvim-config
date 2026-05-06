------------------------------------------------------------------------
-- Enables mini.statusline
------------------------------------------------------------------------
require('mini.statusline').setup({})

-- hides -- INSERT -- or similar modes in cmd 
vim.cmd("set noshowmode")

-- uses one statusline for all windows
vim.o.laststatus = 3
