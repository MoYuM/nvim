return {
	"kdheepak/lazygit.nvim", -- lazygit

	-- git 状态显示
	-- TODO 自定义颜色
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},

	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
}
