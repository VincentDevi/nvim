return {
	"VonHeikemen/lsp-zero.nvim",
	branch = 'v3.x',
  	dependencies = {
		"neovim/nvim-lspconfig",
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
	},
	config = function()
		local lsp_zero = require("lsp-zero")

		lsp_zero.on_attach(function(client, bufnr)
      		local opts = { buffer = bufnr, remap = false }
		end)
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
			}
    		})
	end,
}
