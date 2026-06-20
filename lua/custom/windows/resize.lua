-- Functions for smart resize

local M = {}

vim.g.resize_count = vim.g.resize_count or 1

local function is_right_most()
  local oldw = vim.fn.winnr()
  vim.cmd("wincmd l")
  local neww = vim.fn.winnr()
  vim.cmd(oldw .. "wincmd w")
  return oldw == neww
end

local function is_bottom_most()
  local oldw = vim.fn.winnr()
  vim.cmd("wincmd j")
  local neww = vim.fn.winnr()
  vim.cmd(oldw .. "wincmd w")
  return oldw == neww
end

local function is_top_most()
  local oldw = vim.fn.winnr()
  vim.cmd("wincmd k")
  local neww = vim.fn.winnr()
  vim.cmd(oldw .. "wincmd w")
  return oldw == neww
end

local function is_left_most()
  local oldw = vim.fn.winnr()
  vim.cmd("wincmd h")
  local neww = vim.fn.winnr()
  vim.cmd(oldw .. "wincmd w")
  return oldw == neww
end

local function cache_resize_count(n)
  if n and n ~= 0 then
    vim.g.resize_count = n
  end

  return vim.g.resize_count
end

function M.ResizeUp(n)
  local count = cache_resize_count(n)

  if is_bottom_most() then
    if is_top_most() then
      vim.cmd("resize -" .. count)
    else
      vim.cmd("resize +" .. count)
    end
  else
    vim.cmd("resize -" .. count)
  end
end

function M.ResizeDown(n)
  local count = cache_resize_count(n)

  if is_bottom_most() then
    if is_top_most() then
      vim.cmd("resize +" .. count)
    else
      vim.cmd("resize -" .. count)
    end
  else
    vim.cmd("resize +" .. count)
  end
end

function M.ResizeLeft(n)
  local count = cache_resize_count(n)

  if is_right_most() then
    if not is_left_most() then
      vim.cmd("vertical resize +" .. count)
    end
  else
    vim.cmd("vertical resize -" .. count)
  end
end

function M.ResizeRight(n)
  local count = cache_resize_count(n)

  if is_right_most() then
    if not is_left_most() then
      vim.cmd("vertical resize -" .. count)
    end
  else
    vim.cmd("vertical resize +" .. count)
  end
end

return M
