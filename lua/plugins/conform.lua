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
			javascript = { { "prettierd", "prettier" } },
			typescript = { { "prettierd", "prettier" } },
			svelte = { { "prettierd", "prettier" } },
			json = { { "jq", "prettierd", "prettier" } },
			rust = { "rustfmt" },
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
		},
	},
	init = function()
		-- If you want the formatexpr, here is the place to set it
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
