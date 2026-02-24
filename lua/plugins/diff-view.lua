return {
	"sindrets/diffview.nvim",
	config = function()
		require("diffview").setup({
			diff_binaries = false, -- Show diffs for binaries
			enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
			git_cmd = { "git" }, -- The git executable for use
			keymaps = {
				vim.keymap.set("n", "<leader>dv", function()
					require("diffview").open()
				end),
				vim.keymap.set("n", "<leader>dvc", function()
					require("diffview").close()
				end),
			},
		})
	end
}
