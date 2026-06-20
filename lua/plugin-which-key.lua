------------------------------------------------------------------------
-- Enables which-key.nvim 
------------------------------------------------------------------------
require("which-key").setup({
    -- modern look
    preset = "modern",
    -- hide langmapped keys
    filter = function(mapping)
    return not (
        mapping.desc
        and mapping.desc:find('LM %(translate ')
    )
    end,
})
