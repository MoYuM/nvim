return {
  {
    "kdheepak/lazygit.nvim", -- lazygit
    event = "VeryLazy",
  },

	-- git 状态显示
	-- TODO 自定义颜色
	{
		"lewis6991/gitsigns.nvim",
    event = "VeryLazy",
		config = function()
			require("gitsigns").setup({})
			-- require("scrollbar.handlers.gitsigns").setup()
		end,
	},
}
