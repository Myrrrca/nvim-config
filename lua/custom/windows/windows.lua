local whichkey = require('which-key')
local resize = require('custom.windows.resize')

-- Source: https://youtu.be/7Jtr66Kx0RA?t=4m59s
local win_move = function(key)
    local curwin = vim.api.nvim_win_get_number(0)
    vim.cmd("wincmd " .. key)
    if curwin == vim.api.nvim_win_get_number(0) then
        if key == 'j' or key == 'k' then
            vim.cmd "wincmd s"
        else
            vim.cmd "wincmd v"
        end

        vim.cmd("wincmd " .. key)
    end
end

-- Moving over the windows
whichkey.add({ { "g", group = "Go to" } })
vim.keymap.set("n", "gh", function() win_move("h") end, { silent = true, desc = "Go to the LEFT window" })
vim.keymap.set("n", "gl", function() win_move("l") end, { silent = true, desc = "Go to the RIGHT window" })
vim.keymap.set("n", "gk", function() win_move("k") end, { silent = true, desc = "Go to the ABOVE window" })
vim.keymap.set("n", "gj", function() win_move("j") end, { silent = true, desc = "Go to the BELOW window" })

-- Mirroring current window
whichkey.add({ { "gm", group = "Go Mirror window" } })
vim.keymap.set("n", "gmh", "gh<Del>gh",
    { silent = true, remap = true, desc = "GO to the LEFT window mirroring the current window" })
vim.keymap.set("n", "gml", "gl<Del>gl",
    { silent = true, remap = true, desc = "GO to the RIGHT window mirroring the current window" })
vim.keymap.set("n", "gmk", "gk<Del>gk",
    { silent = true, remap = true, desc = "GO to the ABOVE window mirroring the current window" })
vim.keymap.set("n", "gmj", "gj<Del>gj",
    { silent = true, remap = true, desc = "GO to the BELOW window mirroring the current window" })

-- Moving(pulling) current window
whichkey.add({ { "gp", group = "Go Pull window" } })
vim.keymap.set("n", "gph", "<C-W>h <C-W>x",
    { silent = true, desc = "Go to the LEFT, Pulling the current window with you" })
vim.keymap.set("n", "gpl", "<C-W>l <C-W>x",
    { silent = true, desc = "Go to the RIFHT, Pulling the current window with you" })
vim.keymap.set("n", "gpk", "<C-W>k <C-W>x", { silent = true, desc = "Go UP, Pulling the current window with you" })
vim.keymap.set("n", "gpj", "<C-W>j <C-W>x", { silent = true, desc = "Go DOWN, Pulling the current window with you" })

-- Resizing
vim.keymap.set("n", '<S-Left>', function() resize.ResizeLeft(4) end, { silent = true, desc = 'move window divider LEFT' })
vim.keymap.set("n", '<S-Right>', function() resize.ResizeRight(4) end, { silent = true, desc = 'move window divider RIGHT' })
vim.keymap.set("n", '<S-Up>', function() resize.ResizeUp(4) end, { silent = true, desc = 'move window divider UP' })
vim.keymap.set("n", '<S-Down>', function() resize.ResizeDown(4) end, { silent = true, desc = 'move window divider DOWN' })
