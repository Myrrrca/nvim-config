------------------------------------------------------------------------
-- Enables fzf-lua.nvim 
------------------------------------------------------------------------
local fzf_lua = require("fzf-lua")
fzf_lua.setup({
    -- "hides" fzf-lua on <ESC> instead of closing. better for "resuming"
    { "hide" },
    winopts = {
        fullscreen = true,
        preview = {
            layout = "vertical",
            vertical = "up:70%",
        }
    },
    keymap = {
        fzf = {
            ["tab"] = "down",
            ["shift-tab"] = "up",
            ["ctrl-space"] = "toggle-down",
            -- send entire search to quickfix list
            ["ctrl-q"] = "select-all+accept",
        }
    },
    defaults = {
        -- show greyed - out directory before filename
        formatter = "path.dirname_first",
    },
    grep = {
        -- enables glob support
        rg_glob = true,        
        -- or "--glob"
        glob_flag = "--iglob", 
        -- show hidden files and directories
        hidden = true,
    },
    files = {
        -- TODO: make it a per-project configuration
        -- show hidden files and directories
        hidden = true,
    },
})

vim.keymap.set("n", "gf", fzf_lua.oldfiles, { silent = true, desc = "[G]o to [O]ld file" })
vim.keymap.set("n", "gF", fzf_lua.files, { silent = true, desc = "[G]o to [F]ile" })
-- vim.keymap.set("n", "gw", fzf_lua.live_grep, { silent = true, desc = "[F]ind [W]ord (not fuzzy)" })
vim.keymap.set("n", "gw", fzf_lua.blines, { silent = true, desc = "[G]oto [W]ord in the current buffer" })
vim.keymap.set("n", "gW", fzf_lua.grep_project, { silent = true, desc = "[G]oto [W]ord (fuzzy)" })
vim.keymap.set("n", "gv", fzf_lua.grep_visual, { silent = true, desc = "[G]oto word from [V]isual" })
vim.keymap.set("n", "gc", fzf_lua.grep_cword, { silent = true, desc = "[G]oto word under [C]ursor" })
vim.keymap.set("n", "gC", fzf_lua.grep_cWORD, { silent = true, desc = "[G]oto WORD under [C]ursor" })

vim.keymap.set("n", "qf", fzf_lua.lgrep_quickfix, { silent = true, desc = "[Q]uickfix menu [F]ind" })

vim.keymap.set("n", "<C-P>", fzf_lua.resume, { silent = true, desc = "show Previous search" })

fzf_lua.register_ui_select()
