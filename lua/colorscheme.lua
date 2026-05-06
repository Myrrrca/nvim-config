-- ---------------------------------------------------------------------
-- Enables tokyonight.nvim
-- ---------------------------------------------------------------------
vim.cmd("colorscheme tokyonight")

-- setting ColorColumn highlight group for using it in .md files
vim.api.nvim_set_hl(0, "ColorColumn", { link = "CursorColumn" })
-- setting Folded highlight group just in case
vim.api.nvim_set_hl(0, "Folded", { link = "CursorColumn" })

-- TODO question aitvann
--
-- if vim.fn['hlexists']('HighlightedyankRegion') == 0 then
--     vim.api.nvim_set_hl(0, "HighlightedyankRegion",
--     { link = "CursorColumn" })
-- end
--
-- vim.api.nvim_create_autocmd('TextYankPost', {
--     group = vim.api.nvim_create_augroup('highlight_yank', { clear = true }),
--     desc = 'Hightlight selection on yank',
--     pattern = '*',
--     callback = function()
--         vim.hl.on_yank { higroup = 'HighlightedyankRegion', timeout = 300 }
--     end,
-- })
