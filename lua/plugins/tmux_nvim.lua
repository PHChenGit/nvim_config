return {
    {
        "aserowy/tmux.nvim",
        config = function ()
            -- By default tmux.nvim use tmuxclipboard, instead of xclip
            require("tmux").setup({
                copy_sync = {
                    enable = false
                },
            })
        end
    },
}
