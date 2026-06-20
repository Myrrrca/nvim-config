local mini_files_custom = require('custom.mini-files')

------------------------------------------------------------------------
-- Enables mini.files
------------------------------------------------------------------------
require('mini.files').setup({
    -- Customization of explorer windows
    windows = {
        -- Maximum number of windows to show side by side
        max_number = 2,
        -- Whether to show preview of file/directory under cursor
        preview = true,
        -- Width of focused window
        width_focus = 55,
        -- Width of preview window
        -- 133 because this is exactly how much space preview + first window takes on my screen
        width_preview = 133,
    },
    mappings = {
        go_in = 'L',      -- "go in" without closing
        go_in_plus = 'l', -- "go in" + close
        -- reset = ',',
        -- reveal_cwd = '.',
    },
    options = {
        -- If set to false, files are moved to the trash directory
        -- To get this dir run :echo stdpath('data')
        permanent_delete = false,
    },
    content = {
        highlight = mini_files_custom.highlight_modified
    },
})

-- open mini.files on "<leader>e"
vim.keymap.set("n", "<leader>e", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open file [E]xplorer in parent directory" })

-- show preview of the files always from the top of the file
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    vim.cmd('normal! g`"')
  end,
})

-- vim.keymap.set("n", "<leader>e", function()
--   local buf_name = vim.api.nvim_buf_get_name(0)
--   local dir_name = vim.fn.fnamemodify(buf_name, ":p:h")
--
--   if vim.fn.filereadable(buf_name) == 1 then
--     require("mini.files").open(buf_name, true)
--   elseif vim.fn.isdirectory(dir_name) == 1 then
--     require("mini.files").open(dir_name, true)
--   else
--     require("mini.files").open(vim.uv.cwd(), true)
--   end
-- end, { desc = "Open mini.files at current file" })
--
-- vim.keymap.set("n", "<leader>E", function()
--   require("mini.files").open(vim.uv.cwd(), true)
-- end, { desc = "Open mini.files cwd" })
