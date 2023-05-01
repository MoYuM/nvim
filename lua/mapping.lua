local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, opts or options)
end

-- leader
vim.g.mapleader = " "

-- basic
map("n", "<C-o>", "<C-o>zz")

-- lspsaga
map("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
map("n", "gr", "<cmd>Lspsaga rename<CR>")
map("n", "gd", "<cmd>Lspsaga peek_definition<CR>")
map("n", "hd", "<cmd>Lspsaga hover_doc<CR>")
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>")
map("n", "<leader>k", "<cmd>Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>K", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- lazygit
map("n", "<leader>gg", "<cmd>LazyGit<CR>")

-- Normal-mode commands
map('n', '<C-j>', ':MoveLine(1)<CR>')
map('n', '<C-k>', ':MoveLine(-1)<CR>')
map('n', '<C-h>', ':MoveHChar(-1)<CR>')
map('n', '<C-l>', ':MoveHChar(1)<CR>')

-- Visual-mode commands
map('v', '<C-j>', ':MoveBlock(1)<CR>')
map('v', '<C-k>', ':MoveBlock(-1)<CR>')
map('v', '<C-h>', ':MoveHBlock(-1)<CR>')
map('v', '<C-l>', ':MoveHBlock(1)<CR>')

map("i", '<Tab>', function()
  local copilot = require("copilot.suggestion")
  if copilot.is_visible() then
    copilot.accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
  end
end)
