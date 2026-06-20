local M = {}

-- Making mini.files highlight modified files
----> 
-- Track which files are modified
local modified_files = {}
local register_modified = function(ev) modified_files[ev.match] = vim.bo[ev.buf].modified end
vim.api.nvim_create_autocmd('BufModifiedSet', { callback = register_modified })

-- Highlight file system entry in orange if its file is modified
M.highlight_modified = function(fs_entry)
  if modified_files[fs_entry.path] then return 'MiniFilesBorderModified' end
  return MiniFiles.default_highlight(fs_entry)
end
----< 

return M
