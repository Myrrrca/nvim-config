-- !!!!!
-- This file should be 'required' in init.lua before any .setup() calls from any plugin
-- !!!!!

-- Must be setup before any .setup() is called from any plugin 
vim.g.mapleader = " "
vim.g.maplocalleader = "\r"

-- Plugins below should be enabled first
require('custom.language')
