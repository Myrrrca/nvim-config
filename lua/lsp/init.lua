require("lsp.mappings")
------------------------------------------------------------------------
-- Enables mason.nvim 
------------------------------------------------------------------------
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})

------------------------------------------------------------------------
-- Enables mason-lspconfig.nvim 
------------------------------------------------------------------------
require("mason-lspconfig").setup({
    -- automatically install and enable lsp servers via mason 
    ensure_installed = {
        "lua_ls",
        "clangd",
    },
})
