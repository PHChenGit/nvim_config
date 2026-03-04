return {
  "f-person/git-blame.nvim",
  event = "VeryLazy",
  opts = {
    enabled = true,
    message_template = " <sha> • <author> • <date>",
    date_format = "%Y-%m-%d",
  },
  keys = {
    { "<leader>gs", "<cmd>GitBlameCopySHA<cr>", desc = "Copy commit SHA" },
    { "<leader>go", "<cmd>GitBlameOpenCommitURL<cr>", desc = "Open commit URL" },
    { "<leader>gt", "<cmd>GitBlameToggle<cr>", desc = "Toggle git blame" },
  },
}
