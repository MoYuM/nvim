---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["1"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
    ["<leader>g"] = { "<cmd> LazyGit<cr>", "LazyGit" }
  },
}

-- more keybinds!

return M
