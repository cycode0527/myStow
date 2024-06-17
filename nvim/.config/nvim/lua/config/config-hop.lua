local hop = require 'hop'
local hint = require 'hop.hint'

vim.keymap.set({'o', 'n',}, 'J', function()
        hop.hint_lines({ direction = hint.HintDirection.AFTER_CURSOR }) end, {remap=true})
vim.keymap.set({'n', 'o'}, 'K', function()
        hop.hint_lines({ direction = hint.HintDirection.BEFORE_CURSOR }) end, {remap=true})

vim.keymap.set({'x', 'n', 'o'}, '<leader>s', function()
    require'hop-zh-by-flypy'.hint_char2({multi_windows = true}) end, {remap=true})

