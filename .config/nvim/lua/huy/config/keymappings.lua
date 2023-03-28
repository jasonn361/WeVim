-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert and view mode
keymap.set("i", "jk", "<ESC>")

-- save file
keymap.set('n', '<C-s>', ':w<CR>')

-- exit file
keymap.set('n', '<C-q>', ':q<CR>')
keymap.set('n', '<ESC>', ':q!<CR>')

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sc", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tc", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab



--------------------
-- Plugin Keybinds
--------------------

-- Neo-Tree

-- Toggle Filesystem
keymap.set('n', '<leader>e', '<cmd>Neotree reveal left filesystem toggle<CR>')
keymap.set('n', '<leader>r', '<cmd>Neotree float filesystem toggle<CR>')
keymap.set('n', '<leader>g', '<cmd>Neotree float git_status toggle<CR>')

