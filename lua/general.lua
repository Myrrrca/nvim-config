-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabulation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Clipboard
-- makes nvim use OS clipboard 
vim.opt.clipboard = "unnamedplus"

-- Highlighting
-- disables highlighting for search on <C-H> 
vim.keymap.set("n", "<C-H>", "<cmd>noh<CR>", { silent = true, desc = "no search Highlight" })

-- Insert mode improvments 
vim.keymap.set("i", "jj", "<Esc>", { silent = true })

-- Autocompletion
-- vim.keymap.set("c", "<C-y>", "<C-y><Tab>", { noremap = true })

vim.keymap.set("n", "<leader><leader>x", "<cmd>restart<CR>")
