return {
  -- Code outline sidebar
  {
    "stevearc/aerial.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle aerial outline" },
    },
    opts = {
      backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
      layout = { max_width = { 40, 0.2 }, width = nil, min_width = 10 },
      show_guides = true,
      attach_mode = "cursor",
    },
  },

  -- Better text objects (af, if, ac, ic for functions/classes)
  {
    "echasnovski/mini.ai",
    event = "VeryLazy",
    opts = { n_lines = 500 },
  },

  -- Commenting: gc / gcc
  {
    "echasnovski/mini.comment",
    event = "VeryLazy",
    opts = {},
  },

  -- Window picker (pick window by letter label)
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    event = "VeryLazy",
    version = "2.*",
    keys = {
      {
        "<leader>wp",
        function()
          local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
          vim.api.nvim_set_current_win(picked_window_id)
        end,
        desc = "Pick a window",
      },
    },
    opts = {
      filter_rules = {
        include_current_win = false,
        autoselect_one = true,
        bo = {
          filetype = { "neo-tree", "neo-tree-popup", "notify" },
          buftype = { "terminal", "quickfix" },
        },
      },
    },
  },

  -- Flash: jump anywhere with s/S
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s",     function() require("flash").jump() end,              mode = { "n", "x", "o" }, desc = "Flash jump" },
      { "S",     function() require("flash").treesitter() end,        mode = { "n", "x", "o" }, desc = "Flash treesitter" },
      { "r",     function() require("flash").remote() end,            mode = "o",               desc = "Remote flash" },
      { "R",     function() require("flash").treesitter_search() end, mode = { "o", "x" },      desc = "Treesitter search" },
      { "<C-s>", function() require("flash").toggle() end,            mode = "c",               desc = "Toggle flash search" },
    },
  },

  -- Accelerated j/k movement
  {
    "rhysd/accelerated-jk",
    event = "VeryLazy",
    config = function()
      vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)", {})
      vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)", {})
    end,
  },

  -- Git signs in the gutter
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
        untracked    = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, desc)
          vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
        end

        map("n", "]h", gs.next_hunk, "Next hunk")
        map("n", "[h", gs.prev_hunk, "Prev hunk")
        map("n", "<leader>hs", gs.stage_hunk, "Stage hunk")
        map("n", "<leader>hr", gs.reset_hunk, "Reset hunk")
        map("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        map("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        map("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
        map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("n", "<leader>hd", gs.diffthis, "Diff this")
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
      end,
    },
  },

  -- Which-key: keybinding popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      preset = "modern",
      delay = 500,
      spec = {
        { "<leader>b",  group = "buffers" },
        { "<leader>c",  group = "code" },
        { "<leader>d",  group = "debug" },
        { "<leader>f",  group = "find/files" },
        { "<leader>g",  group = "git" },
        { "<leader>h",  group = "git hunks" },
        { "<leader>l",  group = "lsp" },
        { "<leader>s",  group = "splits" },
        { "<leader>w",  group = "windows" },
        { "<leader>x",  group = "diagnostics/trouble" },
      },
    },
  },

  -- Autopairs: auto close brackets and quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      ts_config = { lua = { "string" }, javascript = { "template_string" } },
    },
    config = function(_, opts)
      local autopairs = require("nvim-autopairs")
      autopairs.setup(opts)
      -- Integrate with cmp
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Trouble: diagnostics panel
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",                        desc = "Workspace diagnostics" },
      { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",           desc = "Document diagnostics" },
      { "<leader>xl", "<cmd>Trouble loclist toggle<CR>",                            desc = "Location list" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<CR>",                             desc = "Quickfix list" },
      { "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>",               desc = "Symbols (Trouble)" },
      { "<leader>xL", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP definitions (Trouble)" },
    },
    opts = {},
  },
}
