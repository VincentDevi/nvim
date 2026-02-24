return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", build = ":MasonUpdate" },
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			{ "mrcjkb/rustaceanvim",     version = "^4",        lazy = false },
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Replaces lsp_zero.on_attach
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf, remap = false }
					vim.keymap.set("n", "K", vim.lsp.buf.hover,
						vim.tbl_extend("force", opts, { desc = "LSP Hover" }))
					vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references,
						vim.tbl_extend("force", opts, { desc = "Find References" }))
					vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition,
						vim.tbl_extend("force", opts, { desc = "Go To Definition" }))
				end,
			})

			-- rustaceanvim manages rust_analyzer, so we just pass capabilities
			vim.g.rustaceanvim = {
				server = { capabilities = capabilities },
				default_settings = {
					["rust-analyzer"] = {
						check = { command = "clippy" },
					},
				},
			}

			require("mason").setup()

			-- Let mason-lspconfig ensure servers are installed
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"lua_ls",
					"tailwindcss",
					"htmx",
					"jsonls",
					"gopls",
					-- rust_analyzer still installed via mason but managed by rustaceanvim
					"rust_analyzer",
					"intelephense",
				},
			})

			-- Server configs: add any server-specific options here
			local servers = {
				lua_ls = {},
				gopls = {},
				jsonls = {},
				tailwindcss = {
					filetypes = {
						"html", "javascriptreact", "typescriptreact",
						"vue", "svelte", "rust", "go",
					},
					init_options = {
						userLanguages = { rust = "html" },
					},
				},
				htmx = {
					filetypes = { "html", "htmx" },
				},
			}

			for server, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
		end,
	},
}
