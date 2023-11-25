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
							fmt = function(str)
								return ui.icons.Vim .. str
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
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

  {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
}
}
