return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<CR>",                desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",                 desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",                   desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",                 desc = "Help tags" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",                  desc = "Recent files" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>",      desc = "Document symbols" },
      { "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<CR>",     desc = "Workspace symbols" },
      { "<leader>fd", "<cmd>Telescope diagnostics<CR>",               desc = "Diagnostics" },
      { "<leader>gc", "<cmd>Telescope git_commits<CR>",               desc = "Git commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<CR>",              desc = "Git branches" },
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          mappings = {
            i = {
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
              ["<Esc>"] = actions.close,
            },
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            find_command = vim.fn.executable("fd") == 1
              and { "fd", "--type", "f", "--strip-cwd-prefix" }
              or nil,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
        },
      })

      telescope.load_extension("fzf")
    end,
  },
}
