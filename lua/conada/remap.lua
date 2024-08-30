vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


vim.keymap.set("n", "<C-d>pv", "<C-d>zz")
vim.keymap.set("n", "<C-u>pv", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Tabing
vim.keymap.set("n", "<Tab>", ">>_")
vim.keymap.set("n", "<S-Tab>", "<<_") 
vim.keymap.set("i", "<S-Tab>", "<C-D>")
vim.keymap.set("v", "<S-Tab>", "<gv")
vim.keymap.set("v", "<Tab>", ">gv")

-- Resize window
vim.keymap.set("n", "<C-l>", "<C-w><")
vim.keymap.set("n", "<C-h>", "<C-w>>")
vim.keymap.set("n", "<C-j>", "<C-w>-")
vim.keymap.set("n", "<C-k>", "<C-w>+")
