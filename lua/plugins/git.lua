return {
	"kdheepak/lazygit.nvim", -- lazygit
	"tpope/vim-fugitive", -- 使用 git 命令，和一些 git 工具

	-- git 状态显示
	-- TODO 自定义颜色
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
			require("scrollbar.handlers.gitsigns").setup()
		end,
	},
}
