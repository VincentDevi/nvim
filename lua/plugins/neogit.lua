return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		require("neogit").setup({})

		-- Set Keymaps --
		local keymap = vim.keymap
		keymap.set("n", "<leader>ng", ":Neogit<CR>")
	end,
}
