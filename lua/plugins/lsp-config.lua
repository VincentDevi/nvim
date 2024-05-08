return {
    "neovim/nvim-lspconfig",
    config = function()
	    require("lspconfig").lua_ls.setup{}
	    -- Set Keymaps --
	    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, {})
    end,
}
