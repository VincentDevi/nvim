return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local signs = require("gitsigns")
		signs.setup({})
		-- Set keymap --
		vim.keymap.set("n", "<leader>tb", signs.toggle_current_line_blame)
	end,
}
