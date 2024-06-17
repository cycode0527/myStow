return {
    'hadronized/hop.nvim',
    version = "*",
    config = function()
        
        require('hop').setup {
            -- keys = 'etovxqpdygfblzhckisuran'
            extensions = {
                'hop-zh-by-flypy',
            },
        }
    end,

}
