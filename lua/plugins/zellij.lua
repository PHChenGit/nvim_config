return {
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<C-h>", "<cmd>ZellijNavigateLeft<CR>",  desc = "Navigate left (Neovim/Zellij)" },
      { "<C-j>", "<cmd>ZellijNavigateDown<CR>",  desc = "Navigate down (Neovim/Zellij)" },
      { "<C-k>", "<cmd>ZellijNavigateUp<CR>",    desc = "Navigate up (Neovim/Zellij)" },
      { "<C-l>", "<cmd>ZellijNavigateRight<CR>", desc = "Navigate right (Neovim/Zellij)" },
    },
    opts = {},
  },
}
