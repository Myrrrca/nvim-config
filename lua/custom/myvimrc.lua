local M = {}

-- returns $MYVIMRC path
M.get_config_root = function()
    local vimrc = vim.fn.expand("$MYVIMRC")
    local res, _ = vimrc:gsub("/[^/]*$", "")
    return res
end

return M

