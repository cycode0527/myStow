return {{
    "rainzm/flash-zh.nvim",
    event = "VeryLazy",
    dependencies = "folke/flash.nvim",
    keys = {{
        "s",
        mode = {"n", "x", "o"},
        function()
            require("flash-zh").jump({
                chinese_only = false
            })
        end,
        desc = "Flash between Chinese"
    }}
}, {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
        highlight = {
            backdrop = false,
            matches = false
        }
    },
    keys = {
        { "S", mode = { "n", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    }
}}
