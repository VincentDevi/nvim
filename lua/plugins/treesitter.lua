return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter").setup({
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
			},
		})
	end,
}
