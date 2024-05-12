return {
	"VonHeikemen/lsp-zero.nvim",
	branch = 'v3.x',
  	dependencies = {
		"neovim/nvim-lspconfig",
		"lvimuser/lsp-inlayhints.nvim",
		{
      		"williamboman/mason.nvim",
      			build = function()
        			pcall(vim.cmd, "MasonUpdate")
      			end,
   		 },
		"hrsh7th/cmp-nvim-lsp",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		{
  			"mrcjkb/rustaceanvim",
  			version = '^4', -- Recommended
  			lazy = false, -- This plugin is already lazy
		},
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
      		local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))

		end)
		-- Rust LSP configuration -- 

		vim.g.rustaceanvim = {
  			server = {
    				capabilities = lsp_zero.get_capabilities()
  			},
			default_settings = {
     			 -- rust-analyzer language server configuration
      				['rust-analyzer'] = {
					check = {
						command = "clippy"
					},
      				},
    			},
		}
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"tsserver",
				"tailwindcss",
				"gopls",
				"htmx"
			},
			handlers={
				lsp_zero.default_setup,
				rust_analyzer = lsp_zero.noop,
			}
    		})
	end,
}
