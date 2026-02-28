local map = vim.keymap.set

-- Better defaults
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Save / Quit
map({ "n", "i" }, "<C-s>", "<cmd>w<CR><Esc>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit all" })

-- Close buffer (NvChad-style: navigate to adjacent buffer first, then delete)
local function close_buffer(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  -- Terminal buffers
  if vim.bo[bufnr].buftype == "terminal" then
    vim.cmd(vim.bo[bufnr].buflisted and "set nobl | enew" or "hide")
    return
  end

  -- Floating windows: just wipe
  if vim.api.nvim_win_get_config(0).zindex then
    vim.cmd("bw")
    return
  end

  -- Unlisted buffers: just wipe
  if not vim.bo[bufnr].buflisted then
    vim.cmd("bw " .. bufnr)
    return
  end

  -- Listed buffers: switch to adjacent before deleting
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  if #bufs > 1 then
    vim.cmd("BufferLineCyclePrev")
  else
    vim.cmd("enew")
  end
  vim.cmd("bdelete " .. bufnr)
end

map("n", "<leader>x", close_buffer, { desc = "Close buffer" })

-- Window splits
map("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>ss", "<cmd>split<CR>", { desc = "Horizontal split" })

-- Window navigation (also handled by zellij-nav for pane passthrough)
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Window resize
map("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Buffer navigation
map("n", "<Tab>",   "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<A-j>",   "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
map("n", "<A-k>",   "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<leader>bd", close_buffer, { desc = "Close buffer" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "New buffer" })

-- Move lines in visual mode
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Better paste (don't overwrite register)
map("v", "p", '"_dP', { desc = "Paste without yanking" })

-- Diagnostic navigation
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })
