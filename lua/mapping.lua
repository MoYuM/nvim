local wk = require("which-key")

wk.add({
	{ "3", "#", desc = "find next word under cursor" },
	{ "99", "<cmd>lua require('mo').moc()<cr>", desc = "test" },
	{ "<C-h>", ":MoveHChar(-1)<CR>", desc = "move char left" },
	{ "<C-j>", ":MoveLine(1)<CR>", desc = "move line down" },
	{ "<C-k>", ":MoveLine(-1)<CR>", desc = "move line up" },
	{ "<C-l>", ":MoveHChar(1)<CR>", desc = "move char right" },
	{ "<esc>", ":noh<cr>", desc = "no highlight" },
	{ "<leader><leader>", "<cmd>Telescope commands<cr>", desc = "Find Commands" },
	{ "<leader>a", "ggVG", desc = "Select all" },
	{ "<leader>ca", "<cmd>:lua vim.lsp.buf.code_action()<CR>", desc = "code action" },
  { "<leader>k", "<cmd>:lua vim.diagnostic.open_float()<CR>", desc = "show line diagnostics" },
	{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>g", "<cmd>LazyGit<CR>", desc = "git" },
	{
		"<leader>lg",
		"<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>",
		desc = "Live Grep",
	},
	{ "<leader>mc", "<cmd>MCunderCursor<cr>", desc = "MCunderCursor" },
	{ "<leader>o", "<cmd>lua require('telescope').extensions.recent_files.pick()<cr>", desc = "Recent files" },
	{ "<leader>rl", ":LspRestart<cr>", desc = "Restart lsp server" },
	{
		"<leader>rn",
		function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end,
		desc = "rename",
    expr = true,
	},
	{ "<leader>t", ":ToggleTerm<CR>", desc = "toggle terminal float" },
	{ "=", ":lua require('conform').format()<cr>", desc = "format" },
	{ "\\", ":Telescope resume<cr>", desc = "resume telescope" },
	{ "hd", "<cmd>:lua vim.lsp.buf.hover()<CR>", desc = "hover doc" },
})

wk.add({
	mode = { "v" },
	{ "<C-h>", ":MoveHBlock(-1)<CR>", desc = "move block left" },
	{ "<C-j>", ":MoveBlock(1)<CR>", desc = "move block down" },
	{ "<C-k>", ":MoveBlock(-1)<CR>", desc = "move block up" },
	{ "<C-l>", ":MoveHBlock(1)<CR>", desc = "move block right" },
})

wk.add({
	{ "<esc><esc>", "<C-\\><C-n>", desc = "quit term mode", mode = "t" },
})
