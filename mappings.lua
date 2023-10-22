---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    -- disable default mappings
    ["<leader>fm"] = "",
    ["<leader>e"] = "",
    ["<leader>fo"] = "",
    ["<leader>ma"] = "",
  }
}

M.general = {
  n = {
    -- common
    ["3"] = { "#", "find next word under cursor" },

    -- NvimTree
    ["1"] = { "<cmd>:NvimTreeFindFileToggle<cr>", "open nvim tree" },

    -- lazygit
    ["<leader>g"] = { "<cmd>LazyGit<CR>", "lazygit" },

    -- Telescope
    ["\\"] = { ":Telescope resume<cr>", "resume telescope" },
    ["<leader><leader>"] = { "<cmd>Telescope commands<cr>", "all commands" },

    -- move
    ["<C-j>"] = { ":MoveLine(1)<CR>", "move line downo" },
    ["<C-k>"] = { ":MoveLine(-1)<CR>", "move line up" },
    ["<C-h>"] = { ":MoveHChar(-1)<CR>", "move char left" },
    ["<C-l>"] = { ":MoveHChar(1)<CR>", "move char right" },

    -- Lsp
    ["<leader>lr"] = { ":LspRestart<cr>", "Restart lsp server" },
    ["<leader>o"] = { "<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", "Find oldfiles" },

    -- format
    ["="] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "LSP formatting",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!

return M
