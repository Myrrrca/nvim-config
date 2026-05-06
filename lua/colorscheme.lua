-- ---------------------------------------------------------------------
-- Enables tokyonight.nvim
-- ---------------------------------------------------------------------
vim.cmd("colorscheme tokyonight")

-- setting ColorColumn highlight group for using it in .md files
vim.api.nvim_set_hl(0, "ColorColumn", { link = "CursorColumn" })
-- setting Folded highlight group just in case
vim.api.nvim_set_hl(0, "Folded", { link = "CursorColumn" })
