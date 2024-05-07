-- Set leader key to space
vim.g.mapleader = ' '


local keymap = vim.keymap
keymap.set("n", "<leader>vs", ":vs<CR>")
keymap.set("n", "<leader>hs", ":split<CR>")
