return {
	"stevearc/conform.nvim",
	event = {
		"BufReadPre",
		"BufNewFile",
	},
	cmd = { "ConformInfo" },
	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				local conform = require("conform")
				conform.format({ async = true, lsp_fallback = true })
				-- Customize the "injected" formatter
				conform.formatters.injected = {
					-- Set the options field
					options = {
						-- Set individual option values
						ignore_errors = true,
						lang_to_formatters = {
							json = { "jq" },
						},
					},
				}
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		-- Define your formatters
		formatters_by_ft = {
			lua = { "stylua" },
			javascriptreact = { "biome", "prettier", "prettierd" },
			javascript = { "biome", "prettier", "prettierd" },
			typescriptreact = { "biome", "prettier", "prettierd" },
			typescript = { "biome", "prettier", "prettierd" },
			svelte = { "biome", "prettier", "prettierd" },
			json = { "biome", "prettier", "prettierd" },
			rust = { "rustfmt" },
			go = { "gofmt" },
			php = { "php_cs_fixer" },
			python = { "black" }
		},
		-- Set up format-on-save
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		-- Customize formatters
		formatters = {
			shfmt = {
				prepend_args = { "-i", "2" },
			},
			jq = {
				prepend_args = { "--indent", "2" },
			},
			prettier = {
				extra_args = { "--tab-width", "2" },
			},
			prettierd = {
				extra_args = { "--tab-width", "2" },
			},
			php_cs_fixer = {
				command = "php-cs-fixer",
				args = { "fix",
					"--rules=@PSR2,single_blank_line_at_eof",
					"$FILENAME",
				},
			},
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
	config = function(_, opts)
		require("conform").setup(opts)
		require("conform").formatters.php_cs_fixer.cwd = require("conform.utils").root_file({ "composer.json" })
	end,
}
