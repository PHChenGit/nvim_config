return {
    {
        "rhysd/accelerated-jk",
        config = function()
            vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
            vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
        end,
    },
    {
        "folke/persistence.nvim",
        config = function()
            require("persistence").setup()
            vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
            vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]])
            vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
        end
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        }
    },
    {
        'nvim-mini/mini.nvim',
        version = false,
        config = true,
    },
    {
        "s1n7ax/nvim-window-picker",
        config = function()
            require("window-picker").setup({
                filter_rules = {
                    include_current_win = true,
                    bo = {
                        filetype = { "fidget", "neo-tree" }
                    }
                }
            })
            vim.keymap.set("n",
                "<C-w>p",
                function()
                    local window_number = require('window-picker').pick_window()
                    if window_number then vim.api.nvim_set_current_win(window_number) end
                end
            )
        end
    }
}
