return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			view = {
				side = "right",
				width = 75,
			},
			filters = {
				dotfiles = true,
			},
		})

		-- Set Keymaps --
		local keymap = vim.keymap
		keymap.set("n", "<leader>r", "<CMD>:NvimTreeToggle<CR>")
		keymap.set("n", "<leader>ee", "<CMD>:NvimTreeFocus<CR>")
	end,
}
