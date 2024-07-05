return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter").setup({
			opts = {
				autotag = { enable = true },
			},
			ensure_installed = {
				"rust",
				"lua",
				"c",
				"javascript",
				"go",
				"json",
				"regex",
				"scala",
				"sql",
				"svelte",
				"tmux",
				"typescript",
				"haskell",
				"vim",
				"bash",
				"markdown_inline",
				"markdown",
				"kdl",
				"csv",
				"xml"
			},
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = true,

			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,

			---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
			-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

			highlight = {
				enable = true,
			},
		})
	end,
}
