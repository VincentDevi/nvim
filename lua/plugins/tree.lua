return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})

		-- Set Keymaps --
		local keymap = vim.keymap
		keymap.set("n", "<leader>r", ":NvimTreeToggle<CR>")
		keymap.set("n", "<leader>ee", ":NvimTreeFocus<CR>")
	end,
}
