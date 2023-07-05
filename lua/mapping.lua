local wk = require("which-key")

local function map(mode, lhs, rhs, desc)
  wk.register({
    [lhs] = { rhs, desc },
  }, {
    mode = mode,
  })
end

-- leader
vim.g.mapleader = " "

-- go back
map("n", "-", "<C-o>")

local Config = require("flash.config")
local Char = require("flash.plugins.char")
for _, motion in ipairs({ "f", "t", "F", "T" }) do
  vim.keymap.set({ "n", "x", "o" }, motion, function()
    require("flash").jump(Config.get({
      mode = "char",
      search = {
        mode = Char.mode(motion),
        max_length = 1,
      },
    }, Char.motions[motion]))
  end)
end

-- restart lsp server
map("n", "<leader>lr", ":LspRestart<cr>", "Restart lsp server")

-- format
map("n", "=", ":Neoformat<cr>", "Format")

-- quit
map("n", "<leader>q", ":wqa<cr>", "Quit neovim")

wk.register({
	["3"] = { "#", "find next word under cursor" },
	["\\"] = { ":Telescope resume<cr>", "resume telescope" },
})

-- leap
vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward-to)')
vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward-to)')
vim.keymap.set({'n', 'x', 'o'}, 't', '<Plug>(leap-forward-till)')
vim.keymap.set({'n', 'x', 'o'}, 'T', '<Plug>(leap-backward-till)')

-- lsp
wk.register({
	["gh"] = { "<cmd>Lspsaga lsp_finder<CR>", "lsp finder" },
	["gr"] = { "<cmd>Lspsaga rename<CR>", "rename" },
	["gd"] = { "<cmd>Lspsaga peek_definition<CR>", "peek definition" },
	["hd"] = { "<cmd>Lspsaga hover_doc<CR>", "hover doc" },
	["d]"] = { "<cmd>Lspsaga diagnostic_jump_next<CR>", "jump to next diagnostics" },
	["d["] = { "<cmd>Lspsaga diagnostic_jump_prev<CR>", "jump to prev diagnostics" },
})

-- move line
wk.register({
	["<C-j>"] = { ":MoveLine(1)<CR>", "move line downo" },
	["<C-k>"] = { ":MoveLine(-1)<CR>", "move line up" },
	["<C-h>"] = { ":MoveHChar(-1)<CR>", "move char left" },
	["<C-l>"] = { ":MoveHChar(1)<CR>", "move char right" },
})

wk.register({
	["a"] = { "ggVG", "Select all" },
	["ca"] = { "<cmd>Lspsaga code_action<CR>", "code action" },
	["k"] = { "<cmd>Lspsaga show_line_diagnostics<CR>", "show line diagnostics" },
	["K"] = { "<cmd>Lspsaga show_buf_diagnostics<CR>", "show buffer diagnostics" },
	["O"] = { "<cmd>Lspsaga outline<CR>", "show outline" },
	["g"] = { "<cmd>LazyGit<CR>", "lazygit" },
	["f"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
	["lg"] = { "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>", "Live Grep" },
	["o"] = { "<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", "Recent files" },
}, {
	prefix = "<leader>",
})

wk.register({
	["<C-j>"] = { ":MoveBlock(1)<CR>", "move block down" },
	["<C-k>"] = { ":MoveBlock(-1)<CR>", "move block up" },
	["<C-h>"] = { ":MoveHBlock(-1)<CR>", "move block left" },
	["<C-l>"] = { ":MoveHBlock(1)<CR>", "move block right" },
}, {
	mode = "v",
})

-- toggle terminal
wk.register({
	["<D-j>"] = { ":ToggleTerm direction=float<CR>", "toggle terminal float" },
}, {
	mode = "n",
})
wk.register({
	["<esc>"] = { "<C-\\><C-n>", "quit term mode" },
}, {
	mode = "t",
})
