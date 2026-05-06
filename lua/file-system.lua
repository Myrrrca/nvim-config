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
    },
    content = {
        highlight = mini_files_custom.highlight_modified
    },
})

-- open mini.files on "-"
vim.keymap.set("n", "-", "<CMD>lua MiniFiles.open()<CR>", { desc = "Open parent directory" })
