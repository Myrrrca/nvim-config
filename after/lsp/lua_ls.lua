local vfn = vim.fn

-- table for lsp workspace paths
local library = {}
-- takes a path and adds it to 'library'
local function add(lib)
    local expanded = vfn.expand(lib, false, true)
    local paths = type(expanded) == "string" and { expanded } or expanded
    for _, path in pairs(paths) do
        local uv = vim.uv or vim.loop
        local real_path = uv.fs_realpath(path)
        if real_path then
            library[path] = true
        end
    end
end

-- add runtime
-- add plugins it may be very slow to add all in path
add('$VIMRUNTIME')
-- add your nvim config
-- local home = vfn.expand("$HOME")
add(vfn.stdpath('config'))

library[vfn.expand('$VIMRUNTIME/lua')] = true
library[vfn.expand('$VIMRUNTIME')] = true
library[vfn.expand('$VIMRUNTIME/lua/vim')] = true
library[vfn.expand('$VIMRUNTIME/lua/vim/lsp')] = true

return {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- resolve require() calls using templates below where '?' is content of require()
                -- for example require("lsp.module") will search for "lua/lsp/module.lua" and "lua/lsp/module/init.lua"
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global and other ones
                -- By doing so prevents warnings on that keywords
                globals = { 'vim', 'describe', 'it', 'before_each', 'after_each', 'teardown', 'pending' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = library,
                checkThirdParty = false,
                -- max number of files the server will preload
                -- do the best number for your memory
                maxPreload = 1000,
                -- max file size in kb that can be preloaded
                preloadFileSize = 40000,
            },
            telemetry = {
                enable = false
            },
        },
    },
    -- on_new_config = function(cfg, root)
    --     local libs = vim.schedule(function()
    --         vim.tbl_deep_extend('force', {}, library)
    --     end)
    --     libs[root] = nil
    --     cfg.settings.Lua.workspace.library = libs
    --     return cfg
    -- end,
}
