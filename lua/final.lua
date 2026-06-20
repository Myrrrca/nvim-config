-- !!!!!
-- This file should be 'required' last in init.lua and NO code should go after it 
-- !!!!!

-- must be the very last line of config
-- Remap vim keybindings
require('langmapper').automapping({ buffer = false })
