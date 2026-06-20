-- exit from terminal mode to normal with <S-Esc>
vim.keymap.set("t", "<S-Esc>", [[<C-\><C-n>]])


-- open small terminal
vim.keymap.set("n", "<space>st", function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    vim.cmd.startinsert()
end, {
    desc = "open [S]mall [T]erminal",
})

-- open big terminal
vim.keymap.set("n", "<space>bt", function()
    local width = math.floor(vim.o.columns * 0.97)
    local height = math.floor(vim.o.lines * 0.95)

    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
        style = "minimal",
    })

    vim.cmd.startinsert()
    vim.cmd.term()
end, {
    desc = "open [B]ig [T]erminal",
})

vim.keymap.set("n", "<leader>lg", function()
    local width = math.floor(vim.o.columns * 0.97)
    local height = math.floor(vim.o.lines * 0.95)

    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    local buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        border = "rounded",
        style = "minimal",
    })

    vim.fn.termopen("lazygit", {
        cwd = vim.fn.getcwd(),
    })

    vim.cmd.startinsert()
end, {
    desc = "Open LazyGit",
})
