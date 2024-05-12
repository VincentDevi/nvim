-- Set leader key to space
vim.g.mapleader = ' '


local keymap = vim.keymap
keymap.set("n", "<leader>vs", ":vs<CR>")
keymap.set("n", "<leader>hs", ":split<CR>")

-- Toggle Inlay Hint -- 
keymap.set("n", "<leader>h", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>")
