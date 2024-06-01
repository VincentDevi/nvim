-- Show Line Number --
vim.wo.number = true

-- Inlay Hint --
vim.lsp.inlay_hint.enable(true, nil)

-- Yank copy to clipboard ( copy and paste for your computer is the same in Neovim ) --
vim.opt.clipboard = "unnamedplus"
