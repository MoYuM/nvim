return {
	------------------- UI ----------------------------
	"onsails/lspkind.nvim", -- cmp 的样式
	-- tokyonight theme
	{
		"folke/tokyonight.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000,
		config = function()
			local transparent = true
			if vim.g.neovide then
				transparent = false
			end
			require("tokyonight").setup({
				transparent = transparent,
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end,
			})
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- 状态条
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		dependencies = {
			"f-person/git-blame.nvim",
		},
		config = function()
			local ui = require("ui")
			local function moyum()
				return [[moyum]]
			end
			local git_blame = require("gitblame")
			vim.g.gitblame_date_format = "%r"
			vim.g.gitblame_message_template = "󰙊 <summary> • <date> • <author>"
			vim.g.gitblame_display_virtual_text = 0 -- disable virtual text
			vim.g.gitblame_date_format = "%r"

			require("lualine").setup({
				options = {
					theme = "tokyonight",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function()
								return ui.icons.Vim
							end,
						},
					},
					lualine_b = {
						{
							"branch",
							color = {
								fg = ui.colors.orange,
								gui = "bold",
							},
						},
					},
					lualine_x = {
            "copilot",
						{
							"diagnostics",
							symbols = {
								error = ui.icons.Error,
								warn = ui.icons.Warn,
								hint = ui.icons.Hint,
								info = ui.icons.Info,
							},
						},
					},
					lualine_y = {
						{
							"diff",
						},
					},
					lualine_z = { moyum },
					lualine_c = {
						{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available },
					},
				},
			})
		end,
	},

	{
		"MeanderingProgrammer/markdown.nvim",
		main = "render-markdown",
		opts = {},
		name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
}
