return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use("wbthomason/packer.nvim")
		use("nvim-lua/plenary.nvim")
		use("folke/tokyonight.nvim")

		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			-- or                            , branch = '0.1.x',
			requires = { { "nvim-lua/plenary.nvim" } },
		})

		use({
			"phaazon/hop.nvim",
			branch = "v2", -- optional but strongly recommended
			config = function()
				-- you can configure Hop the way you like here; see :h hop-config
				require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
			end,
		})

		use({
			"rmagatti/auto-session",
			config = function()
				require("auto-session").setup({
					log_level = "error",
					auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
				})
			end,
		})

		use("f-person/git-blame.nvim")


		use({
			"ms-jpq/coq.artifacts",
			branch = "artifacts",
		})

		use({
			"Pocco81/auto-save.nvim",
			config = function()
				require("auto-save").setup({
					enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
					execution_message = {
						message = function() -- message to print on save
							return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
						end,
						dim = 0.18, -- dim the color of `message`
						cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
					},
					trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
					-- function that determines whether to save the current buffer or not
					-- return true: if buffer is ok to be saved
					-- return false: if it's not ok to be saved
					condition = function(buf)
						local fn = vim.fn
						local utils = require("auto-save.utils.data")

						if
							fn.getbufvar(buf, "&modifiable") == 1
							and utils.not_in(fn.getbufvar(buf, "&filetype"), {})
						then
							return true -- met condition(s), can save
						end
						return false -- can't save
					end,
					write_all_buffers = false, -- write all buffers when the current one meets `condition`
					debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
					callbacks = { -- functions to be executed at different intervals
						enabling = nil, -- ran when enabling auto-save
						disabling = nil, -- ran when disabling auto-save
						before_asserting_save = nil, -- ran before checking `condition`
						before_saving = function()
              
							vim.call("Neoformat")
						end, -- ran before doing the actual save
						after_saving = nil, -- ran after doing the actual save
					},
				})
			end,
		})

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = function()
				local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
				ts_update()
			end,
		})

		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons", -- optional, for file icons
			},
			tag = "nightly", -- optional, updated every week. (see issue #1193)
		})

		use("sbdchd/neoformat")

		use("neovim/nvim-lspconfig")
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use {
'hrsh7th/nvim-cmp',
configure = function()
 -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })
-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
    capabilities = capabilities
  }
end
    }
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'
		use({
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup()
			end,
		})
	end,
	config = {
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
