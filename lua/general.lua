require('custom.windows.windows')

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- makes single line of numbers
vim.o.numberwidth = 2

-- Tabulation
-- use spaces instead of tab
vim.opt.expandtab = true
-- <TAB> = 4 spaces
vim.opt.tabstop = 4
-- <BACKSPACE> = delete 4 spaces
vim.opt.softtabstop = 4
-- indent operations such as '>>' move text for 4 spaces
vim.opt.shiftwidth = 4

-- Clipboard
-- makes nvim use OS clipboard 
vim.opt.clipboard = "unnamedplus"

-- Insert mode improvments 
vim.keymap.set("i", "jj", "<Esc>", { silent = true })

-- Autocompletion
-- life of quality options for autocompletion
vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert'
-- trigger autocompletion in insert mode
vim.keymap.set('i', '<C-j>', '<C-n>', { noremap = true })

-- Restarting nvim
vim.keymap.set("n", "<leader><leader>x", "<cmd>restart<CR>")
-- asks to confirm to save any changes before ':restart'  
vim.opt.confirm = true

-- Highlighting
-- highlight selection on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- disables highlighting for search on <C-H> 
vim.keymap.set("n", "<C-H>", "<cmd>noh<CR>", { silent = true, desc = "no search Highlight" })

-- Search
-- enables fuzzy matching of arguments for :h
vim.opt.wildoptions:append { 'fuzzy' }
-- enables incremental search
vim.o.incsearch = true
-- vim.opt.ignorecase = true
-- overrides 'ignorecase' above making any non lower case search query case sensetive 
-- vim.opt.smartcase = true

-- Swapfiles
vim.opt.swapfile = false

-- Color
-- enables 24 bit color support.
vim.opt.termguicolors = true

-- Cursor
-- using highlighting for cursor
----->
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
-----<

-- Scrolling
vim.opt.smoothscroll = true
-- keeps 8 lines visible above and below cursor while scrolling
vim.o.scrolloff = 8

-- Buffers
-- allows switching buffers without saving a file
vim.o.hidden = true
-- disables line wrapping
vim.cmd("set nowrap")

-- Encoding
-- default encoding
vim.o.encoding = "utf-8"

-- TODO came up with a section name
-- enables letters for <C-a> and <C-x> in normal mode
vim.opt.nrformats:append { 'alpha' }
-- waits 1 sec for pressing next mapped key
vim.o.timeoutlen = 1000
