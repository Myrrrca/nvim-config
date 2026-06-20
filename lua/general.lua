require('custom.windows.windows')
require('custom.highlighting')

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- enables single line of numbers
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
-- enables multiple >> actions in visual mode 
vim.keymap.set("x", ">", ">gv", { silent = true })
vim.keymap.set("x", "<", "<gv", { silent = true })

-- Clipboard
-- makes nvim use OS clipboard
vim.opt.clipboard = "unnamedplus"

-- Insert mode improvments
vim.keymap.set("i", "jj", "<Esc>", { silent = true })

-- Autocompletion
-- life of quality options for autocompletion
-- vim.opt.completeopt = 'menu,menuone,fuzzy,noinsert'
-- trigger autocompletion in insert mode
-- vim.keymap.set('i', '<C-j>', '<C-n>', { noremap = true })

-- Restarting nvim
vim.keymap.set("n", "<leader><leader>r", "<cmd>restart<CR>")
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
-- vim.keymap.set("n", "<C-H>", "<cmd>noh<CR>", { silent = true, desc = "no search Highlight" })

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
-- go to the next opened buffer
vim.keymap.set("n", "<leader>l", ":bnext<CR>",     { desc = "Next buffer" })
-- go to the previous buffer
vim.keymap.set("n", "<leader>h", ":bprevious<CR>", { desc = "Previous buffer" })

-- Encoding
-- default encoding
vim.o.encoding = "utf-8"

-- Macros
-- 'Q' now acts like 'q'
vim.keymap.set("n", "Q", "q")
-- 'q' does nothing
vim.keymap.set("n", "q", "<Nop>")

-- Quickfix menu
-- tab quickfix menu with [<space> ]<space>
vim.keymap.set({ "n", "x", "o" }, "]<space>", ":cnext" .. vim.v.count1 .. "<CR>",
    { silent = true, desc = "GOTO NEXT quickfix item" })
vim.keymap.set({ "n", "x", "o" }, "[<space>", ":cprev" .. vim.v.count1 .. "<CR>",
    { silent = true, desc = "GOTO PREVIOUS quickfix item" })

-- TODO: came up with a section name
-- enables letters for <C-a> and <C-x> in normal mode
vim.opt.nrformats:append { 'alpha' }
-- waits 2 sec for pressing next mapped key
vim.o.timeoutlen = 2000
