local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("keymaps")
require("lazy").setup({
	{ import = "plugins" },
})

-- Show Line Number --
vim.wo.number = true

-- Set Theme --
vim.cmd.colorscheme("catppuccin")

-- Inlay Hint --
vim.lsp.inlay_hint.enable(true, nil)

-- Yank copy to clipboard ( copy and paste for your computer is the same in Neovim ) --
vim.opt.clipboard = "unnamedplus"
