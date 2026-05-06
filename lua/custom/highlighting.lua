-- Enables smart highlighting on a search

local namespace = vim.api.nvim_create_namespace("auto_no_highlighting")
vim.on_key(function(key)
  if vim.v.hlsearch == 0 then return end
  local keys = { "n", "N", "*", "#" }
  for _, k in ipairs(keys) do
    if key == vim.keycode(k) then return end
  end
  -- any other key clears highlight
  vim.schedule(function()
    if vim.v.hlsearch == 1 then
      vim.cmd("noh")
    end
  end)
end, namespace)
