local map = require("utils").map

map("i", "kj", "<esc>")

-- prevent clipboard override by selected text when pasting
map("x", "p", "\"_dP")

-- exit vim
map("n", "<leader>q", ":q<cr>", "Exit")
map("n", "<leader>Q", ":q!<cr>", "Force exit")

-- buffer
map("n", "<leader>bn", ":bnext<cr>", 'Next buffer')
map("n", "<leader>bp", ":bprev<cr>", 'Previous buffer')
map("n", "<leader>bd", ":bd<cr>", 'Delete buffer')
map("n", "<leader>bD", ":bd!<cr>", 'Force delete buffer')

-- window
map("n", "<leader>w", "<C-w>", "Window actions")

-- save
map("n", "<leader>s", ":w<cr>", "Save file")

-- select all
map("n", "<leader>a", "ggVG", "Select all")

-- exit terminal mode
map("t", "<Esc>", [[<C-\><C-n><CR>]])
