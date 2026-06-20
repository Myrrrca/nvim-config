local fzf_lua = require("fzf-lua")

vim.keymap.set("n", "gd", fzf_lua.lsp_definitions, { silent = true, desc = "Go to Definitions" })
vim.keymap.set("n", "gi", fzf_lua.lsp_implementations, { silent = true, desc = "Go to Implementations" })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { silent = true, desc = "PARTIALLY Rename object under cursor" })
vim.keymap.set("n", "gr", fzf_lua.lsp_references, { silent = true, desc = "Go to References" })
vim.keymap.set("n", "gD", fzf_lua.lsp_typedefs, { silent = true, desc = "Go to type Definitions" })
vim.keymap.set("n", "gS", fzf_lua.lsp_workspace_symbols, { silent = true, desc = "Go to WORKSPACE Symbols" })
vim.keymap.set({ "n", "x" }, "<leader>a", vim.lsp.buf.code_action, { silent = true, desc = "show code Actions" })

-- format specific lines in visual mode in the current buffer
vim.keymap.set("x", "<leader>f", function()
    vim.lsp.buf.format({
        range = {
            start = vim.api.nvim_buf_get_mark(0, "<"),
            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
        },
    })
end, {
    silent = true,
    buffer = 0,
    desc = "Format selection",
})

-- format current buffer in normal mode
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format({
        bufnr = 0,
    })
end, {
    silent = true,
    buffer = 0,
    desc = "Format buffer",
})


vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.hover() end,
    { silent = true, desc = "Inspect node under cursor" }
)

vim.keymap.set("n", "<leader>M", fzf_lua.diagnostics_workspace, {
    silent = true,
    desc = "show PROJECT diagnostics (Messages)",
    buffer = 0,
})

vim.keymap.set("n", "<leader>m", vim.diagnostic.open_float, {
    silent = true,
    desc = "show CURRENT LINE diagnostics (Messages)",
    buffer = 0,
})

vim.keymap.set({ "n", "x", "o" }, "];", function()
    vim.diagnostic.jump({ count = 1, float = true })
end, {
    silent = true,
    desc = "GOTO NEXT diagnostics",
    buffer = 0,
})

vim.keymap.set({ "n", "x", "o" }, "[;", function()
    vim.diagnostic.jump({ count = -1, float = true })
end, {
    silent = true,
    desc = "GOTO PREVIOUS diagnostics",
    buffer = 0,
})

